#!/bin/bash

set -e

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
ROOT_DIR=$TESTS_DIR/..

TEST_NAME=lcdon-write-timing

cd -- "$TESTS_DIR"

wavepeek value --waves "$TEST_NAME".fst \
               --scope dmg_cpu_b_gameboy.dmg.cpu_inst \
               --at 31485639ns \
               --signals reg_a,reg_b
