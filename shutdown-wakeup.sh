
if [[ $(cat /proc/uptime  |cut -d"." -f1) -lt 600 ]]; then
	echo "Uptime is less then 10 minutes, not shutting down"
	exit 1
fi
# https://unix.stackexchange.com/questions/22140/determine-time-of-last-suspend-to-ram
# Check if we need to suspend afterwards
if [[ -e /var/log/pm-suspend.log ]]; then
    RESUME_DATE="$(egrep 'Running hooks for (resume|thaw)' /var/log/pm-suspend.log | tail -n 1 | sed 's/^\(.*\):.*$/\1/')"
    if [[ -n "$RESUME_DATE" ]]; then
        RESUME_SECS="$(date --date="$RESUME_DATE" +%s)"
        NOW_SECS="$(date +%s)"
        SECS_SINCE_RESUME=$(( $NOW_SECS - $RESUME_SECS ))
        if [[ $SECS_SINCE_RESUME -lt 600 ]]; then
	    echo "Last wakeup less than 10 minutes ${SECS_SINCE_RESUME}"
	    exit 1
        fi
    fi
fi

