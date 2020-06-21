#!/bin/bash
#
# Add subtitles to mkv files and output to the specified directory.
# Run from directory mkv and subtitle files are located in.
#
# Arg 1 = Original file name extension
# Arg 2 = Subtitle file name extension
# Arg 3 = Delay in seconds
# Arg 4 = Output directory

i=1

for f in *."$1"; do
    echo "$f"
    add-subtitles.sh "$f" "$i"."$2" "$3" "$4"
    ((i = i + 1))
done
