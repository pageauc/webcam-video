#!/bin/bash

echo "camvid.sh Installation"
echo "1 - Install Dependencies"
sudo apt-get install -y libav-tools
echo "2 - Install gdrive to /usr/local/bin"
cd /usr/local/bin
sudo wget -q --show-progress -O gdrive https://github.com/odeke-em/drive/releases/download/v0.2.2-arm-binary/drive-arm-binary
sudo chmod +x /usr/local/bin/gdrive
echo "3 - Make camvid folder and download files"
cd ~
mkdir -p camvid
cd camvid
wget -O install.sh -q --show-progress https://raw.github.com/pageauc/webcam-video/master/install.sh
wget -O camvid.sh -q --show-progress https://raw.github.com/pageauc/webcam-video/master/camvid.sh
wget -O Readme.txt -q --show-progress https://raw.github.com/pageauc/webcam-video/master/Readme.md
echo "4 - Make files executable"
chmod +x camvid.sh
chmod +x install.sh
echo "5 - Make webcam-videos folder"
mkdir webcam-videos

# See webcam.sh code block below select all, then copy and paste into nano script (right click) ctrl-x y to save

gdrive version