#!/bin/bash

cd /opt/shutdown/

. shutdown-wakeup.sh
. shutdown-screen.sh
. shutdown-smb.sh
. shutdown-ssh.sh

#echo "Shutdown in 15 minutes"
#/sbin/shutdown -h 15
/sbin/ethtool -s enp0s25  wol g 
/usr/sbin/pm-suspend
