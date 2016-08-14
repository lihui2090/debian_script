#!/bin/bash
#debian 8
#root user

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



modify_sourceslist(){
install -p  debian/etc/apt/sources.list /etc/apt/sources.list
apt-get update
}

install_git(){
apt-get install git -y
}

config_git(){
git config --global user.name "shenme"
git config --global user.email "3219823514@qq.com"
ssh-keygen -t rsa -b 4096 -C "3219823514@qq.com"
}

install_debain_maintainer_tools(){
apt-get install   dpkg-dev \
    debconf \
    fakeroot \
    lintian \
    debdiff \
    debhelper \
    dh-make \
    equivs \
    git-buildpackage \
    debootstrap \
    pbuilder \
    sbuild \
    dupload \
    dput \
    dcut \
    devscripts \
    autotools-dev \
    dpkg-repack \
    alien \
    dpkg-dev-el \
    dpkg-depcheck \
    dpkg-cross \
    docbook-xml \
    debiandoc-sgml \
    debian-keyring \
    debian-el -y

}

install_linux_header(){

apt-get install linux-headers-$(uname -r) -y 
}

install_auto_tools(){

apt-get install autoconf automake autotools-dev  build-essential -y 
}


install_freecad(){

apt-get install freecad -y
}

install_gead(){

apt-get install geda -y
}

install_meld(){
apt-get install meld -y
}

modify_sourceslist
install_git
config_git
install_auto_tools
install_debain_maintainer_tools
install_freecad
install_gead
install_meld
