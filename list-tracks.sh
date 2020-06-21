#!/bin/bash
#
# Upload audio file with a cover image to Youtube
# Arg 1 = Audio file extension

EPOCH='jan 1 1970'
CURRENT_TIME=0
TRACK_NUMBER=0
printf "Tracklist:\n"

for f in *."$1"; do
    TRACK_NUMBER="$((TRACK_NUMBER + 1))"
    TRACK_DURATION="$(ffprobe "$f" 2>&1 | sed -n -e 's/\s*Duration\s*:\s*//p' | sed -n -e 's/\..*//p')"
    TRACK_ARTIST="$(ffprobe "$f" 2>&1 | sed -n -e 's/\s*ARTIST\s*:\s*//p')"
    TRACK_TITLE="$(ffprobe "$f" 2>&1 | sed -n -e 's/\s*TITLE\s*:\s*//p')"
    printf '%02d (%02d:%02d:%02d) - %s - %s\n' $TRACK_NUMBER $((CURRENT_TIME / 3600)) $((CURRENT_TIME % 3600 / 60)) $((CURRENT_TIME % 60)) "$TRACK_ARTIST" "$TRACK_TITLE"
    CURRENT_TIME="$(date -u -d "$EPOCH $TRACK_DURATION" +%s) + $CURRENT_TIME"
done
