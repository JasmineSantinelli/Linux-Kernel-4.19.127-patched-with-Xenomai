# Linux-Kernel-4.19.127-patched-with-Xenomai
How to patch Linux Kernel with Xenomai (for Raspberry pi 4B)

This repository wants to share the secrets of how you can patch the Kernel Linux with Xenomai. 
For Rasperry pi 4B we have some issues about the version compatibility of the Kernel. 

-Download a clean image of Raspbian here (we're using the 2020-02-13, the previous versions have some problem with the hardware -> require newer software error on boot phase) : http://downloads.raspberrypi.org/raspbian/images/

-Download Linux Kernel from here: https://github.com/raspberrypi/linux and then find the 4.19.127 version searching in the commit (git reset -hard commit number) 

-Download Xenomai source code from here:https://xenomai.org/downloads/xenomai/stable/ (we're using the 3.1)
 
-Download the repository

 Patch:
  patch -p1 <../pre-xenomai.patch
../xenomai/scripts/prepare-kernel.sh --linux=./ --arch=arm --ipipe=../ipipe-core-4.19.124-cip27-arm-09-MOD.patch

Build Kernel:
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2711_defconfig 
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-  bzImage modules dtbs

Having built the kernel, you need to copy it onto your Raspberry Pi and install the modules; 
this is best done directly using an SD card reader and using deploy.sh.

Source:
https://www.raspberrypi.org/documentation/linux/kernel/building.md
http://www.simplerobot.net/2019/12/xenomai-3-for-raspberry-pi-4.html
