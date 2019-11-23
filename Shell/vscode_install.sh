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
# 快捷方式保存路径
DESKTOPDIR=/usr/share/applications/

# 检查基础存储路径是否存在，不存在则创建
if [ ! -e ${SAVE_PATH} ]; then
    sudo mkdir ${SAVE_PATH}
fi

# 下载文件并解压到基础路径，且去除一层文件夹
sudo curl -L ${DLOAD_URL} | sudo tar -xzf - -C ${SAVE_PATH} --strip-components=1

# 进入程序文件夹
cd ${SAVE_PATH}/bin

# 创建快捷方式
if [ ! -e ${DESKTOPDIR}/vscode.desktop ]; then
    sudo chmod 755 code
    sudo touch vscode.desktop
    sudo chmod 777 vscode.desktop
    sudo echo '[Desktop Entry]
    Name=VSCode
    Type=Application
    Exec=/opt/VSCode-linux-x64/bin/code
    Icon=/opt/VSCode-linux-x64/resources/app/resources/linux/code.png
    Categories=Development' >vscode.desktop
    sudo mv vscode.desktop ${DESKTOPDIR}
    sudo chmod 755 ${DESKTOPDIR}vscode.desktop
fi

exit
