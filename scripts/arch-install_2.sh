# CONFIG VARS
#
HOSTNAME='gargulabox'
USERNAME='gargula'
EDITOR='nvim'

###############################
# Functions
function printStatus() {
	echo "$1"
	echo "..."
	sleep 2
}
###############################

ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
#echo "FONT=ter-132b" >> /etc/vconsole.conf

echo "$HOSTNAME" >> /etc/hostname
echo -e "127.0.0.1\tlocalhost" >> /etc/hosts
echo -e "::1\t\tlocalhost" >> /etc/hosts 
echo -e "127.0.0.1\t$HOSTNAME.localdomain\t$HOSTNAME" >> /etc/hosts

printStatus "Root password hummmmmmm..."
passwd

printStatus "Install pacman packages...."
PACMAN_PKGS=(
mpd
wget
rsync
sshfs
exa
bat
notepadqq
ethtool
evince
cronie
gthumb
gimp
tumbler
yt-dlp
lm_sensors
w3m
reflector
fish
python-pip
greetd
grub-customizer
xorg-xhost
breeze
cliphist
xarchiver
unzip
system-config-printer
usbutils
avahi
nss-mdns
nvme-cli
mako
networkmanager
network-manager-applet
dialog
mtools
dosfstools
reflector
snapper
bluez
bluez-utils
xdg-utils
xdg-user-dirs
alsa-utils
inetutils
terminus-font
nmap
less
blueman
pipewire-jack
pipewire-alsa
pipewire-pulse
)

sudo pacman -S ${PACMAN_PKGS[*]}


printStatus "mkinitcpio owww yesssss!"
mkinitcpio -p linux

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd.service
useradd -mG wheel $USERNAME
passwd $USERNAME
visudo

printStatus "Thats ok... Reboot and go part 3..."
