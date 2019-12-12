#!/bin/bash

# Author      : Leor Cao
# Create date : 2019-07-28 23:00
# Remarks     : 安装 Docker machine

# Docker machine 版本号
MACHINE_VER=v0.16.1

# 保存位置
SAVE_PATH=/usr/local/bin/docker-machine

# 下载时暂存位置
SAVE_TMP_PATH=/tmp/docker-machine

# 下载地址，目前 Docker machine 托管在 github，下载可能很慢
DLOAD_BASE_URL=https://github.com/docker/machine/releases/download

# 下载 machine
sudo curl -L ${DLOAD_BASE_URL}/${MACHINE_VER}/docker-machine-Linux-x86_64 > ${SAVE_TMP_PATH} &&
    sudo mv ${SAVE_TMP_PATH} ${SAVE_PATH} &&
    sudo chmod 755 ${SAVE_PATH}

# 查看 machine 版本
docker-machine version
