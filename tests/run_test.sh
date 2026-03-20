#!/bin/bash

set -e -x

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
ROOT_DIR=$TESTS_DIR/..

PNG_PATH=$TESTS_DIR/data/$1/result.png
PNG_ALT_PATH=$TESTS_DIR/data/$1/result-alt.png
PNG_XFAIL_PATH=$TESTS_DIR/data/$1/result-xfail.png
SETUP_PATH=$TESTS_DIR/data/$1/setup.sh
ROM_PATH=$TESTS_DIR/roms/$1.gb

if ! [ -r "$PNG_PATH" -o -r "$PNG_XFAIL_PATH" ]; then
	echo Result picture for test not found: \""$PNG_PATH"\" or \""$PNG_XFAIL_PATH"\" >&2
	exit 1
fi
if ! [ -r "$SETUP_PATH" ]; then
	echo Setup script for test not found: \""$SETUP_PATH"\" >&2
	exit 1
fi
if ! [ -r "$ROM_PATH" ]; then
	echo ROM file for test not found: \""$ROM_PATH"\" >&2
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

. "$SETUP_PATH"

vvp -N "$ROOT_DIR"/dmg_cpu_b_gameboy.vvp \
	-none \
	+VID_FILE="$tmpdir"/test.vid \
	+BOOTROM="$ROOT_DIR"/boot/quickboot.bin \
	+ROM="$ROM_PATH" \
	+SECS=$SECS

cd -- "$tmpdir"

"$ROOT_DIR"/mkvid/mkimgs --raw <test.vid

if [ -d "$TESTS_DIR/logs/$1" ]; then
	magick -size 160x144 -depth 8 RGB:$(printf img%06d.rgb $FRAME) out.png
	mv out.png "$TESTS_DIR/logs/$1/"
fi

if [ -r "$PNG_PATH" ]; then
	magick "$PNG_PATH" RGB:result.rgb
	if cmp $(printf img%06d.rgb $FRAME) result.rgb; then
		exit 0
	if [ -r "$PNG_ALT_PATH" ]; then
		magick "$PNG_ALT_PATH" RGB:result.rgb
		if cmp $(printf img%06d.rgb $FRAME) result.rgb; then
			exit 0
		fi
	fi
fi
if [ -r "$PNG_XFAIL_PATH" ]; then
	magick "$PNG_XFAIL_PATH" RGB:result.rgb
	if cmp $(printf img%06d.rgb $FRAME) result.rgb; then
		exit 32
	fi
fi
exit 1
