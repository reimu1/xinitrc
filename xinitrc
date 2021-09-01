#!/usr/bin/env sh
while true; do

        date '+| %a %T AM %F' > /tmp/CurTime.tmp

        sleep 1s
done &
while true; do

        LOCALTIME=$(< /tmp/CurTime.tmp)
        MEM=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
        DISKUSED=$(df -Ph | grep "/dev/sda1" | awk {'print $3'})
        DISKFREE=$(df -Ph | grep "/dev/sda1" | awk {'print $4'})
        xsetroot -name "m: $MEM s:$DISKUSED/$DISKFREE $LOCALTIME"

        sleep 1s
done &

nitrogen --restore
exec dwm

