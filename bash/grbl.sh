#!/bin/bash

install_compile_tools(){
apt-get install gcc-avr arduino -y

}

mkdir_for_work(){
rm -rf /backup/backup/gitbhub/grbl
mkdir -p  /backup/backup/gitbhub/grbl
cd /backup/backup/gitbhub/
chown shenme  grbl
chgrp shenme grbl

}

get_grbl_source(){
cd /backup/backup/gitbhub/grbl
git clone git@github.com:lihui2090/grbl.git
}

build_grbl(){
cd /backup/backup/gitbhub/grbl/grbl
su shenme
make clean
make grbl.hex

}

download_grbl(){
avrdude -v -patmega328p -Uflash:w:grbl_v0_9j_atmega328p_16mhz_115200.hex:i -carduino -b 57600 -P /dev/ttyUSBX
}


install_compile_tools
mkdir_for_work
get_grbl_source
build_grbl
download_grbl
