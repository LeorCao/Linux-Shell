#!/bin/bash

# import
source ./common/common.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing Goland IDE

VER=2019.2.4

# configuration definition
SAVE_NAME="ideaIU-${VER}.tar.gz"
DLOAD_URL="https://download.jetbrains.com/idea/${SAVE_NAME}?_ga=2.152292601.1509137156.1575423809-1907418422.1575255272"
SAVE_PATH=/opt/
FULL_PATH="${SAVE_PATH}ideaIU-${VER}"

if [ ! -e ~/Downloads ]; then
    mkdir ~/Downloads
fi

cd ~/Downloads

# Download Goland
curl -L ${DLOAD_URL} | tar -xzf - -C ${SAVE_PATH}
if [ ${?} = "0" ]; then
    echo "Download success!"
else
    errorLog "Downlaod idea failed!"
    exits
fi

"${FULL_PATH}/bin/idea.sh"

exit
