# kingofsat2satip
Usage:
Adapt getchannels_*.sh to your needs - change SAT>IP server name (ip), adapt satellite positions you receive and lang for positions , modify  sh script calls regarding your setup 
Then just execute the sh script, it downloads PHP files from kingofsat.net and creates M3U files with SAT>IP http URLs for TRIAX TSS400. The M3U playlists can be used i.e. with VLC.
```
chmod +x *.sh

sh ./getchannels_fta.sh //for all fta channels (radio+tv) on selected positions

or 

sh ./getchannels_lang.sh ///for all fta lang selected channels (radio+tv) on selected positions


MOD for TRIAX TSS400 


tested playeers :

VLC 

list_new_channels_to_new_playlist.sh    is for compare changes on configured positions (not all orbital psitions) and create playlist for added end removed channels in m3u format / must run day by day / it is possible to add to starup scripts or cron/systemd as service this 2 scripts and automate processing of result files


or run 

./ftadiseqc.sh

if you have more complex diseqc setup on your triax tss400 server
chmod +x *.sh

sh ./getchannels_fta.sh //for all fta channels (radio+tv) on selected positions

or 

sh ./getchannels_lang.sh ///for all fta lang selected channels (radio+tv) on selected positions


MOD for TRIAX TSS400 


tested playeers :

VLC 

list_new_channels_to_new_playlist.sh    is for compare changes on configured positions (not all orbital psitions) and create playlist for added end removed channels in m3u format / must run day by day / it is possible to add to starup scripts or cron/systemd as service this 2 scripts and automate processing of result files


or run 

./ftadiseqc.sh

if you have more complex diseqc setup on your triax tss400 server

<img width="964" alt="java 8 and prio java 8  array review example" src="">


