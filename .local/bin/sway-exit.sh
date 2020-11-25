#!/usr/bin/env bash
#
# this script requires passwordless access to
# poweroff, reboot, pm-suspend and pm-hibernate
#

lock() {
    #$HOME/.config/i3lock/i3lock.sh
    #$HOME/.config/i3/i3lock-wrapper -u
    #xlock -usefirst -mode blank &
    #sleep 1
    swaylock -f -c 000000
    swayidle -w \
            timeout 5 'swaymsg "output * dpms off"' \
            resume 'swaymsg "output * dpms on" ; pkill swayidle' \
            after-resume 'pkill swayidle'
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        swaymsg exit
        kill -- -1
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff -i
        ;;
    *)
        echo "Usage: $0 [lock|logout|suspend|hibernate|reboot|shutdown]"
        exit 2
esac

exit 0
