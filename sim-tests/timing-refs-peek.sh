#!/bin/bash

set -e

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
ROOT_DIR=$TESTS_DIR/..

TEST_NAME=timing-refs

cd -- "$TESTS_DIR"

TS=()
PHI=()
NRD=()
A15=()
A14=()
A8=()
A7=()

i=0
while read -r TS[i] PHI[i] NRD[i] A15[i] A14[i] A8[i] A7[i] other; do
	if [ -n "$other" ]; then
		echo pass1: garbage at end of line $i >&2
		exit 1
	fi
	((i += 1))
done < <(
wavepeek change --waves "$TEST_NAME".fst \
                --scope dmg_cpu_b_gameboy \
                --from 31230479ns --to 31231788ns \
                --on \* --sample-mode native \
                --signals phi,nrd,a[15:15],a[14:14],a[8:8],a[7:7] |
sed -e \
's,^@\([0-9]\+\)ps '\
'phi=1.h\([01xz]\) '\
'nrd=1.h\([01xz]\) '\
'a\[15:15\]=1.h\([01xz]\) '\
'a\[14:14\]=1.h\([01xz]\) '\
'a\[8:8\]=1.h\([01xz]\) '\
'a\[7:7\]=1.h\([01xz]\)$,'\
'\1 \2 \3 \4 \5 \6 \7,'
)

COUNT=$i

# search first PHI posedge
PHI_RISE1=
for ((i = 0; i < COUNT; i++)); do
	if ((PHI[i] == 1)); then
		PHI_RISE1=$i
		break
	fi
done

if [ -z "$PHI_RISE1" ]; then
	echo pass1: first PHI posedge not found >&2
	exit 1
fi

# search PHI negedge
PHI_FALL=
for ((i = PHI_RISE1; i < COUNT; i++)); do
	if ((PHI[i] == 0)); then
		PHI_FALL=$i
		break
	fi
done

if [ -z "$PHI_FALL" ]; then
	echo pass1: PHI negedge not found >&2
	exit 1
fi

# search second PHI posedge
PHI_RISE2=
for ((i = PHI_FALL; i < COUNT; i++)); do
	if ((PHI[i] == 1)); then
		PHI_RISE2=$i
		break
	fi
done

if [ -z "$PHI_RISE2" ]; then
	echo pass1: second PHI posedge not found >&2
	exit 1
fi

# search A15 posedge
A15_RISE=
for ((i = PHI_RISE1; i < COUNT; i++)); do
	if ((A15[i] == 1)); then
		A15_RISE=$i
		break
	fi
done

if [ -z "$A15_RISE" ]; then
	echo pass1: A15 posedge not found >&2
	exit 1
fi

# search NRD posedge
NRD_RISE=
for ((i = A15_RISE; i < COUNT; i++)); do
	if ((NRD[i] == 1)); then
		NRD_RISE=$i
		break
	fi
done

if [ -z "$NRD_RISE" ]; then
	echo pass1: NRD posedge not found >&2
	exit 1
fi

# search NRD negedge
NRD_FALL=
for ((i = NRD_RISE; i < COUNT; i++)); do
	if ((NRD[i] == 0)); then
		NRD_FALL=$i
		break
	fi
done

if [ -z "$NRD_FALL" ]; then
	echo pass1: NRD negedge not found >&2
	exit 1
fi

# search A8 posedge
A8_RISE=
for ((i = A15_RISE; i < COUNT; i++)); do
	if ((A8[i] == 1)); then
		A8_RISE=$i
		break
	fi
done

if [ -z "$A8_RISE" ]; then
	echo pass1: A8 posedge not found >&2
	exit 1
fi

# search A7 posedge
A7_RISE=
for ((i = A8_RISE; i < COUNT; i++)); do
	if ((A7[i] == 1)); then
		A7_RISE=$i
		break
	fi
done

if [ -z "$A7_RISE" ]; then
	echo pass1: A7 posedge not found >&2
	exit 1
