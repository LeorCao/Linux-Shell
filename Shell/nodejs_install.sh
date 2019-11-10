#!/bin/bash

# Author      : Leor Cao
# Create date : 2019-08-02 15:23
# Remarks     : 安装 NodeJS

source ./common/common.sh

printPrefaceMsg

# 需要安装的 node 版本
NODE_VER=v12.13.0

BASE_URL=https://npm.taobao.org/mirrors/node
FILE_NAME=node-${NODE_VER}-linux-x64
SAVE_PATH=~/Dev/Nodejs/

# 清除旧文件
rm -rf ${SAVE_PATH}
# 重新创建保存文件夹
mkdir -p ${SAVE_PATH}

# URL : https://npm.taobao.org/mirrors/node/v12.13.0/node-v12.13.0-linux-x64.tar.xz

echo --------------------------------
echo "Download URL:"${BASE_URL}/${NODE_VER}/${FILE_NAME}.tar.xz
echo --------------------------------

# 下载 nodejs
curl -L ${BASE_URL}/${NODE_VER}/${FILE_NAME}.tar.xz | tar -xJf - -C ${SAVE_PATH}

checkError $? "Download failed!"

# 添加软链接
sudo ln -s ${SAVE_PATH}${FILE_NAME}/bin/node /usr/bin/node
sudo ln -s ${SAVE_PATH}${FILE_NAME}/bin/npm /usr/bin/npm

# 安装 cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org

checkError $? "Configration cnpm failed!"

# cnpm 软链接到 /usr/bin
sudo ln -s ${SAVE_PATH}${FILE_NAME}/bin/cnpm /usr/bin/

# 检查当前 node npm cnpm 版本
node -v
npm -v
cnpm -v

# install success
printEndMsg

exit
