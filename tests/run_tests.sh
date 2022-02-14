#!/bin/bash

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

passes=0
fails=0

for i in $(cd -- "$TESTS_DIR"/data; find * -name setup.sh -printf %h\\n | sort); do
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