fi

# search A14 negedge
A14_FALL=
for ((i = PHI_RISE2; i < COUNT; i++)); do
	if ((A14[i] == 0)); then
		A14_FALL=$i
		break
	fi
done

if [ -z "$A14_FALL" ]; then
	echo pass1: A14 negedge not found >&2
	exit 1
fi

# search A15 negedge
A15_FALL=
for ((i = A14_FALL; i < COUNT; i++)); do
	if ((A15[i] == 0)); then
		A15_FALL=$i
		break
	fi
done

if [ -z "$A15_FALL" ]; then
	echo pass1: A15 negedge not found >&2
	exit 1
fi

((RD_GLITCH             = TS[NRD_FALL] - TS[NRD_RISE] )) || true
((PHI_RISE_A15_RISE     = TS[A15_RISE] - TS[PHI_RISE1])) || true
((PHI_RISE_A15_FALL     = TS[A15_FALL] - TS[PHI_RISE2])) || true
((PHI_RISE_A14_FALL_INT = TS[A14_FALL] - TS[PHI_RISE2])) || true
((A8_RISE_A7_RISE       = TS[A7_RISE]  - TS[A8_RISE]  )) || true

TS=()
PHI=()
NRD=()
NWR=()
NCS=()
A15=()
A14=()
A8=()
A7=()

i=0
while read -r TS[i] PHI[i] NRD[i] NWR[i] NCS[i] A15[i] A14[i] other; do
	if [ -n "$other" ]; then
		echo pass2: garbage at end of line $i >&2
		exit 1
	fi
	((i += 1))
done < <(
wavepeek change --waves "$TEST_NAME".fst \
                --scope dmg_cpu_b_gameboy \
                --from 31236191ns --to 31237500ns \
                --on \* --sample-mode native \
                --signals phi,nrd,nwr,ncs,a[15:15],a[14:14] |
sed -e \
's,^@\([0-9]\+\)ps '\
'phi=1.h\([01xz]\) '\
'nrd=1.h\([01xz]\) '\
'nwr=1.h\([01xz]\) '\
'ncs=1.h\([01xz]\) '\
'a\[15:15\]=1.h\([01xz]\) '\
'a\[14:14\]=1.h\([01xz]\)$,'\
'\1 \2 \3 \4 \5 \6 \7,'
)

COUNT=$i

# search first PHI posedge
PHI_RISE1=
for ((i = 0; i < COUNT; i++)); do
	if ((PHI[i] == 1)); then
		PHI_RISE1=$i
		break
	fi
done

if [ -z "$PHI_RISE1" ]; then
	echo pass2: first PHI posedge not found >&2
	exit 1
fi

# search PHI negedge
PHI_FALL=
for ((i = PHI_RISE1; i < COUNT; i++)); do
	if ((PHI[i] == 0)); then
		PHI_FALL=$i
		break
	fi
done

if [ -z "$PHI_FALL" ]; then
	echo pass2: PHI negedge not found >&2
	exit 1
fi

# search second PHI posedge
PHI_RISE2=
for ((i = PHI_FALL; i < COUNT; i++)); do
	if ((PHI[i] == 1)); then
		PHI_RISE2=$i
		break
	fi
done

if [ -z "$PHI_RISE2" ]; then
	echo pass2: second PHI posedge not found >&2
	exit 1
fi

# search A15 posedge
A15_RISE=
for ((i = PHI_RISE1; i < COUNT; i++)); do
	if ((A15[i] == 1)); then
		A15_RISE=$i
		break
	fi
done

if [ -z "$A15_RISE" ]; then
	echo pass2: A15 posedge not found >&2
	exit 1
fi

# search NRD posedge
NRD_RISE=
for ((i = A15_RISE; i < COUNT; i++)); do
	if ((NRD[i] == 1)); then
		NRD_RISE=$i
		break
	fi
done

if [ -z "$NRD_RISE" ]; then
	echo pass2: NRD posedge not found >&2
	exit 1
