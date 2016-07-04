#!/bin/bash

cd /tmp
sudo apt-get install -y libav-tools
wget https://github.com/odeke-em/drive/releases/download/v0.2.2-arm-binary/drive-arm-binary
chmod +x drive-arm-binary
sudo cp drive-arm-binary /usr/local/bin/gdrive
cd ~
mkdir camvid
cd camvid
mkdir webcam-videos

# See webcam.sh code block below select all, then copy and paste into nano script (right click) ctrl-x y to save
chmod +x webcam.sh  
gdrive version