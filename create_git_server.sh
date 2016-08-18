##server
GIT_SERVER_PATH=/opt/gitserver/data/git
GIT_USER=git
GIT_REPOSITY_NAME=testone.git
su root
apt-get  install -y git
mkdir -pv  $GIT_SERVER_PATH 
useradd -r -d  $GIT_SERVER_PATH  $GIT_USER
cd  $GIT_SERVER_PATH
git init --bare $GIT_REPOSITY_NAME
chown -R git.git $GIT_SERVER_PATH/*
vim cat /etc/passwd
git:x:101:105::/data/git:/usr/bin/git-shell
mkdir .ssh
cd .ssh
#add the pub key
vim authorized_keys

##terminal
ssh-keygen -t rsa -b 4096 -C "xx@xx.com"
modify the key name 
input the passwd for use the key
cat the pubkey




