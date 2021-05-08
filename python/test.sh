#!/bin/sh
echo '=== 1. Doctests ==='
find psylink -type f -iname '*.py' \
    -exec grep -lq 'import doctest' '{}' ';' \
    -exec echo 'Running doctest for {}' ';' \
    -exec python '{}' ';'

echo '=== 2. pylint -E ==='
pylint -E psylink --generated-members=viridis,Key
