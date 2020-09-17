# for repo sync error, e.g.
# error: error_path: contains uncommitted changes

#!/usr/bin/env bash

CMD_TYPE=("stash" "checkout")
ARGS_NUM=$#
ARGS_CMD=$0
ARGS_FILE=$1
ARGS_TYPE=$2

input_format()
{
	echo "format: <$ARGS_CMD> <file> <type>"
	echo -e "\t<$ARGS_CMD>: execute at PROJECT-ROOT-PATH"
	echo -e "\t<file>: contais the error_path line by line"
	echo -e "\t<type>: stash or checkout"
}

check_input()
{
	echo $ARGS_NUM
	[ 2 != $ARGS_NUM ] && input_format && exit
	echo $ARGS_CMD
	echo $ARGS_FILE
	[ ! -f $ARGS_FILE ] && echo "<$ARGS_FILE> not exists or not a regular file!!" && exit
	echo $ARGS_TYPE
	for type in ${CMD_TYPE[*]}
	do
		[ $ARGS_TYPE == $type ] && return
	done
	echo "<$ARGS_TYPE> input error" && exit
}

git_stash()
{
	echo "git stash"
	for line in `cat $ARGS_FILE`
	do
		echo $line
		cd $line
		pwd
		ret=`git stash`
		echo "git-stash [$ret]"
		cd -
	done
	echo "git stash done"
}

git_checkout()
{
	echo "git checkout"
	for line in `cat $ARGS_FILE`
	do
		echo $line
		cd $line
		pwd
		ret=`git checkout .`
		echo "git-checkout [$ret]"
		cd -
	done
	echo "git checkout done"
}

repo_process()
{
	git_$ARGS_TYPE
}

main()
{
	check_input
	repo_process
}

main
