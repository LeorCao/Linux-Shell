#!/bin/bash

# import
source ./common/common.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing Goland IDE

# configuration definition
# Installing version
VER="2019.2.5"

DLOAD_NAME="goland-${VER}"
DLOAD_URL="https://download.jetbrains.8686c.com/go/${DLOAD_NAME}.tar.gz"
SAVE_PATH="/opt/${DLOAD_NAME}"
DESKTOP="goland.desktop"
DESKTOP_CLASS="goland"
BIN_PATH="${SAVE_PATH}/bin/"
EXEC_PATH="${BIN_PATH}goland.sh"
ICON_PATH="${BIN_PATH}goland.svg"

pwd
AGENT_PATH="${?}/asset/jetbrains-agent.jar"

# print preface message
printPrefaceMsg

# Check old path is existence
if [ -e "${SAVE_PATH}" ]; then
    sudo rm -rf "${SAVE_PATH}"
    checkError "${?}" "Delete old save path is failed!"
fi

# Recreate save path
sudo mkdir -p ${SAVE_PATH}

# Download Goland
infoLog "Download URL : ${DLOAD_URL}"
curl -L ${DLOAD_URL} | sudo tar -xzvf - -C ${SAVE_PATH} --strip-components=1
if [ "${?}" = "0" ]; then
    infoLog "Download goland success!"
else
    errorLog "Download goland failed!"
    exit
fi

sudo cp ${AGENT_PATH} ${BIN_PATH}

# Delete old desktop
deleteDesktop "${DESKTOP_NAME}"

# Creation desktop
creationDesktop "${DESKTOP_NAME}" "Goland IDEA" "${EXEC_PATH}" "${ICON_PATH}" "${DESKTOP_CLASS}"

# wiret config to vmoptions
editWriteFile "${BIN_PATH}goland64.vmoptions" "-javaagent:${BIN_PATH}jetbrains-agent.jar"

# print end message
printEndMsg

exit
