#!/bin/bash

# configure SATIP server name/IP address, here
SERVER="192.168.1.113"
#SERVER="192.168.178.42"
# cleanup old files
rm -r 1 2 3 4
mkdir 1 2 3 4
rm *.php
rm *.m3u
rm /tmp/*.m3u
P1=13.0E
P2=19.2E
P3=23.5E
P4=28.2E
#tv-13.0E-fta.php
declare -a P
P=($P1 $P2 $P3 $P4 )

# download PHP files from kingofsat
cd 1
wget https://de.kingofsat.net/tv-$P1-fta.php
python ../getchannels.py $SERVER tv-$P1-fta.php 1
cd ..
cd 2
wget https://de.kingofsat.net/tv-$P2-fta.php
python ../getchannels.py $SERVER tv-$P2-fta.php 2
cd ..
cd 3
wget https://de.kingofsat.net/tv-$P3-fta.php
python ../getchannels.py $SERVER tv-$P3-fta.php 3
cd ..
cd 4
wget https://de.kingofsat.net/tv-$P4-fta.php
python ../getchannels.py $SERVER tv-$P4-fta.php 4
cd ..
cp */*.m3u .
cat *.m3u > allChannels.m3u
sed 's/pol=V/pol=v/g' allChannels.m3u > /tmp/allChannels.m3u && sed 's/pol=H/pol=h/g'  /tmp/allChannels.m3u > SATIP_All_Channels.m3u
for i in "${P[@]}";
do
sed 's/pol=V/pol=v/g' tv-$i-fta.m3u > /tmp/tv-$i-fta.m3u && sed 's/pol=H/pol=h/g' /tmp/tv-$i-fta.m3u > TV-$i-Fta-Lang.m3u
done
rm tv-*-fta.m3u allChannels.m3u
rm -r 1/ 2/ 3/ 4/
