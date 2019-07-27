# !bin/bash

# Author      : Leor Cao
# Create date : 2019-07-25 15:23
# Remarks     : 安装 Golang

source ./common/string.sh
source ./common/file.sh

DloadUrl=https://studygolang.com/dl/golang/go1.12.7.linux-amd64.tar.gz
GoRootDir="${HOME}/Developments/Golang/GoRoot"
GoPathDir="${HOME}/Developments/Golang/GoPath"

# 创建 GOROOT 文件夹
mkdir -p ${GoRootDir}

# 创建 GOPATH 文件夹
mkdir -p ${GoPathDir}

# 下载Golang安装包
curl -L ${DloadUrl} | tar -xzvf - -C ${GoRootDir} --strip-components=1

# 配置 GOROOT
editSystemPATH "^export GOROOT=.*$" "export GOROOT=${GoRootDir}" "\$GOROOT/bin"

# 配置 GOPATH
editSystemPATH "^export GOPATH=.*$" "export GOPATH=${GoPathDir}" "\$GOPATH/bin"
