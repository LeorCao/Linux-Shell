#!/bin/bash

# Author      : Leor Cao
# Create date : 2019-07-25 15:23
# Remarks     : 安装 Golang

source ./common/string.sh
source ./common/file.sh

# golang 版本
GOLANG_VER=1.12.7

BASE_URL=https://studygolang.com/dl/golang
FILE_NAME=go${GOLANG_VER}.linux-amd64
DloadUrl=${BASE_URL}/${FILE_NAME}.tar.gz

# goroot 路径
GoRootDir="${HOME}/Developments/Golang/GoRoot"
# gopath 路径
GoPathDir="${HOME}/Developments/Golang/GoPath"

# 清除旧的版本
rm -rf ${GoRootDir}
rm -rf ${GoPathDir}

# 创建 GOROOT 文件夹
mkdir -p ${GoRootDir}

# 创建 GOPATH 文件夹
mkdir -p ${GoPathDir}

# 下载Golang安装包
curl -L ${DloadUrl} | tar -xzf - -C ${GoRootDir} --strip-components=1

# 配置 GOROOT
editSystemPATH "^export GOROOT=.*$" "export GOROOT=${GoRootDir}" "\$GOROOT/bin"

# 配置 GOPATH
editSystemPATH "^export GOPATH=.*$" "export GOPATH=${GoPathDir}" "\$GOPATH/bin"

# 检查 golang 版本
go --version

# 输出 GOPATH GOROOT 路径
echo go env $GOPATH
echo go env $GOROOT
