#!/bin/bash

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

CATEGORIES=

while read -d '' -r i; do
	SETUP_PATH=$TESTS_DIR/data/$i/setup.sh
	CATEGORY=
	. "$SETUP_PATH"

	CATEGORIES="$CATEGORIES $CATEGORY"
done < <(cd -- "$TESTS_DIR"/data; find * -name setup.sh -printf %h\\0)

for i in $CATEGORIES; do
	echo $i
done | sort | uniq
