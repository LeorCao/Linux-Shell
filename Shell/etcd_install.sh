# !bin/bash

# Author      : Leor Cao
# Create date : 2019-07-28 00:15
# Remarks     : 安装 ETCD
# Extend for  : ETCD 官方提供的安装脚本 https://github.com/etcd-io/etcd/releases

# 下载版本，如果要下载其他版本的 ETCD 修改版本号即可
VERSION=v3.3.13
INSTALL_DIR=etcd-${VERSION}-linux-amd64
# 安装位置
INSTALL_PATH=/opt/${INSTALL_DIR}

# github 下载地址
GITHUB_DLOAD_URL=https://github.com/etcd-io/etcd/releases/download
# google 下载地址
GOOGLE_DLOAD_URL=https://storage.googleapis.com/etcd
# 下载地址
DLOAD_URL=${GOOGLE_DLOAD_URL}

# 移除安装位置，并重新创建新的安装文件夹
sudo rm -rf ${INSTALL_PATH}
sudo mkdir -p ${INSTALL_PATH}

# 下载 ETCD 安装包，并解压
sudo curl -L ${GOOGLE_DLOAD_URL}/${VERSION}/${INSTALL_DIR}.tar.gz | \
    sudo tar -xzf - -C ${INSTALL_PATH} --strip-components=1

# 检查 ETCD 版本
${INSTALL_PATH}/etcd --version
ETCDCTL_API=3 ${INSTALL_PATH}/etcdctl version
