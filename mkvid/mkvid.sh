#!/bin/bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
CUR_DIR=$(pwd)
FILENAME=$1
RAW=
#RAW=--raw

if [ -z "$FILENAME" ]; then
	exit 1
fi

tmpdir=
function cleanup () {
	if [ -n "$tmpdir" ]; then
		rm -rf "$tmpdir"
	fi
}
trap cleanup EXIT
tmpdir=$(mktemp -d)

cd "$tmpdir"

"$SCRIPT_DIR/mkimgs" $RAW <"${CUR_DIR}/${FILENAME}.vid"

i=0

IMGSIZE=640x576
if [ -n "$RAW" ]; then
	IMGSIZE=160x144
fi

while [ -f $(printf img%06d.rgb $i) ]; do
	magick -size $IMGSIZE -depth 8 RGB:$(printf img%06d.rgb $i) $(printf img%06d.png $i)
	((++i))
done

num_frames=$i

ffmpeg -r 64 -f image2 -s $IMGSIZE \
       -start_number 0 -i img%06d.png \
       -vframes $num_frames -vcodec libx264 \
       -crf 25 -pix_fmt yuv420p video.mp4

ffmpeg -y -i video.mp4 -i "${CUR_DIR}/${FILENAME}.snd" -c:v copy -c:a mp3 "${CUR_DIR}/${FILENAME}.mkv"

