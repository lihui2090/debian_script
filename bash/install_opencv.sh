#!/bin/bash
#debian 8
#root user
OPENCV_SRC_DIR=/tmp/opencv
OPENCV_BUILD_DIR=/tmp/opencv/opencv/build
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



install_base_packages(){
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

}

get_opencv_src(){
cd  $OPENCV_SRC_DIR
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

}


build_opencv(){
cd $OPENCV_SRC_DIR/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=Release\Debug -D OPENCV_EXTRA_MODULES_PATH=$OPENCV_SRC_DIR/opencv_cotrib/modules -D CMAKE_INSTALL_PREFIX=/usr/local ..
sudo make install

}


get_test(){

cd $OPENCV_SRC_DIR
git clone https://github.com/opencv/opencv_extra.git

$OPENCV_BUILD_DIR/bin/opencv_test_core
}





install_base_packages
get_opencv_src
build_opencv
get_test
