#!/bin/bash

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

TESTS=()

MAX_LEN=10

while read -d '' -r i; do
	TESTS+=("$i")
	if [ $MAX_LEN -lt ${#i} ]; then
		MAX_LEN=${#i}
	fi
done < <(cd -- "$TESTS_DIR"/data; find * -name setup.sh -printf %h\\0 | sort -z)

while [ ${#TESTS[*]} -ne 0 ]; do
	i=${TESTS[0]}
	TESTS=("${TESTS[@]:1}")
	SETUP_PATH=$TESTS_DIR/data/$i/setup.sh
	SECS=
	CATEGORY=
	. "$SETUP_PATH"
	printf "%-${MAX_LEN}s  %4.1fs  %s\n" "$i" $SECS "$CATEGORY"
done
