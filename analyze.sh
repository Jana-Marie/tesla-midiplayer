#!/bin/bash
midicsv $1 | sed 's/,.*$//' | sed '/^0/d' | uniq -c | sort -nr
