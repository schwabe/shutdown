/usr/bin/smbstatus | /bin/grep ipv
if [ $? -ne 0 ]; then
  echo "No SMB connections"
else
  echo "Current SMB connections, no shutdown now."
  exit
fi
