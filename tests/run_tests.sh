#!/bin/bash

export LC_ALL=C

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

PARALLEL_TESTS=1
CATEGORY_FILTER=
DO_MULTI=

TESTS=()

function echo_help ( ) {
	echo 'Usage: '"$(basename "$0")"' [OPTION]... [TEST]...'
	echo
	echo 'OPTIONs:'
	echo '  -j [<N>]          Run <N> tests in parallel.'
	echo '  -c <CATEGORY>     Filter for one or more test categories; either by'
	echo '                      giving multiple -c options or by separating'
	echo '                      categories by spaces within one argument.'
	echo '  --multi           For multi ROM tests, run the multi ROM test, not'
	echo '                      the single ROM ones.'
	echo '  --single          For multi ROM tests, run the single ROM tests, not'
	echo '                      the multi ROM one.'
}

function is_num ( ) {
	case $1 in
		'' | *[!0-9]*)
			return 1
			;;
	esac
}

while [ $# -gt 0 ]; do
	case $1 in
		--)
			shift
			while [ $# -gt 0 ]; do
				TESTS+=("$i")
				shift
			done
			;;
		--multi)
			DO_MULTI=y
			;;
		--single)
			DO_MULTI=
			;;
		--help)
			echo_help
			exit 0
			;;
		--*)
			echo unknown long option \""$1"\" >&2
			exit 3
			;;
		-*)
			SOPTS=${1:1}
			while [ ${#SOPTS} -gt 0 ]; do
				case ${SOPTS:0:1} in
					c)
						if [ -n "${SOPTS:1}" ]; then
							CATEGORY_FILTER="$CATEGORY_FILTER ${SOPTS:1}"
							break
						elif [ -n "$2" ]; then
							shift
							CATEGORY_FILTER="$CATEGORY_FILTER $1"
							break
						fi
						echo option -c requires argument >&2
						exit 3
						;;
					j)
						if is_num "${SOPTS:1}"; then
							PARALLEL_TESTS=${SOPTS:1}
							break
						elif [ -z "${SOPTS:1}" ] && is_num "$2"; then
							shift
							PARALLEL_TESTS=$1
							break
						fi
						PARALLEL_TESTS=$(nproc)
						;;
					?)
						echo_help
						exit 0
						;;
					*)
						echo unknown option -"${SOPTS:0:1}" >&2
						exit 3
						;;
				esac
				SOPTS=${SOPTS:1}
			done
			;;
		*)
			TESTS+=("$i")
			;;
	esac
	shift
done

TESTS_GIVEN_ON_CMDLINE=
if [ ${#TESTS[*]} -ne 0 ]; then
	TESTS_GIVEN_ON_CMDLINE=y
fi

while read -d '' -r i; do
	SETUP_PATH=$TESTS_DIR/data/$i/setup.sh
	TYPE=
	CATEGORY=
	. "$SETUP_PATH"

	if [ "$TYPE" == multi ] && [ -z "$DO_MULTI" ]; then
		continue
	fi

	if [ "$TYPE" == single ] && [ -n "$DO_MULTI" ]; then
		continue
	fi

	if [ -n "$TESTS_GIVEN_ON_CMDLINE" ] || [ -n "$CATEGORY_FILTER" ]; then
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
done < <(cd -- "$TESTS_DIR"/data; find * -name setup.sh -printf %h\\0)

TESTS_W_LEN=()
while read -d '' -r i; do
	SETUP_PATH=$TESTS_DIR/data/$i/setup.sh
	if ! [ -e "$SETUP_PATH" ]; then
		echo "ERROR: Test '$i' is missing setup.sh file. (skipping)" >&2
		continue
	fi

	. "$SETUP_PATH"

	TESTS_W_LEN+=("$SECS $i")
done < <(printf %s\\0 "${TESTS[@]}" | sort -z | uniq -z)

TESTS=()
while read -d '' -r l i; do
	TESTS+=("$i")
done < <(printf %s\\0 "${TESTS_W_LEN[@]}" | sort -znr)

ACTIVE=()
ACTIVE_PID=()

CUR_DISP=0

passes=0
xfails=0
fails=0

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
