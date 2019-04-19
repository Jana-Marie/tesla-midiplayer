#!/bin/bash
killall midish
./analyze.sh $1 | ./generateTemplate.sh > ~/.midishrc 
cat ~/.midishrc
midish &
aplaymidi -p 24:0 $1
