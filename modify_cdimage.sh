#!/bin/bash
#https://wiki.debian.org/DebianInstaller/Modify/CD?highlight=%28create%29|%28cd%29#Create_new_image
#workdir 
WORK_DIR=/opt/modifycd



#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

line="--------------------------------------"
RED='\033[0;31m'
NC='\033[0m' # No Color
BIG_STEP(){
	string=$1
	echo -e "${RED}${line}${NC}\n"
	echo -e "${RED}${string}${NC}\n"
	echo -e "${RED}${line}${NC}\n"
}


step_by_step(){

echo $line
echo $1
echo $line
read var1

}

step_one_mkdir(){
step_by_step "rm cd then mkdir cd"
mkdir $WORK_DIR
cd $WORK_DIR

rm -rf cd 
mkdir cd 
mkdir  downloads

}

step_two_get_iso(){
step_by_step "get iso"
wget $1
}

BIG_STEP "prepare the work dir"

step_one_mkdir

cd downloads
if [ ! -e debian-testing-kfreebsd-i386-netinst.iso ] ; then 

step_two_get_iso  "http://cdimage.debian.org/cdimage/daily-builds/sid_d-i/20150418-3/kfreebsd-i386/iso-cd/debian-testing-kfreebsd-i386-netinst.iso"

else
echo "the file have exit"
fi



