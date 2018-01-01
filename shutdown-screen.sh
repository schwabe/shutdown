/bin/ps -aux | /bin/grep '[S]CREEN'
if [ $? -ne 0 ]; then
  echo "No Screen found"
else
  echo "Screen found, no shutdown now."
  exit
fi
