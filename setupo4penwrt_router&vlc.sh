#!/bin/bash
IP=$(/sbin/ip route | awk '/default/ { print $3 }')
echo $IP
place=root@$IP:/www
file=$(date +%F)-fta.m3u
cp FTA/$(date +%F)/ALL_FTA-$(date +%F)-*.m3u $file
scp $file $place/$file
newurl=satip-channellist-url=http://$IP/$file
oldurl=satip-channellist-url=http://$IP/*.m3u
sed 's/#satip-channellist-url=/satip-channellist-url=/g' ~/.config/vlc/vlcrc > /tmp/vlcrc && mv /tmp/vlcrc ~/.config/vlc/vlcrc
sed --expression "s@$oldurl@$newurl@" ~/.config/vlc/vlcrc > /tmp/vlcrc && mv /tmp/vlcrc ~/.config/vlc/vlcrc
