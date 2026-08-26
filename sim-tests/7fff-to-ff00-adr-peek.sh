#!/bin/bash

set -e

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
ROOT_DIR=$TESTS_DIR/..

TEST_NAME=7fff-to-ff00-adr

cd -- "$TESTS_DIR"

wavepeek value --waves "$TEST_NAME".fst \
               --scope dmg_cpu_b_gameboy \
               --at 31229765ns \
               --signals a
