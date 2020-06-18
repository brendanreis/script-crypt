#!/bin/bash
#
# Upload audio file with a cover image to Youtube
# Arg 1 = Video Title
# Arg 2 = Audio file extension
# Arg 3 = Cover image file name

# Get timestamped list of tracks for video description
DESCRIPTION="$(list-tracks "$2")"

# Combine audio files
sox --show-progress -- *."$2" output."$2"

# Huge thanks to Supermastia:
# https://blog.supermasita.com/2019/02/28/FFMPEG-Create_a_video_with_audio_and_still_image.html
ffmpeg -loop 1 -framerate 2 -i "$3" -i output.flac \
    -c:v libx264 -tune stillimage -crf 0 -c:a aac \
    -ab 320k -strict -2 -shortest -pix_fmt yuv420p -vf scale=1920:1080 output.mp4

# Upload to YouTube
youtube-upload --title="$1" --category="Music" output.mp4 --description="$DESCRIPTION"

# Cleanup
rm -f output."$2" output.mp4
