#!/bin/bash

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

passes=0
fails=0

for i in $(cd -- "$TESTS_DIR"/data; find * -name setup.sh -printf %h\\n | sort); do
	if [ -n "$1" ]; then
		SETUP_PATH=$TESTS_DIR/data/$i/setup.sh
		CATEGORY=
		. "$SETUP_PATH"

		CATEGORY_MATCH=
		for j in $1; do
			for k in $CATEGORY; do
				if [[ $k == $j* ]]; then
					CATEGORY_MATCH=y
					break
				fi
			done

			if [ -n "$CATEGORY_MATCH" ]; then
				break
			fi
		done

		if [ -z "$CATEGORY_MATCH" ]; then
			continue
		fi
	fi

	mkdir -p "$TESTS_DIR/logs/$i"
	printf "%-70s" "$i"
	"$TESTS_DIR"/run_test.sh "$i" >"$TESTS_DIR/logs/$i/out.log" 2>&1
	ret=$?
	if [ $ret -eq 0 ]; then
		((++passes))
		printf "[\\x1b[92mPASS\\x1b[39m]\\n"
	else
		((++fails))
		printf "[\\x1b[91mFAIL\\x1b[39m]\\n"
	fi
done

printf "Tests passed: %d/%d\\n" $passes $((passes + fails))
printf "Tests failed: %d\\n" $fails
