#!/bin/bash

# 引入外部文件
source ./common/file.sh
source ./common/string.sh

# 检查文件夹（文件）是否存在
# if [ ! -e ~/Download ];then
#     echo "文件夹不存在"
# fi

# 测试 格式化输出字符串
# echo 'aaaaaaa
# bbbbbbbbb'

# 测试 方法执行返回值是否正常
# result=$(getChildDir "test")
# echo "call result : "${result}

# 测试 字符串截取
# DloadGloandUrl=https://download.jetbrains.8686c.com/go/goland-2019.1.2.tar.gz
# DloadSaveName=${DloadGloandUrl##*/}
# echo ${DloadSaveName}

# 测试 字符串是否为空
# str="\t"
# if [ ${str} = "\n" ]; then
#     echo "换行"
# fi

# 测试 字符串是否为空
# isEmpty "\n"
# if [ $? == 0 ]; then
#     echo "等于0"
# fi

# 测试 添加快捷方式
# touch goland.desktop

# echo '[Desktop Entry]
# Name=Goland IDEA
# Exec='${GolandChildDir}'/bin/goland.sh
# Icon='${GolandChildDir}'/bin/goland.png
# Terminal=false
# Type=Application
# Encoding=UTF-8
# Categories=Development
# StartupNotify=true' > goland.desktop

# 测试 下载程序
# saveName=$(downloadFile "https://download.jetbrains.8686c.com/go/goland-2019.1.2.tar.gz")
# echo "call result : $saveName"

# 测试 创建快捷方式
# creationDesktop "goland" "Goland IDEA" "/opt/GoLand-2019.1.2/bin/goland.sh" "/opt/GoLand-2019.1.2/bin/goland.png"

# 测试 pacman获取程序是否安装
# data=$(pacman -Q yaourt)
# echo $data

# 测试 检查程序是否安装
# echo $(isProcedureExist "yaourt")

# 测试sed 修改文件
# test=test-sed

# path=$(sed -n "/^PATH=/p" ${test})

# # sed -n '/^PATH=/p' ${test} | sed -n '/GOROOT/p'

# match=$(echo ${path} | sed -n "/$GOROOT\/bin/p")

# echo ${match}

# isEmpty "${match}"
# if [ $? == 0 ]; then
#     echo "等于0"
# fi

# sed -e 's%^.*export GOROOT.*$%export GOROOT=/home/leor/DEV/goroot%g' -e 's%^.*export GOPATH.*$%export GOPATH=/home/leor/DEV/gopath%g' test-sed

# 测试修改系统PATH
editSystemPATH "^export GOROOT=.*$" "export GOROOT=/home/leor/Developments/GoRoot" "\$GOROOT/bin"
editSystemPATH "^export GOPATH=.*$" "export GOPATH=/home/leor/Developments/GoPath" "\$GOPATH/bin"
