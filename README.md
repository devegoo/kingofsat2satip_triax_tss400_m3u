for ftadiseqc.sh

Preconfigured  positions for 4 x 1/4 DiseQc (16 ports/sat positions) for example 4 antenas with 4 port diseqc switch each or multi antenna (for example "Wavefrontier")

#tuner 1

T1P1=39.0E
T1P2=42.0E
T1P3=46.0E
T1P4=50.0E

#tuner 2

T2P1=26.0E
T2P2=28.2E
T2P3=31.0E
T2P4=36.0E

#tuner 3

T3P1=16.0E
T3P2=19.2E
T3P3=21.5E
T3P4=23.5E

#tuner 4

T4P1=4.8E
T4P2=7.0E
T4P3=10.0E
T4P4=13.0E



<img width="964" alt="diseqc" src="https://github.com/devegoo/kingofsat2satip_triax_tss400_m3u/blob/master/src_satip_diseqc_sat_positions.png">

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




