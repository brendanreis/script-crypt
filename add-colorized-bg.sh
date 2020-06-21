#!/bin/bash
#
# Impose a foreground image on a background grayscale w/ alpha image that's been colorized
# using colors extracted from the former
#
# Arg 1 = Input background image file
# Arg 2 = Input foreground image file
# Arg 3 = Output image file

TEMP_IMG="acbg_temp.png"

COLORS=$(extract-palette.sh "$2" 2)
COLOR_1=$(echo "$COLORS" | sed -n 1p)
echo "COLOR_1=$COLOR_1"
COLOR_2=$(echo "$COLORS" | sed -n 2p)
echo "COLOR_2=$COLOR_2"

convert "$1" +level-colors "$COLOR_1" -background "$COLOR_2" -alpha remove -alpha off "$TEMP_IMG"
composite -gravity center -geometry x1080 "$2" "$TEMP_IMG" "$3"

rm "$TEMP_IMG"
