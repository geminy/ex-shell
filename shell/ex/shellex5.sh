#!/bin/bash
# Program:
#     User input a filename, program will check the flowing:
#     1) exist? 2) file/directory? 3) file premissions
# History:
#     2015/8/28 Blithe First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 1. input filename and check zero
echo -e "Please input a filename, I will check the filename's type and permission.\n\n"
read -p "Input a filename: " filename
test -z $filename && echo "You MUST input a filename." && exit 0

# 2. check exist
test ! -e $filename && echo "The filename '$filename' DO NOT exist" && exit 0

# 3. check type and permissions
test -f $filename && filetype="regular file"
test -d $filename && filetype="directory"
test -r $filename && perm="readable"
test -w $filename && perm+="-writable"
test -x $filename && perm+="-executable"

# 4. output
echo "The filename: $filename is a $filetype"
echo "And the permissions are: $perm"