fi

# search NCS negedge
NCS_FALL=
for ((i = NRD_RISE; i < COUNT; i++)); do
	if ((NCS[i] == 0)); then
		NCS_FALL=$i
		break
	fi
done

if [ -z "$NCS_FALL" ]; then
	echo pass2: NCS negedge not found >&2
	exit 1
fi

# search NWR negedge
NWR_FALL=
for ((i = PHI_FALL; i < COUNT; i++)); do
	if ((NWR[i] == 0)); then
		NWR_FALL=$i
		break
	fi
done

if [ -z "$NWR_FALL" ]; then
	echo pass2: NWR negedge not found >&2
	exit 1
fi

# search NWR posedge
NWR_RISE=
for ((i = NWR_FALL; i < COUNT; i++)); do
	if ((NWR[i] == 1)); then
		NWR_RISE=$i
		break
	fi
done

if [ -z "$NWR_RISE" ]; then
	echo pass2: NWR posedge not found >&2
	exit 1
fi

# search NRD negedge
NRD_FALL=
for ((i = PHI_RISE2; i < COUNT; i++)); do
	if ((NRD[i] == 0)); then
		NRD_FALL=$i
		break
	fi
done

if [ -z "$NRD_FALL" ]; then
	echo pass2: NRD negedge not found >&2
	exit 1
fi

# search NCS posedge
NCS_RISE=
for ((i = PHI_RISE2; i < COUNT; i++)); do
	if ((NCS[i] == 1)); then
		NCS_RISE=$i
		break
	fi
done

if [ -z "$NCS_RISE" ]; then
	echo pass2: NCS posedge not found >&2
	exit 1
fi

# search A14 negedge
A14_FALL=
for ((i = PHI_RISE2; i < COUNT; i++)); do
	if ((A14[i] == 0)); then
		A14_FALL=$i
		break
	fi
done

if [ -z "$A14_FALL" ]; then
	echo pass2: A14 negedge not found >&2
	exit 1
fi

# search A15 negedge
A15_FALL=
for ((i = A14_FALL; i < COUNT; i++)); do
	if ((A15[i] == 0)); then
		A15_FALL=$i
		break
	fi
done

if [ -z "$A15_FALL" ]; then
	echo pass2: A15 negedge not found >&2
	exit 1
fi

((PHI_RISE_RD_RISE      = TS[NRD_RISE]  - TS[PHI_RISE1])) || true
((PHI_RISE_RD_FALL      = TS[NRD_FALL]  - TS[PHI_RISE2])) || true
((PHI_RISE_A15_RISE_ALT = TS[A15_RISE]  - TS[PHI_RISE1])) || true
((PHI_RISE_A15_FALL_ALT = TS[A15_FALL]  - TS[PHI_RISE2])) || true
((PHI_RISE_CS_RISE      = TS[NCS_RISE]  - TS[PHI_RISE2])) || true
((WR_RISE_PHI_RISE      = TS[PHI_RISE2] - TS[NWR_RISE] )) || true
((PHI_FALL_WR_FALL      = TS[NWR_FALL]  - TS[PHI_FALL] )) || true
((PHI_RISE_A14_FALL_EXT = TS[A14_FALL]  - TS[PHI_RISE2])) || true

