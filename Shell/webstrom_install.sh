#!/bin/bash

# import
source ./common/common.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing WebStorm IDE

# configuration definition
# Installing version
VER="2019.2.4"

DLOAD_NAME="WebStorm-${VER}"
DLOAD_URL="https://download-cf.jetbrains.com/webstorm/${DLOAD_NAME}.tar.gz"
SAVE_PATH="/opt/${DLOAD_NAME}/"
DESKTOP="webstorm.desktop"
DESKTOP_CLASS="idea"
BIN_PATH="${SAVE_PATH}bin/"
EXEC_PATH="${BIN_PATH}webstorm.sh"
ICON_PATH="${BIN_PATH}webstorm.svg"

RUN_PATH=$(pwd)
AGENT_PATH="${RUN_PATH}/asset/jetbrains-agent.jar"

# 输出安装前信息
printPrefaceMsg

# 如果指定位置已有同名文件夹则删除旧文件
if [ -e "${SAVE_PATH}" ]; then
    sudo rm -rf "${SAVE_PATH}"
    checkError "${?}" "Remove dir failed!"
fi

# 创建存储文件夹
sudo mkdir "${SAVE_PATH}"
checkError "${?}" "Make dir failed!"

# Download WebStorm
infoLog "Download url : ${DLOAD_URL}"
curl -L ${DLOAD_URL} | sudo tar -xzf - -C ${SAVE_PATH} --strip-components=1
if [ "${?}" = "0" ]; then
    infoLog "Download WebStorm success!"
else
    errorLog "Download WebStorm failed!"
    exit
fi

sudo cp "${AGENT_PATH}" "${BIN_PATH}"

# 删除已存在的快捷方式
deleteDesktop "${DESKTOP}"

# 创建快捷方式
creationDesktop "${DESKTOP}" "WebStorm" "${EXEC_PATH}" "${ICON_PATH}" "${DESKTOP_CLASS}"

# 写入使用jar包配置
editWriteFile "${BIN_PATH}webstorm64.vmoptions" "-javaagent:${BIN_PATH}jetbrains-agent.jar"

# 输出结束语
printEndMsg

exit
