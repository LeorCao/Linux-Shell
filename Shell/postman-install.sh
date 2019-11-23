#!/bin/bash

. ./common/common.sh

DLOAD_URL=https://dl.pstmn.io/download/latest/linux64
FILE_NAME=postman-linux-x64
DECOM_PATH="/opt"
LOCAL_PATH="$DECOM_PATH/Postman"
EXEC_PATH="$LOCAL_PATH/Postman"
DESKTOP_DIR=/usr/share/applications/
DESKTOP_NAME=postman.desktop
DESKTOP_ICON="${LOCAL_PATH}/app/resources/app/assets/icon.png"

printPrefaceMsg

sudo rm -rf $LOCAL_PATH

curl -L $DLOAD_URL | sudo tar -xzf - -C $DECOM_PATH || {printErrorEndMsg "Download postman error!";exit}

# 删除旧快捷方式
deleteDesktop "${DESKTOP_NAME}"

# 创建快捷方式
creationDesktop "${DESKTOP_NAME}" "Postman" "${EXEC_PATH}" "${DESKTOP_ICON}"

printEndMsg
