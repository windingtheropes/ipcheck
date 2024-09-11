#!/bin/bash
echo "Attempting to refresh Bell HH4000 DMZ."
res=$(cd /root/modem-scripts && bin/python3 fix_admz.py)

if [ -z "$res" ]; then
   echo "Refreshed DMZ successfully."
else
   echo "Failed to refresh DMZ."
   echo $res
fi
