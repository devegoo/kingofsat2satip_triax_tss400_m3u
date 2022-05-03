#!/bin/bash
IP=$(/sbin/ip route | awk '/default/ { print $3 }')
echo your router ip adress is $IP
echo aplly config for VLC on this computer TIP: install before by package manager
newurl=satip-channellist-url=http://$IP/Master.m3u
oldurl=satip-channellist-url=http://*/Master.m3u
emptyurl=satip-channellist-url=
sed 's/#satip-channelist=/satip-channelist=/g' ~/.config/vlc/vlcrc > /tmp/vlcrc && mv /tmp/vlcrc ~/.config/vlc/vlcrc
sed 's/satip-channelist=Auto/satip-channelist=/g' ~/.config/vlc/vlcrc > /tmp/vlcrc && mv /tmp/vlcrc ~/.config/vlc/vlcrc
sed 's/satip-channelist=/satip-channelist=CustomList/g' ~/.config/vlc/vlcrc > /tmp/vlcrc && mv /tmp/vlcrc ~/.config/vlc/vlcrc
sed 's/#satip-channellist-url=/satip-channellist-url=/g' ~/.config/vlc/vlcrc > /tmp/vlcrc && mv /tmp/vlcrc ~/.config/vlc/vlcrc
sed --expression "s@$emptyurl@$newurl@" ~/.config/vlc/vlcrc > /tmp/vlcrc && mv /tmp/vlcrc ~/.config/vlc/vlcrc
sed --expression "s@$oldurl@$newurl@" ~/.config/vlc/vlcrc > /tmp/vlcrc && mv /tmp/vlcrc ~/.config/vlc/vlcrc
