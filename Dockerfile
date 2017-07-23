# Pull the Centos image from Docker Public Repo
FROM centos:latest
# Install the epel repo
RUN yum install -y epel-release

# Installation of Apache, MongoDB and Python 2.7
RUN yum update \
    || yum install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    python-pip \
    python2.7 \
    python2.7-dev \
    ssh \
    python2-pip \
    mongodb \
    tomcat

#Install WGET
RUN yum install -y wget

 #Install tar
RUN yum install -y tar

 # Download JDK
RUN cd /opt;wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz; pwd

RUN cd /opt;tar xvf jdk-7u55-linux-x64.tar.gz
RUN alternatives --install /usr/bin/java java /opt/jdk1.7.55/bin/java 2

 # Download Apache Tomcat 8
RUN cd /opt;wget http://mirror.fibergrid.in/apache/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15.tar.gz

 # untar and move to proper location
RUN cd /opt;tar zxvf apache-tomcat-8.5.15.tar.gz
RUN mkdir /opt/tomcat

RUN chmod -R 755 /opt/tomcat

ENV JAVA_HOME /opt/jdk1.7.0_55

EXPOSE 8080

CMD /opt/apache-tomcat-8.5.15/bin/catalina.sh run

# We can save the following file on root directory and excute the below command to execute the Docker file.
# docker run -p 7080:8080 -dit testdocker
