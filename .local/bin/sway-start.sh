#!/usr/bin/env bash
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_DBUS_REMOTE=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

exec dbus-launch --sh-syntax --exit-with-session sway
