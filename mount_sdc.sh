#!/bin/sh
echo "n
p
1


w
" | fdisk /dev/sdc
mkfs.ext4 -L /data /dev/sdc1
mkdir /data
echo "LABEL=/data /data      ext4    defaults        1 2" >> /etc/fstab
mount -a