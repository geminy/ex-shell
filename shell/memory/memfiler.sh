#!/bin/sh

readonly MEMFILER_EXE="/data/memfiler.sh"
readonly MEMFILER_AWK="/data/memfiler.awk"

main()
{
    local pid=`ps | grep AppLauncher | awk '{print $2}' | sed '$d'`
    local status="/proc/$pid/status"
    local smaps="/proc/$pid/smaps"
    echo "`date +%y%m%d-%H%M%S`"
    echo "$(cat $status | grep -E "^Name:|^Pid:")"
    echo "$(awk -f $MEMFILER_AWK $smaps)"
}

main
