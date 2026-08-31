#!/bin/bash

set -e

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
ROOT_DIR=$TESTS_DIR/..

TEST_NAME=lcdon-write-timing-detailed

cd -- "$TESTS_DIR"

echo expected:
echo 0xff 0xff
echo 0xff 0xff
echo 0x00 0x00
echo 0x00 0x00

echo result:
wavepeek value --waves "$TEST_NAME".fst \
               --scope dmg_cpu_b_gameboy.dmg.cpu_inst \
               --at 33327760ns \
               --signals reg_d,reg_e
wavepeek value --waves "$TEST_NAME".fst \
               --scope dmg_cpu_b_gameboy.dmg.cpu_inst \
               --at 33589930ns \
               --signals reg_d,reg_e
wavepeek value --waves "$TEST_NAME".fst \
               --scope dmg_cpu_b_gameboy.dmg.cpu_inst \
               --at 35693400ns \
               --signals reg_d,reg_e
wavepeek value --waves "$TEST_NAME".fst \
               --scope dmg_cpu_b_gameboy.dmg.cpu_inst \
               --at 35954410ns \
               --signals reg_d,reg_e
