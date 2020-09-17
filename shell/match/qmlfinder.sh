#!/bin/bash
#Program:
#	This program helps users to add qml files from the prefix of one qrc file.
#History:
#	2015/09/02 QmlFW v0.1
PATH=/bin:/sbin:/usr/bin/:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

QRCPATH=""
PREFIXMATCH="false"
FINALRESULT=""

function input_format() {
	echo "<appname>: your app name"
	echo "<qrcname>: qrc name of your app"
	echo "<qrcprefix>: qrc prefix"
	echo "<viewtype>: 'view' 'mainscreen' 'sidescreen' 'layeritem' 'ons'"
}

function type_wrong() {
	echo "$1 is a wrong type"
	echo "<viewtype>: 'view' 'mainscreen' 'sidescreen' 'layeritem' 'ons'"
	exit 1
}

function data_process() {
case $1 in
	"view")
		echo PRELOADVIEW\(\"$2\"\) >> $FINALRESULT
		;;
	"mainscreen")
		echo PRELOADMAINSCREEN\(\"$2\"\) >> $FINALRESULT
		;;
	"sidescreen")
		echo PRELOADSIDESCREEN\(\"$2\"\) >> $FINALRESULT
		;;
	"layeritem")
		echo PRELOADLAYERITE\(\"$2\"\) >> $FINALRESULT
		;;
	"ons")
		echo PRELOADONS\(\"$2\"\) >> $FINALRESULT
		;;
	*)
		echo "exception!!"
		exit 1
		;;
esac
}

#1. input check
if [ $# != 4 ]; then #args num check
	echo -e "input format:\n\t$0 <appname> <qrcname> <qrcprefix> <viewtype>"
	input_format
	echo -e "for example:\n\t$0 TDHome view.qrc /TDHome/view view"
	exit 1
else
	test ! -e $1 && echo "$1 not exist" && exit 1 #appname check
	test ! -d $1 && echo "$1 not a directory" && exit 1
	QRCPATH=$(find $1 -name $2) #qrcname check
	if [ "$QRCPATH" == "" ]; then
		echo "$2 not exist"
		exit 1
	else
		qrcnum=$(echo "$QRCPATH" | grep -c $2)
		[ $qrcnum != 1 ] && echo "$2 conflict" && exit 1
	fi
	grep $3 $QRCPATH > /dev/null #qrcprefix check
	[ $? != 0 ] && echo "$3 not found" && exit 1
	[ $4 == "view" -o \
	  $4 == "mainscreen" -o \
      $4 == "sidescreen" -o \
	  $4 == "layeritem" -o \
	  $4 == "ons" ] || type_wrong $4 #viewtype check
fi

#2. create result file
FINALRESULT=$4_result
if [ ! -e $FINALRESULT ]; then
	touch $FINALRESULT
else
	echo \/\/\ $1\ $2\ $3\ $4 >> $FINALRESULT
fi

#3. read file and process data
for line in `cat $QRCPATH`
do
	if [ $PREFIXMATCH == "false" ]; then
		echo $line | grep $3 | grep -v "\/>" > /dev/null
		[ $? == 0 ] && PREFIXMATCH="true"
	elif [ $line == "</qresource>" ]; then
		break
	else
		data=$(echo $line | sed 's/<file>//g' | sed 's/.qml<\/file>//g')
		data_process $4 $data
	fi
done

echo "---------- DONE ----------"
