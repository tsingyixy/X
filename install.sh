#!/bin/bash

tar -xzvf ./repos.tar.gz
tar -xzvf ./vimix.tar.gz
tar -xzvf ./icons.tar.gz
tar -xzvf ./theme.tar.gz
tar -xzvf ./infinality.tar.gz

echo "begin to install ...."

echo "installing icons ..."
mkdir ~/.icons
cp icons ~/.icons -rf
echo "installing themes ..."
sudo cp Favorite /usr/share/themes/ -rf
echo "installing fonts beautify ..."
sudo cp fontconfig-infinality/* /etc/fonts/
echo "adding repos ..."
sudo cp yum.repos.d /etc/ -rf 
echo "beautify grub theme"
sudo cp Vimix /boot/grub2/themes/ -rf
echo "Done! Enjoy!"

