 #!/bin/bash
# configure SATIP server name/IP address, here
#SERVER="192.168.178.42"
SERVER="192.168.1.113"
# T1 = tuner 1,T2 = tuner 2,T3 = tuner3,T4 = tuner 4
# P1 = diseqc A,P2 = diseqc B,P3 = diseqc C,P4 = diseqc D
#tuner 1
T1P1=
T1P2=19.2E
T1P3=23.5E
T1P4=28.2E
#tuner 2
T2P1=13.0E
T2P2=
T2P3=
T2P4=
#tuner 3
T3P1=7.0E
T3P2=
T3P3=
T3P4=
#tuner 4
T4P1=4.8E
T4P2=
T4P3=
T4P4=39.0E
DIR=($T1P1 $T1P2 $T1P3 $T1P4 $T2P1 $T2P2 $T2P3 $T2P4 $T3P1 $T3P2 $T3P3 $T3P4 $T4P1 $T4P2 $T4P3 $T4P4)
OUTFILES=(*.php *.m3u /tmp/*.m3u)
if [ -f $OUTFILES ]; then
    rm $OUTFILES
fi
rm -r "${DIR[@]}"
mkdir "${DIR[@]}"
	    echo '1' > $T1P1/N.txt
	    echo '1' > $T1P2/N.txt
	    echo '1' > $T1P3/N.txt
	    echo '1' > $T1P4/N.txt
	    echo '2' > $T2P1/N.txt
	    echo '2' > $T2P2/N.txt
	    echo '2' > $T2P3/N.txt
	    echo '2' > $T2P4/N.txt
	    echo '3' > $T3P1/N.txt
	    echo '3' > $T3P2/N.txt
	    echo '3' > $T3P3/N.txt
	    echo '3' > $T3P4/N.txt
	    echo '4' > $T4P1/N.txt
	    echo '4' > $T4P2/N.txt
	    echo '4' > $T4P3/N.txt
	    echo '4' > $T4P4/N.txt
# download PHP files from kingofsat
for i in "${DIR[@]}";
 do
cd $i
wget https://de.kingofsat.net/tv-$i-fta.php
cd ..
done
for i in "${DIR[@]}";
do
cd $i
src=$(cat "N.txt")
python ../getchannels.py $SERVER tv-$i-fta.php $src
cd ..
done
mkdir FTA
mkdir FTA/$(date +%F)
for i in "${DIR[@]}";
do
sed 's/pol=V/pol=v/g' $i/tv-$i-fta.m3u > /tmp/tv-$i-fta.m3u && sed 's/pol=H/pol=h/g' /tmp/tv-$i-fta.m3u > FTA/$(date +%F)/TV-$i-FTA-$(date +%F)-$(date +%M).m3u
done
cat FTA/$(date +%F)/*.m3u > FTA/$(date +%F)/allChannels.m3u
sed 's/pol=V/pol=v/g' FTA/$(date +%F)/allChannels.m3u > /tmp/allChannels.m3u && sed 's/pol=H/pol=h/g'  /tmp/allChannels.m3u > FTA/$(date +%F)/ALL_FTA_$P1-$P2-$P3-$P4-$(date +%F)-$(date +%M).m3u

