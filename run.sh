#!/bin/bash
TRACKS=$(./analyze.sh $1)
python2.7 split.py $1 $TRACKS 6 20:0 24:0 28:0 > play.sh
bash play.sh
echo "killall aplaymidi"
