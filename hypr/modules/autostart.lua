-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  -- hl.exec_cmd()
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("udiskie &")
  hl.exec_cmd("exec swayosd-server")
  hl.exec_cmd("exec swaync")
  hl.exec_cmd("snappy-switcher --daemon")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon && waypaper --restore")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("systemctl --user enable --now hyprpolkitagent.service")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
    -- uses a blocking exec function and sleeps a bit to give things time to close
    -- you might also want to kill troublesome/crashing non-systemd background services here:
    -- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")
end)
