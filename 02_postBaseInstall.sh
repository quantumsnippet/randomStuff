echo """"""ADDING USER AND GIVING SUDO PRIVILEGES""""""
useradd darshan
passwd darshan

echo """"""Uncomment the wheel group. It is the line which begins with wheel and save it""""""
sleep 10
visudo
usermod -aG wheel darshan

su darshan
groups
sleep 5
sudo whoami
sleep 5
echo "-------------------------------------------------"


echo """"""INCLUDING MULTILIB REPOSITORY""""""
echo """"""Uncomment the [multilib] repository line, its mirrorlist include line and save it""""""
sleep 10
sudo vim /etc/pacman.conf
echo "-------------------------------------------------"


echo """"""UPDATING THE REPOSITORIES""""""
sudo pacman -Syyu
echo "-------------------------------------------------"


echo """"""INSTALLATION OF XORG, DESKTOP ENVIRONMENT AND LOGIN DISPLAY MANAGER""""""
sudo pacman -S xorg
sudo pacman -S mate mate-extra
sudo pacman -S lxdm
sudo systemctl enable lxdm.service
echo "-------------------------------------------------"


echo """"""WIFI CONNECTION""""""
sudo pacman -S broadcom-wl-dkms network-manager-applet
sudo rmmod b43 b43legacy bcm43xx bcma brcm80211 brcmfmac brcmsmac ssb wl
sudo modprobe wl
echo "-------------------------------------------------"


echo """"""REBOOT""""""
sleep 5
reboot
reboot