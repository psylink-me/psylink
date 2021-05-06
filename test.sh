#!/bin/sh
# 1. Run doctests for all files in the pyocular directory that contain "import doctest"
find pyocular -type f -iname '*.py' \
    -exec grep -lq 'import doctest' '{}' ';' \
    -exec echo 'Running doctest for {}' ';' \
    -exec python '{}' ';'
