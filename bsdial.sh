#!/bin/bash
#########################################################
# bsdial is a script to send raw message to Modem 	#
# Author: Benjamin Schmaus  		  		#
#########################################################
DEVICE="ttyUSB0"
MODEMDEVICE="/dev/$DEVICE"
# Check Usage
if [ $# != 2 ]
then
echo 'Usage: bsdial.sh <sms number> "<text message>"' >&2
exit 1
fi
# Wait if another bsdial is using the device
#while [ -f /tmp/$DEVICE.lock ]
#do
#let R=$RANDOM%7+1
#sleep $R
#done
# Lock out device for use
#touch /tmp/$DEVICE.lock
echo AT+CMGS=$1 > $MODEMDEVICE
sleep 3
echo $2 > $MODEMDEVICE
sleep 3
echo  > $MODEMDEVICE
sleep 6
#Unlock device since we are done
#rm /tmp/$DEVICE.lock
exit 0
