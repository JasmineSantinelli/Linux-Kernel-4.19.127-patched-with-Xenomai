#!/bin/bash

#mkdir mnt
#mkdir mnt/fat32
#mkdir mnt/ext4
mount /dev/sdb1 mnt/fat32
mount /dev/sdb2 mnt/ext4

env PATH=$PATH make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=mnt/ext4 modules_install

cp mnt/fat32/$KERNEL.img mnt/fat32/$KERNEL-backup.img
cp arch/arm/boot/zImage mnt/fat32/$KERNEL.img
cp arch/arm/boot/dts/*.dtb mnt/fat32/
cp arch/arm/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
cp arch/arm/boot/dts/overlays/README mnt/fat32/overlays/

umount mnt/fat32
umount mnt/ext4
