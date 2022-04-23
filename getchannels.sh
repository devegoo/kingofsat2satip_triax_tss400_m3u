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

P1=13E
P2=19.2E
P3=23.5E
P4=28.2E
declare -a P
P=($P1 $P2 $P3 $P4 )

L1=pol
L2=ger
L3=ger
L4=eng
declare -a L
L=($L1 $L2 $L3 $L4 )
# download PHP files from kingofsat
cd 1
wget "https://de.kingofsat.net/freqs.php?&pos=$P1&standard=All&ordre=freq&filtre=Clear&cl=$L1"
mv "freqs.php?&pos=$P1&standard=All&ordre=freq&filtre=Clear&cl=$L1" tv-$P1-fta.php
python ../getchannels.py $SERVER tv-$P1-fta.php 1
cd ..
cd 2
wget "https://de.kingofsat.net/freqs.php?&pos=$P2&standard=All&ordre=freq&filtre=Clear&cl=$L2"
mv "freqs.php?&pos=$P2&standard=All&ordre=freq&filtre=Clear&cl=$L2" tv-$P2-fta.php
python ../getchannels.py $SERVER tv-$P2-fta.php 2
cd ..
cd 3
wget "https://de.kingofsat.net/freqs.php?&pos=$P3&standard=All&ordre=freq&filtre=Clear&cl=$L3"
mv "freqs.php?&pos=$P3&standard=All&ordre=freq&filtre=Clear&cl=$L3" tv-$P3-fta.php
python ../getchannels.py $SERVER tv-$P3-fta.php 3
cd ..
cd 4
wget "https://de.kingofsat.net/freqs.php?&pos=$P4&standard=All&ordre=freq&filtre=Clear&cl=$L4"
mv "freqs.php?&pos=$P4&standard=All&ordre=freq&filtre=Clear&cl=$L4" tv-$P4-fta.php
python ../getchannels.py $SERVER tv-$P4-fta.php 4
cd ..

# call python script to extract channel information from php files and generate m3u files
# the number at the end of the call is the satip src parameter (diseqc position)

# merge all m3u files together
cp */*.m3u .
cat *.m3u > allChannels.m3u
sed 's/pol=V/pol=v/g' allChannels.m3u > /tmp/allChannels.m3u && sed 's/pol=H/pol=h/g'  /tmp/allChannels.m3u > SATIP_All_Channels.m3u
for i in "${P[@]}";
do
sed 's/pol=V/pol=v/g' tv-$i-fta.m3u > /tmp/tv-$i-fta.m3u && sed 's/pol=H/pol=h/g' /tmp/tv-$i-fta.m3u > TV-$i-Fta-Lang.m3u
done
rm tv-*-fta.m3u allChannels.m3u
rm -r 1/ 2/ 3/ 4/
