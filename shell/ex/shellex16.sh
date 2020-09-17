#!/bin/bash
# Program:
#    Use id, finger command to check system account's information.
# History:
#     2015/9/02 Blithe First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

users=$(cut -d ':' -f1 /etc/passwd)
for username in $users
do
	id $username
	finger $username
	echo "----------"
done
