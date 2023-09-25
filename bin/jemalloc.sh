#!/usr/bin/env bash
# exit on error
set -o errexit
set -o allexport
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2
export LD_PRELOAD
set +o allexport
exec "$@"