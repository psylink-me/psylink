#!/bin/sh
echo '=== 1. Doctests ==='
find pyocular -type f -iname '*.py' \
    -exec grep -lq 'import doctest' '{}' ';' \
    -exec echo 'Running doctest for {}' ';' \
    -exec python '{}' ';'

echo '=== 2. pylint -E ==='
pylint -E pyocular --generated-members=viridis
