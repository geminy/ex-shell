##################################################
# file: copyfiles.sh                             #
# func: copy files                               #
# note: used for single file, not directory      #
# date: 2015/08/03                               #
##################################################
#!/bin/bash

# no space of =
PARAMNUM=$#
SRC=$1
NUM=$2

copy_doing()
{
	copy_dir=$SRC"_copy"_$NUM
	if [ ! -e $copy_dir ]; then
		mkdir $copy_dir
		echo "mkdir $copy_dir"
	fi

	for i in $(seq 1 $NUM); do
		tmp=$i"-"$SRC
		cp $SRC $copy_dir/$tmp
		echo "cp $SRC $copy_dir/$tmp"
	done
}

check_input()
{
	# space at left-right side of []
	if [ $PARAMNUM -ne 2 ]; then
		echo "input format: <command> <src> <num>"
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

# code block in {}
main() 
{
	check_input
	copy_doing
}

# no () when calling main
main

echo "Done ^_^"
