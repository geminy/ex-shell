#!/bin/bash
# Program:
#     User input 2 integer numbers, program will cross these two numbers.
# History:
#     2015/8/27 Blithe First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo -e "Your SHOULD input 2 numbers, I will cross them!\n"
read -p "first number: " firstnum
read -p "second number: " secondnum
total=$(($firstnum*$secondnum))
# same as belows
# declare -i total=$firstnum*$secondnum
echo -e "\nThe result of $firstnum x $secondnum = $total"
