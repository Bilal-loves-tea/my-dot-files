<div align="center">

# 🌌 My Hyprland Setup for New Devices 🌌

🪟 Hyprland &nbsp;•&nbsp; 📊 Waybar &nbsp;•&nbsp; 🔔 SwayNC &nbsp;•&nbsp; 🔍 Tofi &nbsp;•&nbsp; 🎵 rmpc &nbsp;•&nbsp; 🚪 wlogout

**Enjoy! 🎉🚀💜**

</div>

---

## 📋 Table of Contents

1. 📦 [Dependencies and services in one go](#-dependencies-and-services-in-one-go)
2. 🖥️ [Display manager (ly)](#%EF%B8%8F-display-manager-ly)
3. 🔧 [Troubleshooting](#-troubleshooting)
4. 🗺️ [Setup order](#%EF%B8%8F-setup-order)

---

## 📦 Dependencies and services in one go

> ⚠️ **All of these are required.** Install them *before* copying the config over, otherwise keybinds, autostart entries and bar modules will silently fail. 😬

```bash
# 🛠️ Bootstrap yay first (one time)
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd ..

# 📚 Official repos
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

# 🧙 AUR
yay -S --needed tofi wlogout grimblast-git jome

# ⚙️ Services
sudo systemctl enable --now NetworkManager bluetooth
systemctl --user enable --now mpd
```

### 🧩 What each group does

| | Group | Packages |
|---|---|---|
| 🪟 | **Hyprland core** | `hyprland` `hyprlock` `hypridle` `hyprpolkitagent` `xdg-desktop-portal-hyprland` |
| 📊 | **Bar & notifications** | `waybar` `swaync` |
| 🖼️ | **Wallpaper & launchers** | `awww` `rofi` `tofi` |
| 📋 | **Clipboard & screenshots** | `wl-clipboard` `cliphist` `grim` `slurp` `grimblast-git` `jome` |
| 🔊 | **Audio & media** | `pipewire` `wireplumber` `pamixer` `pavucontrol` `playerctl` `mpd` `rmpc` `cava` |
| 💡 | **Brightness** | `brightnessctl` |
| 📡 | **Network & Bluetooth** | `networkmanager` `network-manager-applet` `bluez` `blueman` |
| 🖥️ | **Apps** | `kitty` `thunar` `firefox` |
| 🎨 | **Theming** | `adw-gtk-theme` `qt5ct` `qt6ct` `kvantum` `breeze-icons` |
| 🔤 | **Fonts** | `ttf-jetbrains-mono-nerd` `ttf-nerd-fonts-symbols` `noto-fonts` `noto-fonts-emoji` |
| 🎮 | **Graphics (Intel + NVIDIA)** | `intel-media-driver` `vulkan-intel` `mesa` `nvidia-open` `nvidia-utils` `nvidia-prime` |
| 🚪 | **Logout menu** | `wlogout` |
| 🔐 | **Display manager** | `ly` |

---

## 🖥️ Display manager (ly)

The `ly/` folder from this repo goes into **`/etc/`**, **NOT** into `~/.config/`. 🚫📁

```bash
sudo cp -r ly /etc/
sudo systemctl enable ly@tty2.service
```

> 💡 The exact service name can differ between ly versions. Check with:
> ```bash
> systemctl list-unit-files | grep ly
> ```

Reboot 🔄 and enjoy the custom login screen! 😎

---

## 🔧 Troubleshooting

| 😵 Problem | 🩹 Fix |
|---|---|
| 🖥️ **Display looks wrong / wrong resolution** | Double-check `hyprland.conf` (or `modules/monitors.lua`) 📐 |
| 🔑 **No password prompts** | Make sure the autostart uses `exec-once = systemctl --user start hyprpolkitagent` 🛡️ |
| 🪟 **Window won't float** | Find the real class with `hyprctl clients \| grep class` 🔍 |
| 🎵 **rmpc can't connect** | Check `systemctl --user status mpd` and your `music_directory` in `~/.config/mpd/mpd.conf` 🎶 |
| 📶 **No network icon** | Waybar needs a `tray` module, and NetworkManager must be running 🌐 |
| 🔵 **Bluetooth icon missing** | `sudo systemctl enable --now bluetooth` 🦷 |
| 😕 **A package isn't found** | Try the AUR: `yay -S <name>` 🧙 |

---

## 🗺️ Setup order

1. 📦 Run the dependencies block above
2. 🔐 Copy `ly/` to `/etc/` and enable the service
3. 📂 Copy the dotfiles into `~/.config/` (`hypr`, `waybar`, `tofi`, `rofi`, `wlogout`, `swaync`, `rmpc`, `mpd`)
4. 🔄 Reboot, log in through ly, and run `hyprctl reload`
5. 🎉 Enjoy!

---

<div align="center">

### Made with ☕

⭐ **Happy ricing!** ⭐

</div>

---

## 📝 TODO

- [ ] 🖼️ **Wallpaper changer** 🎨
- [ ] 🤖 **Install script** that automates this whole README ⚡:wq
