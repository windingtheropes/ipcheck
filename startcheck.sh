#!/bin/bash
stopfile=/root/checkstop
rm $stopfile
while [ ! -f "$stopfile" ]
do
    sh /root/checkip.sh
    sleep 5
done

