#!/bin/bash

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

PARALLEL_TESTS=${1:-1}
CATEGORY_FILTER=$2

passes=0
xfails=0
fails=0

TESTS=()

for i in $(cd -- "$TESTS_DIR"/data; find * -name setup.sh -printf %h\\n | sort); do
	if [ -n "$CATEGORY_FILTER" ]; then
		SETUP_PATH=$TESTS_DIR/data/$i/setup.sh
		CATEGORY=
		. "$SETUP_PATH"

		CATEGORY_MATCH=
		for j in $CATEGORY_FILTER; do
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

	TESTS+=("$i")
done

ACTIVE=()
ACTIVE_PID=()

CUR_DISP=0

trap "trap - TERM && kill -- -$$" INT TERM EXIT

echo

while [ ${#TESTS[*]} -ne 0 -o ${#ACTIVE[*]} -ne 0 ]; do
	while [ ${#TESTS[*]} -ne 0 -a ${#ACTIVE[*]} -lt $PARALLEL_TESTS ]; do
		i=${TESTS[0]}
		mkdir -p "$TESTS_DIR/logs/$i"
		TESTS=("${TESTS[@]:1}")
		"$TESTS_DIR"/run_test.sh "$i" </dev/null >"$TESTS_DIR/logs/$i/out.log" 2>&1 &
		pid=$!
		ACTIVE+=("$i")
		ACTIVE_PID+=($pid)
	done

	if [ $CUR_DISP -ge ${#ACTIVE[*]} ]; then
		CUR_DISP=0
	fi

	SLEEP_PID=
	if [ ${#ACTIVE[*]} -gt 1 ]; then
		sleep 2 &
		SLEEP_PID=$!
	fi

	i=${ACTIVE[$CUR_DISP]}
	if [ ${#ACTIVE[*]} -gt 1 ]; then
		printf "\\x1b[G\\x1b[K%-70s" "($((CUR_DISP+1)) of $PARALLEL_TESTS) $i"
	else
		printf "\\x1b[G\\x1b[K%-70s" "$i"
	fi

	wait -p DONE_PID -fn $SLEEP_PID ${ACTIVE_PID[*]}
	ret=$?

	if [ -z "$DONE_PID" ]; then
		echo "ERROR: DONE_PID not set!" >&2
		continue
	fi

	if [ -n "$SLEEP_PID" ] && [ $DONE_PID -eq "$SLEEP_PID" ]; then
		if [ $ret -ne 0 ]; then
			exit $ret
		fi
		((CUR_DISP++))
		continue
	fi

	for j in ${!ACTIVE[*]}; do
		if [ ${ACTIVE_PID[$j]} -eq $DONE_PID ]; then
			break
		fi
	done
	if [ ${ACTIVE_PID[$j]} -ne $DONE_PID ]; then
		echo "ERROR: Unknown PID completed!" >&2
		continue
	fi

	i=${ACTIVE[$j]}
	ACTIVE=("${ACTIVE[@]:0:$j}" "${ACTIVE[@]:$((j+1))}")
	ACTIVE_PID=(${ACTIVE_PID[*]:0:$j} ${ACTIVE_PID[*]:$((j+1))})

	printf "\\x1b[G\\x1b[K%-70s" "$i"
	if [ $ret -eq 0 ]; then
		((++passes))
		printf "[\\x1b[92mPASS\\x1b[39m]\\n"
	elif [ $ret -eq 32 ]; then
		((++xfails))
		printf "[\\x1b[93mXFAIL\\x1b[39m]\\n"
	else
		((++fails))
		printf "[\\x1b[91mFAIL\\x1b[39m]\\n"
	fi
done

if [ $xfails -gt 0 ]; then
	printf "Tests passed + expectedly failed: %d+%d/%d\\n" $passes $xfails $((passes + xfails + fails))
	printf "Tests unexpectedly failed: %d\\n" $fails
else
	printf "Tests passed: %d/%d\\n" $passes $((passes + fails))
	printf "Tests failed: %d\\n" $fails
fi
