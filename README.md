# ExternalHalfMonitor
Use an android tablet as second screen via vnc.

## Dependencies
A vnc server, xrandr and a disconnected video output. In the following we will use eDP-1 as main screen, HDMI-1 as the disconnected outputand use the x0vncserver package from [TigerVNC](https://tigervnc.org/). It is configured via a PasswordFile in the directory ~/.vnc/
Using TigerVNC, the creation of the file is guided by the command 'vncpasswd'.

## Preparation:
Download the script external_vnc_monitor.sh and open it with a text editor. Identify the main screen and a disconnected source (type 'xrandr' in a terminal window and inspect the output). Replace 'eDP-1' with your main screen and 'HDMI-1' with the unused output.
Modify the resolution of the tablet according to yours; default is the resolution of 1728x1080.
Open a terminal window in the folder where the file extend_half_monitor.sh and launch the command
```
chmod +x external_vnc_monitor.sh
```

## Usage:
Open a terminal window in the folder where the file extend_half_monitor.sh is. Then, launch it with the command
~~~
./external_vnc_monitor.sh
~~~
to exit, press Ctrl+C.

## Opional:
To access the script from any directory, you can link it to the /usr/bin or ~/bin folder, depending on your installation.
~~~
sudo ln -s ./external_vnc_monitor.sh /usr/bin/external_vnc_monitor
~~~
so that it can be accessed as the command `external_vnc_monitor`.
