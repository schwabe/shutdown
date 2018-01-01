NUMUSERS=$(/usr/bin/who  | wc -l)
if [ $NUMUSERS -eq 0 ]; then
    echo "No SSH connections"
    who
else
    echo "Current SSH connections, no shutdown now."
    who
  exit
fi
