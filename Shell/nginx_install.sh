# !bin/bash

# Author      : Leor Cao
# Create date : 2019-07-28 03:27
# Remarks     : 安装 Nginx

# 安装 gcc 环境
# yum install -y gcc-c++
yay -S gcc-c++

# 安装 pcre 添加 Nginx 的 rewrite 功能
# yum install -y pcre pcre-devel
yay -S pcre pcre-devel

# 安装 zlib 依赖
# yum install -y zlib zlib-devel
yay -S zlib zlib-devel

# 安装 openssl 支持 HTTPS
# yum install -y openssl openssl-devel
yay -S openssl openssl-devel

# 安装 Nginx
NGINX_VER=1.16.0

NGINX_DLOAD_URL=http://nginx.org/download
NGINX_SRC_PATH=${HOME}/Downloads/nginx-${NGINX_VER}/

# 重建 Nginx 源码保存目录
sudo rm -rf ${NGINX_SRC_PATH}
sudo mkdir -p ${NGINX_SRC_PATH}

# 下载 Nginx 源码
sudo curl -L ${NGINX_DLOAD_URL}/nginx-${NGINX_VER}.tar.gz |
    sudo tar -xzf - -C ${NGINX_SRC_PATH} --strip-components=1

# 编译 Nginx
cd ${NGINX_SRC_PATH}

./configure --sbin-path=/usr/local/nginx/nginx \
    --conf-path=/usr/local/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid \
    --with-http_ssl_module \
    --with-pcre=/opt/app/openet/oetal1/chenhe/pcre-8.37 \
    --with-zlib=/opt/app/openet/oetal1/chenhe/zlib-1.2.8 \
    --with-openssl=/opt/app/openet/oetal1/chenhe/openssl-1.0.1t &&
    make &&
    make install &&
    rm -rf ${NGINX_SRC_PATH}
