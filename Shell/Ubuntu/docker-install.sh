#!/bin/bash

# Ubuntu 安装 docker 并配置阿里云镜像加速。

DOCKER_URL=https://get.docker.com/
DAEMON_DIR=/etc/docker/
DAEMON_FILE_NAME=daemon.json
DAEMON_PATH=${DAEMON_DIR}${DAEMON_FILE_NAME}

if [ ! -e ~/Downloads ]; then
    mkdir ~/Downloads
fi

cd ~/Downloads

# 判断是否已经存在 daemon.json 文件，如果存在则将其重命名为备份文件。
if [ ! -e ${DAEMON_PATH} ]; then
    sudo mv  ${DAEMON_PATH}-backup
fi

# 安装 docker
wget -qO- ${DOCKER_URL} | sh
# 修改镜像源配置
touch ${DAEMON_FILE_NAME}
echo '{
  "registry-mirrors": ["https://odzkltf1.mirror.aliyuncs.com"]
}' > ${DAEMON_FILE_NAME}
sudo mv ${DAEMON_FILE_NAME} ${DAEMON_PATH}

# 配置权限，解决 docker 需要 sudo。
sudo groupadd docker
sudo gpasswd -a ${USER} docker
# 重启 docker 服务
sudo systemctl daemon-reload
sudo systemctl restart docker
