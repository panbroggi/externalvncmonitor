# External VNC Monitor
Use an android tablet as second screen via vnc.

## How it works
This is a script that uses a valid (but disconnected) video output to create an extension of the main screen and makes it accessible through vnc.

## Dependencies
A vnc server, xrandr and a disconnected video output. In the following we will use eDP-1 as main screen, HDMI-1 as the disconnected outputand use the x0vncserver package from [TigerVNC](https://tigervnc.org/). Using Ubuntu, the command is installed by the command
```
sudo apt update
sudo apt install tigervnc-standalone-server
```
It is configured via a PasswordFile in the directory ~/.vnc/ ; the creation of the file is guided by the command
```
vncpasswd
```

## Preparation:
1. [Download the script external_vnc_monitor.sh](https://github.com/panbroggi/externalvncmonitor/blob/main/external_vnc_monitor.sh) and open it with a text editor. 
2. Identify the main screen and a disconnected source (type 'xrandr' in a terminal window and inspect the output). Replace 'eDP-1' with your main screen and 'HDMI-1' with the unused output.
3. Modify the resolution of the tablet according to yours; default is the resolution of 1728x1080. This value is obtained by rescaling the original resolution of the tablet (2560x1600) to the height 1080 of the main screen. 
4. Open a terminal window in the folder containing extend_half_monitor.sh and run the command
```
chmod +x external_vnc_monitor.sh
```

## Usage:
Open a terminal window in the folder where the file extend_half_monitor.sh is. Then, launch it with the command
~~~
./external_vnc_monitor.sh
~~~
The program will print your IP, so that you can enter it in any vnc client. The program will also start the x0vncserver command.
Press Ctrl+C to terminate the vnc server and turn off the virtual monitor.
Start a vnc client on your android tablet - *e.g.* the android app [bVBC](https://play.google.com/store/apps/details?id=com.iiordanov.freebVNC) - and create a new connection with your IP as VNC server.

## Optional:
To access the script from any directory, you can link it to the /usr/bin or ~/bin folder, depending on your installation.
~~~
sudo ln -s ./external_vnc_monitor.sh /usr/bin/external_vnc_monitor
~~~
so that it can be accessed by running `external_vnc_monitor` in a terminal window.

### Miscellanea:
* You can go to the virtual extension and visualize its content if you zoom the system in KDE (default mapping Meta+=).
* Using the screenshot tool KDE Spectacle, the virtual extension is also grabbed.
