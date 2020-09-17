#!/bin/bash
# Program:
#     You input your demobilization date, I calculate how many days before you demobilize.
# History:
#     2015/8/28 Blithe First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 1. hint
echo "This program will try to calculate:"
echo "How many days before your demobilization date..."
read -p "Please input your demobilization date(YYYYMMDD ex > 20150828): " date2

# 2. check
date_d=$(echo $date2 | grep '[0-9]\{8\}')
if [ "$date_d" == "" ]; then
	echo "You input the wrong date format..."
	exit 1
fi

# 3. calculate
declare -i date_dem=`date --date="$date2" +%s`
declare -i date_now=`date +%s`
declare -i date_total_s=$(($date_dem-$date_now))
declare -i date_d=$(($date_total_s/60/60/24))

if [ "$date_total_s" -lt "0" ]; then
	echo "You have been demobilized before: "$((-1*$date_d))" days"
else
	declare -i date_h=$(($(($date_total_s-$date_d*60*60*24))/60/60))
	echo "You will demobilize after $date_d days and $date_h hours."
fi
