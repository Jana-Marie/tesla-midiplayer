#!/bin/bash
#generates a midishrc depending on the number of connected tesla coils and the output of analyze.sh

DEVS=$(find /dev/ | grep -w "midi[1-9]" | awk -F" " '{print $1}' | sort)
DEVCNT=0
for i in $DEVS
do
    echo "dnew $DEVCNT \"$i\" rw"
    let DEVCNT=DEVCNT+1
done

echo "fnew otterfilter"

let NUMBEROFCOILS=(DEVCNT-1)*2
NUM=$(head -n $NUMBEROFCOILS | sed 's/.*[ ]//' | sort -R)
DEVCNT=1
CHCNT=0
for c in $NUM;
do
	echo "fmap {any {0 $c}} {any {$DEVCNT $CHCNT}}"
	let CHCNT=CHCNT+1
        if [ "$CHCNT" -eq 2 ]
	then
		let CHCNT=0
		let DEVCNT=DEVCNT+1
	fi
done
echo "finfo"

