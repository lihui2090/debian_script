#!/bin/bash
#install debian maintainer tools sh
install_Core_tools(){
apt-get install  dpkg-dev debconf fakeroot -y
}

install_Package_lint_tools(){
apt-get install lintian debdiff -y
}


install_Helpers_for_debianandrules(){
apt-get install debhelper dh-make equivs -y
}

install_Package_builders(){

apt-get install  git-buildpackage debootstrap pbuilder sbuild -y
}
install_Package_uploaders(){
apt-get install  dupload dput dcut -y

}
install_Maintenance_automation(){

apt-get install devscripts autotools-dev dpkg-repack alien dpkg-dev-el dpkg-depcheck -y
}

install_Documentationandinformation(){
apt-get install docbook-xml debiandoc-sgml debian-keyring debian-el -y

}



install_Core_tools

install_Package_lint_tools

install_Helpers_for_debianandrules


install_Package_builders


install_Package_uploaders


install_Maintenance_automation


install_Documentationandinformation
