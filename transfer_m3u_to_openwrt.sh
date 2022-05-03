#!/bin/bash
IP=$(/sbin/ip route | awk '/default/ { print $3 }')
echo Your router ip adress is $IP
place=root@$IP:/www
file=openwrt_www/*.m3u
echo "confirm "yes" when asked or when fail  "rm .ssh/known_hosts" manually"
scp $file $place/
