#!/bin/sh
screenshot_file=$(xdg-user-dir PICTURES)/Screenshot_$(date +%F-%H-%M).png

SWITCH=$1
case $SWITCH in
    r)
        grim -g "$(slurp -d)" "$screenshot_file"
        ;;
    s)
        grim -g "$(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" "$screenshot_file"
        ;;
    w)
        grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" "$screenshot_file"
        ;;
    h|\?)
        echo "makes screenshots with grim"
        echo "'-r' : select a region"
        echo "'-s' : select a screen"
        echo "'-w' : select a window"
        ;;
esac
