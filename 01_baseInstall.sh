echo """"""CHECKING INTERNET CONNECTION""""""
ping -c 5 archlinux.org
echo "-------------------------------------------------"


echo """"""UPDATING SYSTEM CLOCK""""""
timedatectl set-ntp true
echo "-------------------------------------------------"


echo """"""CHECKING PARTITIONS AS OF NOW""""""
lsblk
echo "-------------------------------------------------"
sleep 30


echo """"""LAUNCHING PARTITION TOOL""""""
cfdisk
echo "-------------------------------------------------"


echo """"""CHECKING PARTITIONS AGAIN""""""
lsblk
echo "-------------------------------------------------"
sleep 15


echo """"""FORMATTING THE PARTITIONS""""""
echo """"""FORMATTING THE EFI PARTITION""""""
mkfs.fat -F32 /dev/sda2
echo "-------------------------------------------------"

echo """"""FORMATTING THE SWAP PARTITION AND ACTIVATING IT""""""
mkswap /dev/sda1
swapon /dev/sda1
echo "-------------------------------------------------"

echo """"""FORMATTING THE ROOT PARTITION""""""
mkfs.ext4 /dev/sda3
echo "-------------------------------------------------"


echo """"""MOUNTING THE FILE SYSTEMS""""""
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
echo "-------------------------------------------------"


echo """"""INSTALLING ESSENTIAL PACKAGES USING PACSTRAP""""""
pacstrap /mnt base base-devel linux-lts linux-lts-headers linux-firmware nano vim bash-completion
echo "-------------------------------------------------"


echo """"""FSTAB""""""
genfstab -U /mnt >> /mnt/etc/fstab
echo "-------------------------------------------------"


echo """"""CHROOT""""""
arch-chroot /mnt
echo "-------------------------------------------------"


echo """"""TIME ZONE""""""
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
echo "-------------------------------------------------"


echo """"""LOCALIZATION""""""
sed '/en_IN UTF-8/s/^#//' -i /etc/locale.gen
locale-gen
echo LANG=en_IN.UTF-8 > /etc/locale.conf
echo "-------------------------------------------------"


echo """"""HOSTNAME""""""
echo arch > /etc/hostname
cat > /etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   $hostname.localdomain   $hostname
EOF
echo "-------------------------------------------------"


echo """"""NETWORK CONFIGURATION""""""
pacman -S networkmanager
systemctl enable NetworkManager
echo "-------------------------------------------------"


echo """"""ROOT PASSWORD""""""
passwd
echo "-------------------------------------------------"


echo """"""BOOT LOADER""""""
pacman -S grub efibootmgr os-prober ntfs-3g intel-ucode
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo "-------------------------------------------------"


echo """"""EXIT AND REBOOT""""""
exit
reboot
