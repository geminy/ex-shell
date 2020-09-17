#!/bin/bash
# Program:
#     Program creates three files, which named by user's input and date command.
# History:
#     2015/8/27 Blithe First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 1.input filename from user
echo -e "I will use 'touch' command to create 3 files."
read -p "Please input your filename: " fileuser

# 2. input check
filename=${fileuser:-"filename"}
 
# 3. use date
data1=$(date --date='2 days ago' +%Y%m%d)
data2=$(date --date='1 days ago' +%Y%m%d)
data3=$(date +%Y%m%d)
file1=${filename}${data1}
file2=${filename}${data2}
file3=${filename}${data3}

# 4. create files
touch "$file1"
touch "$file2"
touch "$file3"
