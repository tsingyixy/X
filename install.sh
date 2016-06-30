#!/bin/bash
##repo https://github.com/Infinality/fontconfig-infinality/tree/master/infinality

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
sudo dnf install -y ffmpeg ffmpeg-libs gstreamer-ffmpeg xvidcore libdvdread libdvdnav lsdvd gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-bad gstreamer-ffmpeg --nogpgcheck
sudo dnf install -y vim-powerline.noarch
echo "source /usr/share/powerline/bash/powerline.sh" >>~/.bashrc
sudo plymouth-set-default-theme -R solar
sudo grub2-mkconfig -o /boot/grub2/grub.cfg


echo "config vim ..."
git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle


echo "Done! Enjoy!"

