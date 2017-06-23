#!/bin/sh
dev=""
mount | grep "sda"
if [ $? -eq 1 ]
  then dev="sda"
fi
mount | grep "sdb"
if [ $? -eq 1 ]
  then dev="sdb"
fi
mount | grep "sdc"
if [ $? -eq 1 ]
  then dev="sdc"
fi

if [ "$dev" = "" ]
  then exit 0
fi

echo "n
p
1


w
" | fdisk /dev/$dev
mkfs.ext4 -L /data "/dev/${dev}1"
mkdir /data
echo "LABEL=/data /data      ext4    defaults        1 2" >> /etc/fstab
mount -a