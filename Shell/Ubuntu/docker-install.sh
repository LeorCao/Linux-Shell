#!/bin/bash

# Ubuntu 安装 docker 并配置阿里云镜像加速。

DOCKER_URL=https://get.docker.com/
DAEMON_FILE=/etc/docker/daemon.json

# 安装 docker
wget -qO- ${DOCKER_URL} | sh

# 修改镜像源配置
sudo touch ${DAEMON_FILE}

sudo echo '{
  "registry-mirrors": ["https://odzkltf1.mirror.aliyuncs.com"]
}' > ${DAEMON_FILE}

# 配置权限，解决 docker 需要 sudo。
sudo groupadd docker
sudo gpasswd -a ${USER} docker
# 重启 docker 服务
sudo systemctl daemon-reload
sudo systemctl restart docker
newgrp - docker