((RD_GLITCH_PM             = 1000 * RD_GLITCH             /  18600 - 1000)) || true
((PHI_RISE_RD_RISE_PM      = 1000 * PHI_RISE_RD_RISE      / 148400 - 1000)) || true
((PHI_RISE_RD_FALL_PM      = 1000 * PHI_RISE_RD_FALL      /  23000 - 1000)) || true
((PHI_RISE_A15_RISE_PM     = 1000 * PHI_RISE_A15_RISE     /   3600 - 1000)) || true
((PHI_RISE_A15_FALL_PM     = 1000 * PHI_RISE_A15_FALL     / 241000 - 1000)) || true
((PHI_RISE_CS_RISE_PM      = 1000 * PHI_RISE_CS_RISE      /   4400 - 1000)) || true
((WR_RISE_PHI_RISE_PM      = 1000 * WR_RISE_PHI_RISE      / 115600 - 1000)) || true
((PHI_FALL_WR_FALL_PM      = 1000 * PHI_FALL_WR_FALL      /   5000 - 1000)) || true
((PHI_RISE_A14_FALL_EXT_PM = 1000 * PHI_RISE_A14_FALL_EXT /  28000 - 1000)) || true
((PHI_RISE_A14_FALL_INT_PM = 1000 * PHI_RISE_A14_FALL_INT / 150000 - 1000)) || true
((A8_RISE_A7_RISE_PM       = 1000 * A8_RISE_A7_RISE       /   4200 - 1000)) || true

printf "rg-glitch:             %12d ps  %4d‰\n" $RD_GLITCH             $RD_GLITCH_PM
printf "phi-rise-rd-rise:      %12d ps  %4d‰\n" $PHI_RISE_RD_RISE      $PHI_RISE_RD_RISE_PM
printf "phi-rise-rd-fall:      %12d ps  %4d‰\n" $PHI_RISE_RD_FALL      $PHI_RISE_RD_FALL_PM
printf "phi-rise-a15-rise:     %12d ps  %4d‰\n" $PHI_RISE_A15_RISE     $PHI_RISE_A15_RISE_PM
printf "phi-rise-a15-fall:     %12d ps  %4d‰\n" $PHI_RISE_A15_FALL     $PHI_RISE_A15_FALL_PM
printf "phi-rise-cs-rise:      %12d ps  %4d‰\n" $PHI_RISE_CS_RISE      $PHI_RISE_CS_RISE_PM
printf "wr-rise-phi-rise:      %12d ps  %4d‰\n" $WR_RISE_PHI_RISE      $WR_RISE_PHI_RISE_PM
printf "phi-fall-wr-fall:      %12d ps  %4d‰\n" $PHI_FALL_WR_FALL      $PHI_FALL_WR_FALL_PM
printf "phi-rise-a14-fall-ext: %12d ps  %4d‰\n" $PHI_RISE_A14_FALL_EXT $PHI_RISE_A14_FALL_EXT_PM
printf "phi-rise-a14-fall-int: %12d ps  %4d‰\n" $PHI_RISE_A14_FALL_INT $PHI_RISE_A14_FALL_INT_PM
printf "a8-rise-a7-rise:       %12d ps  %4d‰\n" $A8_RISE_A7_RISE       $A8_RISE_A7_RISE_PM

ABS=(${RD_GLITCH_PM/#-/}
     ${PHI_RISE_RD_RISE_PM/#-/}
     ${PHI_RISE_RD_FALL_PM/#-/}
     ${PHI_RISE_A15_RISE_PM/#-/}
     ${PHI_RISE_A15_FALL_PM/#-/}
     ${PHI_RISE_CS_RISE_PM/#-/}
     ${WR_RISE_PHI_RISE_PM/#-/}
     ${PHI_FALL_WR_FALL_PM/#-/}
     ${PHI_RISE_A14_FALL_EXT_PM/#-/}
     ${PHI_RISE_A14_FALL_INT_PM/#-/}
     ${A8_RISE_A7_RISE_PM/#-/})

TOTAL=0
MAX=0
for i in ${ABS[*]}; do
	((TOTAL += i))
	if ((i > MAX)); then
		MAX=$i
	fi
done

echo total error: $TOTAL
echo max error: $MAX

if ((PHI_RISE_A15_RISE != PHI_RISE_A15_RISE_ALT)); then
	echo inconsistent phi-rise-a15-rise: $PHI_RISE_A15_RISE_ALT
fi

if ((PHI_RISE_A15_FALL != PHI_RISE_A15_FALL_ALT)); then
	echo inconsistent phi-rise-a15-fall: $PHI_RISE_A15_FALL_ALT
fi
