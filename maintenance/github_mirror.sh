#!/bin/sh
# This script helps with mirroring the git repositories from codeberg to github.
#
# usage: ./github_mirror.sh [--init] TARGET_PATH
#
# With "--init", it clones the relevant repositories into a folder defined by
# TARGET_PATH so that you can later use this script to mirror them.
#
# Without "--init", it performs the actual mirroring.

set -e

REPOS="psylink psylink.wiki psylink-web psylink-3dprint psylink-datasets"

# Handle arguments
if [ "$1" = "--init" ]; then
    action=initialize
    shift
else
    action=update
fi

TARGET_PATH="$1"
if [ -z "$TARGET_PATH" ]; then
    echo "usage: $0 [--init] TARGET_PATH"
    exit 1
fi

# Perform desired action
if [ $action = initialize ]; then
    mkdir -p "$TARGET_PATH"
    cd "$TARGET_PATH"

    for repo in $REPOS; do
        git clone --mirror https://codeberg.org/psylink/"$repo".git
        cd "$repo".git
        git remote set-url --push origin git@github.com:psylink-me/"$repo".git
        cd ..
    done
elif [ $action = update ]; then
    if [ ! -d "$TARGET_PATH" ]; then
        echo "ERROR: Target path '$TARGET_PATH' doesn't exist." >&2
        echo "Please run this script with the '--init' parameter first." >&2
        exit 1
    fi
    cd "$TARGET_PATH"
    for repo in $REPOS; do
        cd "$repo".git
        git fetch -pP origin
        git push --mirror
        cd ..
    done
fi
