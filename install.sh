#!/bin/bash

#tar -xzvf ./repos.tar.gz
tar -xzf ./vimix.tar.gz
tar -xzf ./icons.tar.gz
tar -xzf ./theme.tar.gz
tar -xzf ./infinality.tar.gz

echo "begin to install ...."

echo "installing icons ..."
mkdir ~/.icons
cp icons ~/.icons -rf

echo "installing themes ..."
sudo cp Favorite /usr/share/themes/ -rf

echo "installing fonts beautify ..."
sudo cp fontconfig-infinality/* /etc/fonts/ -rf 
sudo mv /etc/fonts/conf.d/52-infinality.conf /etc/fonts/conf.d/52-infinality.conf.bak
sudo ln -s /etc/fonts/infinality/infinality.conf /etc/fonts/conf.d/52-infinality.conf

#echo "adding repos ..."
#sudo cp yum.repos.d /etc/ -rf 

echo "beautify grub theme ..."
sudo cp Vimix /boot/grub2/themes/ -rf
sudo echo "GRUB_THEME=/boot/grub2/themes/Vimix/theme.txt" >>/etc/default/grub

######begin to intall essential tools

echo "installing essential tools ..."
sudo dnf config-manager --add-repo=http://repo.fdzh.org/FZUG/FZUG.repo 
sudo dnf install fzug-release -y
sudo dnf install -y vim gcc gcc-c++ gnome-tweak-tool powerline sogoupinyin sogoupinyin-selinux plymouth*
echo "source /usr/share/powerline/bash/powerline.sh" >>~/.bashrc
sudo plymouth-set-default-theme -R solar
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

echo "Done! Enjoy!"

