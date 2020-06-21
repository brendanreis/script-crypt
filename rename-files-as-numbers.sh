#!/bin/bash
#
# Rename files as numbers
# Arg 1 = File extension

i=1

for f in *."$1"; do
    new=$(printf "%d.""$1" "$i") #04 pad to length of 4
    echo "$new"
    mv -i -- "$f" "$new"
    ((i = i + 1))
done
