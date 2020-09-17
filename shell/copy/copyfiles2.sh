###################################################
# file: copyfiles.sh                              #
# func: copy files                                #
# note: used for single file in current directory #
# date: 2015/10/28                                #
###################################################
#!/bin/bash

# no space of =
PARAMNUM=$#
CMD=$0
SRC=$1
NUM=$2
SUFFIX=".qml"
SUFFIXSZ=4

copy_doing()
{
	src_size=`expr length $SRC`
	pre_size=$(expr $src_size - $SUFFIXSZ)
	pre_content=$(expr substr $SRC 1 $pre_size)
	copy_dir=$SRC"_copy"_$NUM

	for i in $(seq 1 $NUM); do
		tmp=$pre_content$i$SUFFIX
		cp $SRC $tmp
		echo "cp $SRC $tmp"
	done
}

check_input()
{
	if [ $PARAMNUM -ne 2 ]; then
		echo "input format: $CMD <src> <num>"
		exit
	fi
 
	if [ ! -e $SRC ]; then
		echo "<$SRC> doesn't exist!!"
		exit
	elif [ ! -f $SRC ]; then
		echo "<$SRC> not a file!!"
		exit
	fi

	# =~ for regular expression
	# double [] and space for =~ 
	if [[ ! $NUM =~ ^[0-9]+$ ]]; then
		echo "<$NUM> not a number!!"
		exit
	fi
}

main() 
{
	check_input
	copy_doing
}

main

echo "Done ^_^"
