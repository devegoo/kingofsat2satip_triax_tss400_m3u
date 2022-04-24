#!/bin/bash
DATE_D=date +%F
DATE_T=date +%T
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
mkdir LANG FTA
cp */*.m3u .
cat *.m3u > allChannels.m3u
mkdir FTA/$(date +%F)
sed 's/pol=V/pol=v/g' allChannels.m3u > /tmp/allChannels.m3u && sed 's/pol=H/pol=h/g'  /tmp/allChannels.m3u > FTA/$(date +%F)/ALL_FTA_$P1-$P2-$P3-$P4-$(date +%F)-$(date +%M).m3u
for i in "${P[@]}";
do
sed 's/pol=V/pol=v/g' tv-$i-fta.m3u > /tmp/tv-$i-fta.m3u && sed 's/pol=H/pol=h/g' /tmp/tv-$i-fta.m3u > FTA/$(date +%F)/TV-$i-FTA-$(date +%F)-$(date +%M).m3u
done
rm tv-*-fta.m3u allChannels.m3u
rm -r 1/ 2/ 3/ 4/ *.m3u

touch --date $(date +%F) /tmp/foo
list_new=FTA/$(date +%F)/ALL_FTA_$P1-$P2-$P3-$P4-$(date +%F)-$(date +%M).m3u
list_old=$(find FTA/$(date +%F)/ALL_FTA_$P1-$P2-$P3-$P4-$(date +%F)-*.m3u -newer /tmp/foo)
grep -Fxvf $list_new $list_old >> added-$(date +%F)-$(date +%M).m3u
grep -Fxvf $list_old $list_new >> removed-$(date +%F)-$(date +%M).m3u
