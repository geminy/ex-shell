#!/bin/bash
# Program:
#     User inputs his first name and last name. Program shows  his full name.
# History:
#     2015/8/27 Blithe First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

read -p "Please input your first name: " firstname # input hint and read
read -p "Please input your last name: " lastname # input hint and read
echo -e "\nYour full name is: $firstname $lastname" # output
