#!/bin/bash

i=0

while [ -f $(printf img%06d.rgb $i) ]; do
	convert -size 640x576 -depth 8 RGB:$(printf img%06d.rgb $i) $(printf img%06d.png $i)
	((i++))
done

num_frames=$i

ffmpeg -r 64 -f image2 -s 640x576 \
       -start_number 0 -i img%06d.png \
       -vframes $num_frames -vcodec libx264 \
       -crf 25 -pix_fmt yuv420p video.mp4
