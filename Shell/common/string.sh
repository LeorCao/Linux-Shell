# !bin/bash

function isEmpty() {
    if [ -z "${1}" ]; then
        return 0
    fi
    if [ "$1" = "\n" ]; then
        return 0
    fi
    if [ "$1" = "\t" ]; then
        return 0
    fi
    return 1
}
