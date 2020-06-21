#!/bin/bash
#
# Add subtitles to mkv file and output to specified directory.
# Run from directory mkv and subtitle file are located in.
#
# Arg 1 = Original file name
# Arg 2 = Subtitle file name
# Arg 3 = Delay in seconds
# Arg 4 = Output directory

TEMP_SUB_FILE="subs.ass"

ffmpeg -itsoffset "$3" -i "$2" "$TEMP_SUB_FILE"
mkvmerge -o "$4/$1" "$1" "$TEMP_SUB_FILE"
rm "$TEMP_SUB_FILE"
