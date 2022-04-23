# kingofsat2satip

##### Usage:
Adapt getchannels.sh to your needs - change SAT>IP server name, adapt URLs to satellite positions you receive (check URLs at kingofsat.net), modify python script calls regarding your DiSEqC setup.
Then just execute the sh script, it downloads PHP files from kingofsat.net and creates M3U files with SAT>IP RTSP URLs. The M3U playlists can be used i.e. with VLC.
```
chmod +x *.sh

sh ./getchannels_fta.sh //for all fta channels (radio+tv) on selected positions

or 

sh ./getchannels_lang.sh ///for all fta lang selected channels (radio+tv) on selected positions


MOD for TRIAX TSS400 


tested playeers :

VLC 
