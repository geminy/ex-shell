#!/usr/bin/env bash

readonly input_argc=$#
readonly input_exec=$0
readonly project_root=$1
readonly project_framework="framework"
readonly project_platform="platform"
readonly project_system="system"
readonly line_prefix="INCLUDEPATH += \$\$PWD"
output_file="help.pri"

if [ 1 != $input_argc ]; then
	echo "usage:"
	echo -e "\t$input_exec <project_root_directory>"
	exit
fi

if [ ! -d $project_root ]; then
	echo "'$project_root' invalid."
	exit
fi

check_dir()
{
	if [ -z $1 ]; then
		echo "warning: null args."
	 	exit
	fi
	if [ ! -d $1 ]; then
		echo "error: $1 not exists."
		exit
	fi
}

root_abs=`cd $project_root; pwd`
framework_abs="$root_abs/$project_framework"
platform_abs="$root_abs/$project_platform"
system_abs="$root_abs/$project_system"

check_dir $framework_abs
check_dir $platform_abs
check_dir $system_abs

root_abs_len=${#root_abs}
output_file=$root_abs/$output_file
rm -f $output_file

find_include()
{
	if [ -d $1 ]; then
		echo ${line_prefix}${1:$root_abs_len} >> $output_file
		for f in `ls $1`
		do
			find_include "$1/$f"
		done
	fi
}

find_include $framework_abs
find_include $platform_abs
find_include $system_abs
