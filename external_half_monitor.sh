#!/bin/bash
Main_Screen=eDP-1
Unused_Screen=HDMI-1
Tab_resolution=1728\ 1080
Modeline=$(gtf $Tab_resolution 60 | grep Modeline)
Modeline=${Modeline:28:100}
Modename=$(echo $Tab_resolution | sed 's/\ /x/g')_60.00
if [[ $(xrandr | grep $Modename | wc -c) -lt 4 ]]
    then
        echo "Adding new mode."
        xrandr --newmode "$Modename" $Modeline
    else
        echo "Using available mode."
fi
xrandr --addmode $Unused_Screen $Modename
xrandr --output $Unused_Screen --mode $Modename --right-of $Main_Screen
echo "Ok, the screen has been setup. Try to connect via a vnc client. Your IP is"
ip a | awk -F '[/ ]+' '/inet / {print $3}' | grep 192
x0vncserver PasswordFile=~/.vnc/passwd SecurityTypes=VncAuth Geometry=1920x1080+1920+0000
xrandr --output $Unused_Screen --off
