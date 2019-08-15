# !bin/bash

# Author      : Leor Cao
# Create date : 2019-08-02 15:23
# Remarks     : 安装 NodeJS

# 需要安装的 node 版本
NODE_VER=v10.16.2

BASE_URL=https://nodejs.org/dist
FILE_NAME=node-${NODE_VER}-linux-x64
SAVE_PATH=/opt/

# 清除旧文件
sudo rm -rf ${SAVE_PATH}${FILE_NAME}

# 下载 nodejs
sudo curl ${BASE_URL}/${NODE_VER}/${FILE_NAME}.tar.gz | sudo tar -xzf - -C ${SAVE_PATH}

# 添加软链接
sudo ln -s ${SAVE_PATH}${FILE_NAME}/bin/node /usr/bin/node
sudo ln -s ${SAVE_PATH}${FILE_NAME}/bin/npm /usr/bin/npm

# 安装 cnpm
sudo npm install -g cnpm --registry=https://registry.npm.taobao.org

# cnpm 软链接到 /usr/bin
sudo ln -s ${SAVE_PATH}${FILE_NAME}/bin/cnpm /usr/bin/

# 检查当前 node npm cnpm 版本
node -v
npm -v
cnpm -v
