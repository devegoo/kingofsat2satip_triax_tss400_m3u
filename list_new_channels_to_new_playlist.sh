#!/bin/bash
rm NEW*
P1=13.0E
P2=19.2E
P3=23.5E
P4=28.2E
touch --date $(date +%F) /tmp/foo
list_new=FTA/"ALL_FTA_$P1-$P2-$P3-$P4-$(date +%F)-"*".m3u"
list_old=$(find FTA/ALL_FTA_* -newer /tmp/foo)
grep -Fxvf $list_new $list_old >> NEW_CHANNELS.m3u
cd ..

