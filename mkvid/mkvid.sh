#!/bin/bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
CUR_DIR=$(pwd)
FILENAME=$1

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

"$SCRIPT_DIR/mkimgs" <"${CUR_DIR}/${FILENAME}.vid"

i=0

while [ -f $(printf img%06d.rgb $i) ]; do
	convert -size 640x576 -depth 8 RGB:$(printf img%06d.rgb $i) $(printf img%06d.png $i)
	((++i))
done

num_frames=$i

ffmpeg -r 64 -f image2 -s 640x576 \
       -start_number 0 -i img%06d.png \
       -vframes $num_frames -vcodec libx264 \
       -crf 25 -pix_fmt yuv420p video.mp4

ffmpeg -y -i video.mp4 -i "${CUR_DIR}/${FILENAME}.snd" -c:v copy -c:a mp3 "${CUR_DIR}/${FILENAME}.mkv"

