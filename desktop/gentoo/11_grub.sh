
echo "asus croshair VI Board needs the IGB (intel network driver) need to CONFIG_IGB=y and then menuconfig again"
echo "edimax usb needs CONFIG_RTL8192CU=m and also a make menuconfig again"

emerge --update --newuse --verbose sys-boot/grub:2

emerge --unmerge sys-kernel/genkernel

emerge --update sys-kernel/dracut

echo 'add_dracutmodules+="usrmount"' >> /etc/dracut

emerge --update sys-kernel/genkernel-next

#genkernel --no-clean all

grub-mkconfig -o /boot/grub/grub.cfg

grub-install /dev/sdc
