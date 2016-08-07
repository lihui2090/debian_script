#example code
#mknod /dev/loop0 b 7 0
#dd if=/dev/zero of=/tmp/fsfile bs=1k count=nnn
#mke2fs -m 0 -N 2000 DEVICE
#mount -t ext2 DEVICE /mnt

#prepare the disk file 
prepare_disk_file(){
dd if=/dev/zero of=/tmp/fsfile bs=1k count=102400 
sudo mkfs.ext2 -m 0 -N 2000 /tmp/fsfile
sudo mount -t ext2 /tmp/fsfile /mnt/rootfs/
}


prepare_populate_dir(){
sudo mkdir -p /mnt/roofs/boot
sudo mkdir -p /mnt/rootfs/dev
sudo mkdir -p /mnt/rootfs/etc
sudo mkdir -p /mnt/rootfs/bin
sudo mkdir -p /mnt/rootfs/sbin
sudo mkdir -p /mnt/rootfs/user
sudo mkdir -p /mnt/rootfs/user/{bin,sbin,lib}
sudo mkdir -p /mnt/rootfs/lib
sudo mkdir -p /mnt/rootfs/var
sudo mkdir -p /mnt/rootfs/var/{log,run}
touch    /mnt/rootfs/var/run/utmp

}

make_populate_dev_file(){

  #cp -dpR /dev/fd[01]* /mnt/rootfs/dev
  #cp -dpR /dev/tty[0-6] /mnt/rootfs/dev
  sudo cp -dpr /backup/dev/* /mnt/rootfs/dev

}

make_populate_etc_file(){
sudo cp -dpr  /backup/etc/rc* /mnt/rootfs/etc/
sudo cp -dpr  /backup/etc/binit*  /mnt/rootfs/etc/
touch /mnt/rootfs/etc/fstab
echo  "/dev/ram0       /               ext2    defaults" > /mnt/rootfs/etc/fstab
echo  "/dev/fd0        /               ext2    defaults" >> /mnt/rootfs/etc/fstab
echo  "/proc           /proc           proc    defaults" >> /mnt/rootfs/etc/fstab

touch   /mnt/rootfs/etc/inittab

echo    "id:2:initdefault:"  > /mnt/rootfs/etc/inittab
echo     "si::sysinit:/etc/rc" >> /mnt/rootfs/etc/inittab
echo     "1:2345:respawn:/sbin/getty 9600 tty1" >> /mnt/rootfs/etc/inittab
        "2:23:respawn:/sbin/getty 9600 tty2" >> /mnt/rootfs/etc/inittab

touch /mnt/rootfs/etc/passwd
echo "root:x:0:0:root:/root:/bin/bash" > /mnt/rootfs/etc/passwd

}


make_populate_bin_file(){
sudo cp -dpr /backup/bin/* /mnt/roofs/bin/
sudo cp -dpr /backup/sbin/* /mnt/rootfs/sbin/
}


make_populate_lib_file(){
#need ldd find the bin need  lib
#need cp modules the kernel need 


}


make_the_files(){

umount /mnt/rootfs
dd if=/opt/tmpfs bs=1k | gzip -v9 > rootfs.gz


}
