#!/bin/bash

# 检查错误，如果有错误则打印错误信息，退出执行
# ${1} : 需要判断的信息
# ${2} : 错误时需要输出的错误原因
function checkError() {
    if [ ${1} -ne 0 ]; then
        printErrorMsg ${2}
    fi
}

# 打印安装前言
function printPrefaceMsg() {
    echo "-------------------------------"
    echo "--> Power by : Leor, Welcome to https://leor.com.cn"
    echo "--> Begin instaling~"
    echo "-------------------------------"
}

# 打印结束语
function printEndMsg() {
    echo "-------------------------------"
    echo "--> Installed success!"
    echo "--> Power by : Leor, Welcome to https://leor.com.cn"
    echo "-------------------------------"
    exit
}

# 打印错误安装失败
# ${1} : 错误原因
function printErrorMsg() {
    echo "-------------------------------"
    echo "--> Instaling failed!"
    echo "--> Cause : ${1}"
    echo "--> Power by : Leor, Welcome to https://leor.com.cn"
    echo "-------------------------------"
    exit
}

# 获取当前文件夹下制定前缀的子文件（目录）名称
function getChildDir() {
    echo $(ls | grep "${1}*" | xargs)
}

# 下载文件，返回文件名称, 也可以传入存储文件名称
function downloadFile() {
    DloadGloandUrl=${1}
    DloadSaveName=${DloadGloandUrl##*/}
    if [ ! -z ${2} ]; then
        DloadSaveName=${2}
    fi
    readonly DloadGloandUrl
    readonly DloadSaveName
    curl -L ${DloadGloandUrl} -o ${DloadSaveName}
    echo $DloadSaveName
}

# 创建桌面快捷方式
# ${1} : 快捷方式文件名
# ${2} : 快捷方式名称
# ${3} : 快捷方式对应的启动文件
# ${4} : 快捷方式图标对应的图片
function creationDesktop() {
    desktop="${1}.desktop"
    deskName=${2}
    optPath=${3}
    pngPath=${4}
    touch ${desktop}
    echo '[Desktop Entry]
Name='${deskName}'
Exec='${optPath}'
Icon='${pngPath}'
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Development' >${desktop}

    sudo chmod 755 "${optPath}"

    sudo mv ${desktop} /usr/share/applications/

    sudo chmod 644 "/usr/share/applications/${desktop}"

    echo "desktop creation success"
}

function createDesktopByCustomContent() {
    sudo touch ${1}
    sudo echo -e ${2} | sudo tee ${1}
}

# 判断文件是否存在
function isProcedureExist() {
    proName=$(pacman -Q ${1})
    isEmpty "${proName}"
    echo $?
}

# 设置环境变量
# ${1} 需要匹配内容是否存在
# ${2} 替换或新增的内容
# ${3} 在PATH中添加的内容
function editSystemPATH() {
    ProPath="${HOME}/.xprofile"
    # ProPath="${HOME}/Developments/ManjaroConfigrue/Shell/test-sed"
    # 判断需要配置的配置项是否存在
    path=$(sudo sed -n "/^PATH=.*$/p" ${ProPath})
    isEmpty "${path}"
    if [ $? == 0 ]; then
        # 不存在则添加配置项，同时添加PATH项
        path="PATH=\$PATH"
        sudo echo "" >> $ProPath
        sudo sed -i "\$a ${path}" ${ProPath}
    fi
    string=$(sudo sed -n "/${1}/p" ${ProPath})
    isEmpty "${string}"
    if [ $? == 0 ]; then
        # 不存在则在PATH前面添加配置项
        sudo sed -i "/^PATH/i ${2}" ${ProPath}
    else
        sudo sed -i "s%${1}%${2}%g" ${ProPath}
    fi
    sudo sed -i "s%^PATH.*$%${path}:${3}%g" ${ProPath}
    source ~/.xprofile
}

# 创建文件
# ${1} 文件名称
# ${2} 路径
# ${3} 文件内容
# e.g call : createFile "file_name" "file_path" "file_content"
function createFile() {
    touch ${1}
    echo -e ${3} > ${1}
    sudo mv ${1} ${2}
}

# 使用文件路径创建文件
# ${1} : 文件路径
# ${2} : 文件内容
# e.g call : createFileByPath "file_path" "file_content"
function createFileByPath() {
    sudo touch ${1}
    echo -e ${2} | sudo tee -a ${1}
}

# 编辑写入内容到文件
# ${1} : 文件路径目标
# ${2} : 写入内容
function editWriteFile() {
    echo -e ${2} | sudo tee -a ${1}
}

# 搜寻并替换指定行的内容
# ${1} : 编辑的文件
# ${2} : 搜寻的内容
# ${3} : 替换的内容
function editReplaceFileByLine() {
    # 搜寻获取行号
    lineNum=`sed -n "/${2}/=" ${1}`
    # 替换内容
    sudo sed -i "${lineNum}c ${3} " ${1}
}

# 判断输入值是否为空 或者 \n \t等空字符串或者无效的字符串
function isEmpty() {
    if [ -z "${1}" ]; then
        return 0
    fi
    if [ "$1" = "\n" ]; then
        return 0
    fi
    if [ "$1" = "\t" ]; then
        return 0
    fi
    return 1
}