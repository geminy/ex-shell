# usage
#   awk -f memfiler.awk smaps
#
# memflag
#   other: 0
#   mmap : 1
#   stack: 2
#   pvr  : 3
#   res  : 4
#   heap : 5
#   ro   : 6
#   data : 7
#   text : 8

BEGIN {
    memflag=0; inproto=0;
    totalMmap=0;
    totalStack=0;
    totalGpu=0;
    totalRes=0;
    totalHeap=0;
    totalRO=0;
    totalData=0;
    totalText=0;
    totalOther=0;
    totalProto=0;
}

{
    if (NF != 0) {
        if ($1 ~ /^[0-9a-f]/) {
            if (NF == 5 && $5 == 0) {
                memflag = 1;
            }
            else if (NF == 6 && $6 ~ /stack/) {
                memflag = 2;
            }
            else if (NF == 6 && $6 ~ /pvrsrvkm/) {
                memflag = 3;
            }
            else if (NF == 6 && ($6 ~ /\/usr\/share/ || $6 ~ /\/system\/fonts/)) {
                memflag = 4;
            }
            else if (NF == 6 && $6 ~ /heap/) {
                memflag = 5;
            }
            else if ($2 ~ /r--p/ || $2 ~ /r--s/) {
                memflag = 6;
            }
            else if ($2 ~ /rw-p/ || $2 ~ /rw-s/) {
                memflag = 7;
            }
            else if ($2 ~ /r-xp/ || $2 ~ /r-xs/) {
                memflag = 8;
            }
            else {
                memflag = 0;
            }

            if (NF == 6 && $6 ~ /proto/) {
                inproto = 1;
            }
            else {
                inproto = 0;
            }
        }

        if ($1 ~ /^Rss/) {
            if (memflag == 1) {
                totalMmap += $2;
            }
            else if (memflag == 2) {
                totalStack += $2;
            }
            else if (memflag == 3) {
                totalGpu += $2;
            }
            else if (memflag == 4) {
                totalRes += $2;
            }
            else if (memflag == 5) {
                totalHeap += $2;
            }
            else if (memflag == 6) {
                totalRO += $2;
            }
            else if (memflag == 7) {
                totalData += $2;
            }
            else if (memflag == 8) {
                totalText += $2;
            }
            else {
                totalOther += $2;
            }

            if (inproto == 1) {
                totalProto += $2;
            }
        }
    }
}

END {
    print "Total Mmap:\t", totalMmap;
    print "Total Stack:\t", totalStack;
    print "Total GPU:\t", totalGpu;
    print "Total Resource:\t", totalRes
    print "Total Heap:\t", totalHeap
    print "Total ROData:\t", totalRO
    print "Total Data:\t", totalData
    print "Total Text:\t", totalText
    print "Total Others:\t", totalOther
    print "Total Proto:\t", totalProto
}
