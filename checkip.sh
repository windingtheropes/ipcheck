#!/bin/bash
current=$(sh /root/getip.sh)
echo "Current IP is ${current}"
# check if pubip file exists, if not create
if [ ! -f /root/pubip ]; then
   echo "Creating pubip file now."
   echo $current > /root/pubip
fi
# if exists, compare to current
if [ -f /root/pubip ]; then
   stored=$(cat /root/pubip)
   if [ "$current" != "$stored" ]; then
	echo "IP change detected:" $stored "->" $current
	sh /root/updatedns.sh
	# refresh DMZ has been known to cause issues in the past
	sh /root/refreshdmz.sh
	echo $current > /root/pubip
   else
	echo "No change in IP detected."
   fi
fi
