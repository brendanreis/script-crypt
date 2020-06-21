#!/bin/bash
#
# Extract palette

convert "$1" -resize 300x -dither None -colors "$2" txt: | tail -n +2 | tr -s ' ' | cut -d ' ' -f 3 | sort | uniq -c | sort -rn | tr -s ' ' | cut -d ' ' -f 3
