#!/bin/bash
echo "Enter a proper linux command which you want to execute on all the servers at once:"
read usercommand
IFS=','               #IFS – Internal Field Separator- to read the arguments seperated by comma.
for i in $@;          #Will take hostnames seperated by comma as a input
do
`ssh root@$i $usercommand`  # will make ssh connection with host server and execute the command on all the servers on by one.
done

# We can execute the script using below command
#./script.sh server1,server2,server3
