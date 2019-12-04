#!/bin/bash

. ../common/common.sh

# v12.1
VER=121

BASE_URL="http://download.navicat.com.cn/download/"
NAME="navicat${VER}_premium_cs_x64"
SAVE_FILE_NAME="${NAME}.tar.gz"
DLOAD_URL="${BASE_URL}${SAVE_FILE_NAME}"
SAVE_TO_PATH="/opt/"
DESKTOP_NAME="navicat.desktop"
EXEC_PATH="${SAVE_TO_PATH}${NAME}/start_navicat"
ICON_PATH="${SAVE_TO_PATH}${NAME}/navicat-icon.png"
ICON_SRC=$(pwd)
ICON_SRC="${ICON_SRC}/navicat-icon.png"

printPrefaceMsg

cd ~/Downloads

if [ -d "${SAVE_TO_PATH}${NAME}" ]; then
    sudo rm -rf "${SAVE_TO_PATH}${NAME}"
fi

curl -L ${DLOAD_URL} | sudo tar -xzf - -C "${SAVE_TO_PATH}"

sudo cp "${ICON_SRC}" "${SAVE_TO_PATH}${NAME}"

# 删除旧快捷方式
deleteDesktop "${DESKTOP_NAME}"

# 创建快捷方式
creationDesktop "${DESKTOP_NAME}" "Navicat for MySQL" "${EXEC_PATH}" "${ICON_PATH}" "navicat"

printEndMsg

# 常规字体 : Noto Sans CJK SC Medium
# 编辑器字体 : Noto Serif CJK SC Medium
# 记录字体 : Noto Sans CJK SC Medium

exit
