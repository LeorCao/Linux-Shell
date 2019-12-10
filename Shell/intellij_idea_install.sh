#!/bin/bash

# import
source ./common/common.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing Goland IDE

# configuration definition
# installing version
VER=2019.2.4

DLOAD_NAME="ideaIU-${VER}"
DLOAD_URL="https://download.jetbrains.com/idea/${DLOAD_NAME}.tar.gz"
SAVE_PATH="/opt/${DLOAD_NAME}"
BIN_PATH="${SAVE_PATH}/bin/"

pwd
AGENT_PATH="${?}/asset/jetbrains-agent.jar"

printPrefaceMsg

if [ -e ${SAVE_PATH} ]; then
    sudo rm -rf ${SAVE_PATH}
    checkError "${?}" "Delete old save path failed!"
fi

sudo mkdir -p ${SAVE_PATH}

# Download idea
infoLog "Download URL : ${DLOAD_URL}"
curl -L ${DLOAD_URL} | sudo tar -xzf - -C ${SAVE_PATH} --strip-components=1
if [ ${?} = "0" ]; then
    infoLog "Download idea success!"
else
    errorLog "Downlaod idea failed!"
    exit
fi

editWriteFile "${BIN_PATH}idea64.vmoptions" "-javaagent:${BIN_PATH}jetbrains-agent.jar"

"${BIN_PATH}/idea.sh"

printEndMsg

exit
