# !bin/bash

# 下载版本
VERSION=v3.3.13
# 安装位置
INSTALL_PATH=/opt/etcd-${VERSION}-linux-amd64

# github 下载地址
GITHUB_DLOAD_URL=https://github.com/etcd-io/etcd/releases/download
# google 下载地址
GOOGLE_DLOAD_URL=https://storage.googleapis.com/etcd
# 下载地址
DLOAD_URL=${GOOGLE_DLOAD_URL}

# 移除安装位置，并重新创建新的安装文件夹
sudo rm -rf ${INSTALL_PATH}
sudo mkdir -P ${INSTALL_PATH}

# 下载 ETCD 安装包，并解压
curl -L ${GOOGLE_DLOAD_URL}/${VERSION}/etcd-${VERSION}-linux-amd64.tar.gz | tar -xzvf - -C ${INSTALL_PATH} --strip-components=1

# 检查 ETCD 版本
${INSTALL_PATH}/etcd --version
ETCDCTL_API=3 /tmp/etcd-download-test/etcdctl version