#!/bin/bash

# Exit if any command fails
set -e

echo "Starting full system setup with NVIDIA driver installation and additional packages..."

# Step 1: Install NVIDIA-related packages
echo "Installing linux-headers, nvidia-dkms, qt5-wayland, qt5ct, libva, and libva-nvidia-driver-git..."
yay -S --noconfirm linux-headers nvidia-dkms qt5-wayland qt5ct libva libva-nvidia-driver-git

# Step 2: Set NVIDIA modules
echo "Setting NVIDIA modules..."
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)

# Step 3: Generate the custom initramfs image
echo "Generating custom initramfs image..."
sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

# Step 4: Enable NVIDIA DRM modeset
echo "Enabling NVIDIA DRM modeset..."
echo "options nvidia-drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf

# Step 5: Verify the configuration file
echo "Verifying the configuration file..."
cat /etc/modprobe.d/nvidia.conf

# Step 6: Install additional packages
echo "Installing additional packages for Hyprland and system setup..."
yay -S --noconfirm hyprland kitty jq mako waybar-hyprland swww swaylock-effects \
    wofi wlogout xdg-desktop-portal-hyprland swappy grim slurp thunar \
    polkit-gnome python-requests pamixer pavucontrol brightnessctl bluez \
    bluez-utils blueman network-manager-applet gvfs thunar-archive-plugin \
    file-roller btop pacman-contrib starship ttf-jetbrains-mono-nerd \
    noto-fonts-emoji lxappearance xfce4-settings sddm-git sddm-sugar-candy-git

# Step 7: Final confirmation before reboot
echo "Installation and configuration complete. The system will reboot in 10 seconds. Press Ctrl+C to cancel."
sleep 10

# Step 8: Reboot
echo "Rebooting now..."
sudo reboot
