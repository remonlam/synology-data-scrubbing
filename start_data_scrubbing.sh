#!/bin/sh
DEVICE=$1
if [ -z "$DEVICE" ]; then
 echo "Missing argument DEVICE. Eg: md0 md1, md2, etc." 1>&2
 exit
fi
CHECKING=`/bin/cat /proc/mdstat | /bin/grep -A2 $DEVICE | /bin/grep check`
if [ -z "$CHECKING" ]; then
 echo check > /sys/block/$DEVICE/md/sync_action
 echo "Performing data scrubbing on device $DEVICE now."
else
 echo "Data scrubbing on device $DEVICE in progress."
fi
