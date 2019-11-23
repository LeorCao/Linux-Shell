#!/bin/bash

# Author      : Leor Cao
# Create date : 2019-07-25 15:23
# Remarks     : 安装 vscode

# import
source ./common/common.sh

# 下载地址
DLOAD_URL=https://update.code.visualstudio.com/latest/linux-x64/stable
# 本地程序保存基础路径
SAVE_PATH=/opt/VSCode-linux-x64/
EXEC_PATH="${SAVE_PATH}bin/code"
DESKTOP_ICON="${SAVE_PATH}resources/app/resources/linux/code.png"
# 快捷方式保存路径
DESKTOPDIR=/usr/share/applications/
DESKTOP_NAME=vscode.desktop

# 检查基础存储路径是否存在，不存在则创建
if [ ! -e ${SAVE_PATH} ]; then
    sudo mkdir ${SAVE_PATH}
fi

# 下载文件并解压到基础路径，且去除一层文件夹
sudo curl -L ${DLOAD_URL} | sudo tar -xzf - -C ${SAVE_PATH} --strip-components=1

# 获取快捷方式全路径
returnDesktopPath "${DESKTOP_NAME}"
DESKTOP_FULL_PATH=$?

# 创建快捷方式
if [ ! -e ${DESKTOP_FULL_PATH} ]; then
    creationDesktop "${DESKTOP_NAME}" "Vscode" "${EXEC_PATH}" "${DESKTOP_ICON}"
fi

exit
