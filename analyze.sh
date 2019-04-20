#!/bin/bash
# midi analyzer, will print all occuring channels and note count on channels
midicsv $1 | sed 's/,.*$//' | sed '/^0/d' | uniq -c | sort -nr | awk -F" " '{printf $2":"}'
