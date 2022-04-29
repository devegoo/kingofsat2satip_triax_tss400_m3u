#!/bin/bash
mkdir DATABASE
rm Alladded.m3u AllRemoved.m3u
list_new=FTA/$(date +%F)/ALL_FTA-$(date +%F)-*.m3u
list_old=FTA/$(date -d "yesterday" +%F)/ALL_FTA-$(date -d "yesterday" +%F)-*.m3u
grep -Fxvf $list_new $list_old >> DATABASE/removed-$(date +%F)-$(date +%M).m3u
grep -Fxvf $list_old $list_new >> DATABASE/added-$(date +%F)-$(date +%M).m3u
cat DATABASE/removed*.m3u >> AllRemoved.m3u
cat DATABASE/added*.m3u >> Alladded.m3u
