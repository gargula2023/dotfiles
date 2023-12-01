#!/usr/bin/bash
#

PKGS=$(cat <<-END
	xtools
	neovim
	avahi
	dbus
	firefox
	nodejs
	eza
	gimp
	nmap
	bat
	gdu
	duf
	starship
	dunst
	obs
	neofetch
	pipewire
	alsa-pipewire
	libjack-pipewire
	wireplumber
	bluez
	thunar
	thunar-archive-plugin
	thunar-media-tags-plugin
	thunar-volman
	file-roller
	tumbler
	cmake
	mlocate
	lazygit
	ripgrep
	telegram-desktop
	discord
	pavucontrol
	cronie
	grim
	slurp
	ethtool
	keepassxc
	imagemagick
	cups
	hplip
	python-pyserial
	python3-psutil
	qt6-wayland
	qt5-wayland
	polkit-kde-agent
	fuzzel
	copyq
	xdg-desktop-portal-gtk
	qview
	wofi
	swayidle
	kitty
	cava
	nwg-look
	papirus-icon-theme
	breeze
	adwaita-plus
	adwaita-qt
	nerd-fonts-ttf
END
)

LINK_DIRS=(
	kitty
	dunst
	fish
	neofetch
	hypr
	waybar
	wpaperd
	cava
	fuzzel
)


