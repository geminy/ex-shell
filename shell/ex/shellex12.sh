#!/bin/bash
# Program:
#    This script accepts the flowing parameter: one, two or three.
# History:
#     2015/8/31 Blithe First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "This program will print your selection!"
#read -p "Input your choice: " choice
#case $choice in
case $1 in
	"one")
		echo "Your choice is ONE"
		;;
	"two")
		echo "Your choice is TWO"
		;;
	"three")
		echo "Your choice is THREE"
		;;
	*)
		echo "Usage $0 {one|two|three}"
		;;
esac
