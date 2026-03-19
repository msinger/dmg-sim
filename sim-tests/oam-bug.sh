#!/bin/bash

set -e -x

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
ROOT_DIR=$TESTS_DIR/..

TEST_NAME=oam-bug

AS=sm83-elf-as
LD=sm83-elf-ld
OBJCOPY=sm83-elf-objcopy

cd -- "$TESTS_DIR"

$AS -o $TEST_NAME.o $TEST_NAME.s
$LD -o $TEST_NAME.elf -T $TEST_NAME.ld $TEST_NAME.o

$OBJCOPY -I elf32-sm83 -O binary -j .text $TEST_NAME.elf $TEST_NAME.bootrom
$OBJCOPY -I elf32-sm83 -O binary -j .rom  $TEST_NAME.elf $TEST_NAME.cartrom

vvp -N "$ROOT_DIR"/dmg_cpu_b_gameboy.vvp \
	-fst-speed \
	+DUMPFILE="$TESTS_DIR"/$TEST_NAME.fst \
	+SAV_FILE="$TESTS_DIR"/$TEST_NAME.sav \
	+BOOTROM="$TESTS_DIR"/$TEST_NAME.bootrom \
	+ROM="$TESTS_DIR"/$TEST_NAME.cartrom \
	+SECS=1.0 \
	+MBC_TYPE=03 \
	+RAM_SIZE=02

set +x

gtkwave $TEST_NAME.fst $TEST_NAME.gtkw
