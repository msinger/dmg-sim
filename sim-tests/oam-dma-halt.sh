#!/bin/bash

set -e -x

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
ROOT_DIR=$TESTS_DIR/..

TEST_NAME=oam-dma-halt

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
	+BOOTROM="$TESTS_DIR"/$TEST_NAME.bootrom \
	+ROM="$TESTS_DIR"/$TEST_NAME.cartrom \
	+SECS=1.0 \
	+MBC_TYPE=00 \
	+RAM_SIZE=00

set +x

gtkwave $TEST_NAME.fst $TEST_NAME.gtkw
