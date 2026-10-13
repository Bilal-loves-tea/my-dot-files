#!/usr/bin/env bash
choice=$(tofi -c ~/.config/tofi/theme-logout < ~/.config/tofi/logout)

case "$choice" in
  *"Power off") systemctl poweroff ;;
  *"Reboot")    systemctl reboot ;;
  *"Logout")    hyprctl dispatch exit ;;
esac
