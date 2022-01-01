#!/usr/bin/env bash

loops=0
POLYBAR_LOCK=/tmp/POLYBAR_PACMAN_UPDATED

check_updates() {
    updates=$(checkupdates 2>/dev/null | wc -l)
    echo $updates
}

check_updates
while true; do
    sleep 5
    ((loops++))
    # Actually, maybe check for the existince of a locking type file
    if [[ $loops -ge 360 || -f $POLYBAR_LOCK ]]; then
        # After 30 minutes, check again
        check_updates
        loops=0
        if (( $updates == 0 )); then
            rm $POLYBAR_LOCK 2> /dev/null
        fi
    fi
done
