#!/usr/bin/env bash

FILE=$1
echo "file:$FILE"

TARGET_MATCH="servicemanager"
echo "match:$TARGET_MATCH"

for line in `cat $FILE`
	do
		echo "$line"
		cat $line | grep $TARGET_MATCH && exit
	done
