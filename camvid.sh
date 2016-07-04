#!/bin/bash
echo "-------------- $0 version 0.7 -----------"
echo " "
# written by Claude Pageau pageauc@gmail.com
# Useweb cam to record specified seconds of video in avi format and send to internet using gdrive
# Prerequisites
# 1 - Raspberry Pi B or B2 running Jessie and latest update
# 2 - Install avconv using the following command
#     sudo apt-get install libav-tools
# 3 - USB web cam installed in any Raspberry Pi USB port and tested
# 4 - gdrive installed per instructions https://www.raspberrypi.org/forums/viewtopic.php?p=841762#p841762
#     cd /tmp
#     wget https://github.com/odeke-em/drive/releases/download/v0.2.2-arm-binary/drive-arm-binary
#     chmod +x drive-arm-binary
#     sudo cp drive-arm-binary /usr/local/bin/gdrive
#     cd ~
#     gdrive version
# 5 - gdrive init setup for the folder that this script is installed in.
#     See step 4 RPI Forum permalink above for details

# ------------------------- User Variables ----------------------------
record_time_sec=15                  # number of seconds to record
video_dir="/home/pi/camvid/webcam-videos"  # Full path to data folder
video_name="camvid.avi"           # video file name including extension
vid_num_max=5

# ----- Main Program Code -------
# create a round robin video series up to vid_num_max
if [ -f webcam.dat ] ; then
  vid_num=$(<webcam.dat)
else
  vid_num=1
fi
# This is the current video
echo 'video_num='$vid_num
video_name='v'$vid_num'_'$video_name  

# ----------------------- Start Main Script ---------------------------
echo "Start at $(date)"
video_path="$video_dir/$video_name"    # specify the path to the video.  make sure it exists.
if [ ! -z "$(pgrep avconv)" ]; then    # check if still recording video
  echo "WARNING - Web Cam is Recording video to $video_path."  
elif [ ! -z "$(pgrep gdrive)" ]; then  # check if still uploading video
  echo "WARNING - gdrive is currently Uploading video $video_path"
elif [ -f $video_path ]; then  # check if a video file exists so retry upload
  echo "STATUS  - Retry Upload $video_path using gdrive"
  /usr/local/bin/gdrive push -no-prompt -ignore-conflict $video_path
  if [ $? -ne 0 ]; then
    echo "ERROR   - Failed Retry Upload of $video_path.  Please investigate."
    exit 2
  else
    echo "SUCCESS - $video_path uploaded"
    echo "STATUS  - Removing $video_path"
    rm $video_path
  fi
else  # Video file not found so start new record and download
  echo "STATUS - Recording $record_time_sec seconds of Video to $video_path"
  /usr/bin/avconv -t $record_time_sec -f video4linux2 -i /dev/video0 $video_path
  if [ -f $video_path ]; then
    echo "STATUS  - Upload $video_path using gdrive"
    /usr/local/bin/gdrive push -no-prompt -ignore-conflict $video_path  
    if [ $? -ne 0 ]; then
      echo "ERROR   - Failed to Upload $video_path  Please investigate."
      exit 2
    else
      echo "STATUS  - Move $video_path to $video_dir/prev_$video_name"
      if [ -f $video_dir/prev_$video_name ]; then
        rm $video_dir/prev_$video_name
      fi
      mv $video_path $video_dir/prev_$video_name
      echo "SUCCESS - Uploaded $video_path"
      vid_num=$((vid_num+1))   
      if [ $vid_num -gt $vid_num_max ]; then
        vid_num=1
      fi
      echo 'Next video_num='$vid_num
      echo $vid_num > webcam.dat
    fi
  else  
    echo "ERROR   - $video_path video Not Found."
    echo "          Possible cause avconv problem, permissions, space Etc." 
  fi
fi 
echo "Done at $(date)" 
exit  
# ------------------------ End Main Script --------------------------
