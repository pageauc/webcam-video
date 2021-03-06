#### bash script to Record and Upload Web Cam Videos Securely to a users google drive

This is a Raspberry Pi Bash script that uses a usb connected webcam to take short video
sequences in round robin fashion, encodes and securely uploads the videos to
the users google drive using an internet connection.
The camvid.sh script is self contained and is easily edited.

#### Quick Install
From a Raspberry Pi SSH or console terminal session.

    cd ~
    wget https://raw.github.com/pageauc/webcam-video/master/install.sh
    chmod +x install.sh
    ./install.sh

#### How to Initialize gdrive security token
Note I now recommend using rclone. See my Github project here https://github.com/pageauc/rclone4pi

Setup gdrive security for secure access to your google drive. Note: This assumes you have a google drive with a google account eg gmail and you are using a SSH terminal session on a networked PC logged into your Raspberry Pi computer. for additional details see https://github.com/odeke-em/drive
From a windows PC that has the Chrome browser or equivalent installed and logged into your google account eg gmail.
Login to the Raspberry Pi using SSH session on the PC. This may also be able to be done within a RPI browser desktop session but I have not tried that so I will outline the PC SSH terminal session method that works for me.
From a logged in SSH session execute the following commands.

    cd ~/camvid
    gdrive init

Command above will display a long url in the RPI SSH session.

1. In SSH window use mouse left button to highlight the very long url (do NOT press enter)
2. On the PC Chrome Browser window open a new browser tab and right click in the top url box
3. Make sure you are logged into your google account eg gmail
4. Right mouse click in the browser new tab url box (at top) and select paste and go
5. This will display a google message to confirm security access
6. Read message and if you Accept then a security code box will be displayed showing a security token
7. Use left mouse to highlight security code then right click and copy
8. Return to RPI SSH session and right click at gdrive init prompt to paste security code token
9. Press enter to accept code.

If OK and no errors are displayed then a hidden .gd subfolder will be created in the camvid folder. .
The .gd folder contains gdrive security files. For syncing purposes the camvid folder will be considered as root.
To see the hidden files and folders

    cd ~/camvid
    ls -al

To list gdrive help type gdrive command with no parameters

    gdrive

To confirm access to your google drive perform the following. This should display the contents of your google drive root folder.
 
    gdrive list
    
Review user settings in camvid.sh script using nano editor.  ctrl-x y to save
Make sure Raspberry Pi has good internet connection and the web cam
usb cable is plugged into the RPI, then run camvid.sh script to test
per the following commands. 

    cd ~/camvid
    ./camvid.sh
    
Video Files will be stored in webcam-videos folder and uploaded to the
users google drive under webcam-videos folder.

Trouble shoot as required ...   

Good Luck Claude ...