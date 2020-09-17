#!/bin/bash
# Program:
#    Repeat question until user input correct answer.
# History:
#     2015/9/02 Blithe First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

until [ "$yn" == "yes" -o "$yn" == "YES" ]
do
	read -p "Please input yes/YES to stop this prigram: " yn
done
echo "OK! you input the correct answer."