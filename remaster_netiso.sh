#!/bin/bash
#Remaster Netinstaller
line="--------------------------------------"
step_by_step(){

echo $line
echo $1
echo $line
read var1

}
#set -e
step_by_step "mkdir  netinstaller"

mkdir  netinstaller

mkdir -p netinstaller/cd
step_by_step "download  debian-8.3.0-amd64-netinst.iso"
cd  netinstaller 
if [ ! -e debian-8.3.0-amd64-netinst.iso ] ; then 
wget http://cdimage.debian.org/debian-cd/8.3.0/amd64/iso-cd/debian-8.3.0-amd64-netinst.iso
fi
cd ..


apt-get install -y p7zip
7z x ocd  netinstaller/debian-8.3.0-amd64-netinst.iso
apt-get install -y bsdtar
bsdtar -C  netinstaller/cd -xf  netinstaller/debian-8.3.0-amd64-netinst.iso

step_by_step "wget firmware-bnx2x_0.26_all.deb"
mkdir -p  netinstaller/bnx2x
cd  netinstaller 
if [ ! -e firmware-bnx2x_0.26_all.deb ] ; then  
wget http://ftp.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-bnx2x_0.26_all.deb
fi
cd ..
step_by_step "install firmware"
sudo dpkg-deb -x  netinstaller/firmware-bnx2x_0.26_all.deb  netinstaller/bnx2x/

step_by_step "cp   firmware to initrd"

mkdir -p  netinstaller/initrd
cd  netinstaller/initrd && zcat  ../../netinstaller/cd/install.amd/initrd.gz | cpio -iv
cd .. 
cp -Rpv  netinstaller/bnx2x/lib/firmware  netinstaller/initrd/lib
step_by_step "install preseed"
cp -v <yourpreseedfile>  netinstaller/initrd/preseed.cfg
step_by_step "pack new initrd"
cd  netinstaller/initrd && find . -print0 | cpio -0 -H newc -ov | gzip -c >  ../../netinstaller/cd/install.amd/initrd.gz
cd ..
cd  netinstaller/cd; md5sum `find ! -name "md5sum.txt" ! -path "./isolinux/*" -follow -type f` > md5sum.txt;cd -
cd ..
step_by_step "create iso"
mkisofs -o  netinstaller/debian-8.3.0-amd64-netinst.iso -r -J -no-emul-boot -boot-load-size 4 -boot-info-table -b isolinux/isolinux.bin -c isolinux/boot.cat  netinstaller/cd

