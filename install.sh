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
echo "gdrive version information"
gdrive version
echo
echo "7 - Installation Complete"
echo
echo "See Readme.md for gdrive setup instructions"
echo "eg more Readme.md"
echo
echo "Once gdrive is working Change folder to camvid folder"
echo "Make sure webcam usb cable is plugged into the Raspberry Pi"
echo "Then Run camvid.sh script per the following commands"
echo "cd ~/camvid"
echo "./camvid.sh"
