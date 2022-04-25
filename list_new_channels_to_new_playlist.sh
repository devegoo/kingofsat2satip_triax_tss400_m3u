#!/bin/bash
P1=13.0E
P2=19.2E
P3=23.5E
P4=28.2E
list_new=FTA/$(date +%F)/ALL_FTA_$P1-$P2-$P3-$P4-$(date +%F)-*.m3u
list_old=FTA/$(date -d "yesterday" +%F)/ALL_FTA_$P1-$P2-$P3-$P4-$(date -d "yesterday" +%F)-*.m3u
grep -Fxvf $list_new $list_old >> removed-$(date +%F)-$(date +%M).m3u
grep -Fxvf $list_old $list_new >> added-$(date +%F)-$(date +%M).m3u
