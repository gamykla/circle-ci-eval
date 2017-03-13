#!/bin/bash

# All docker commands pass through this entrypoint.

set -ex

if [ "$1" = 'boot' ]; then
    /content/app.py
    exit $?
fi

exec "$@"

