#!/bin/bash

echo "camvid.sh Installation"
echo "1 - Install Dependencies"
sudo apt-get install -y libav-tools
echo "2 - Make camvid folder and download files"
cd ~
mkdir -p camvid
cd camvid
wget -O install.sh -q --show-progress https://raw.github.com/pageauc/webcam-video/master/install.sh
wget -O camvid.sh -q --show-progress https://raw.github.com/pageauc/webcam-video/master/camvid.sh
wget -O Readme.md -q --show-progress https://raw.github.com/pageauc/webcam-video/master/Readme.md
echo "3 - Make files executable"
chmod +x camvid.sh
chmod +x install.sh
echo "4 - Make webcam-videos folder"
mkdir webcam-videos
echo "5 - Display gdrive version"
echo "6 - Install gdrive to /usr/local/bin"
cd /usr/local/bin
sudo wget -q --show-progress -O gdrive https://github.com/odeke-em/drive/releases/download/v0.2.2-arm-binary/drive-arm-binary
sudo chmod +x /usr/local/bin/gdrive
gdrive version
echo "7 - Installation Complete"
echo "See Setup for gdrive in Readme.md"
echo "eg more Readme.md"
echo "Change folder to camvid folder"
echo "cd ~/camvid"
echo "Then Run camvid.sh script per the following command"
echo "./camvid.sh"
