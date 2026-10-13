# My Hyprland Setup for New Devices
### Enjoy

## Dependencies and start up services in one go
```
# Bootstrap yay first (one time)
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd ..

# Official repos
sudo pacman -S --needed \
  hyprland hyprlock hypridle hyprpolkitagent xdg-desktop-portal-hyprland qt5-wayland qt6-wayland \
  waybar swaync awww rofi \
  wl-clipboard cliphist grim slurp jq \
  pipewire pipewire-alsa pipewire-pulse wireplumber pamixer pavucontrol playerctl brightnessctl \
  mpd rmpc cava \
  networkmanager network-manager-applet bluez bluez-utils blueman \
  kitty thunar firefox \
  adw-gtk-theme qt5ct qt6ct kvantum breeze-icons \
  ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols noto-fonts noto-fonts-emoji \
  intel-ucode intel-media-driver vulkan-intel mesa \
  nvidia-open nvidia-utils nvidia-prime nvidia-settings libva-nvidia-driver \
  ly

# AUR
yay -S --needed tofi wlogout grimblast-git jome

# Services
sudo systemctl enable --now NetworkManager bluetooth
systemctl --user enable --now mpd
```

--- Double check the hyprland.conf file if the display isn't proper
