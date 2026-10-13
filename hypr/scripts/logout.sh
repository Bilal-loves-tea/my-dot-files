#!/usr/bin/env bash

# Define menu options (Emojis or plain text)
lock="🔒 Lock"
logout="🚪 Logout"
suspend="💤 Suspend"
reboot="🔄 Reboot"
shutdown="⚡ Power Off"

# Pass options to Rofi
options="$lock\n$logout\n$suspend\n$reboot\n$shutdown"

# Launch Rofi
chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme-str 'window {width: 20%;}')"

# Execute action based on choice
case "$chosen" in
    "$lock")
        # Replace with your lock command if not using systemd/loginctl (e.g., swaylock, i3lock)
        hyprlock
        ;;
    "$logout")
        # Terminates the active user session cleanly
        loginctl terminate-user "$USER"
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
esac

