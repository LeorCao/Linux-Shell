#!/bin/bash

checkFile=${1}
sum=${2}

checkSum=$(sha256sum $checkFile | cut -d' ' -f1)

if [ ${sum^^} == ${checkSum^^} ]; then
    echo "Success!"
fi
echo "Failed!"