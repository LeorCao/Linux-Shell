#!/bin/bash

DESKTOP_DIR="/usr/share/applications/"

# 检查错误，如果有错误则打印错误信息，退出执行
# ${1} : 需要判断的信息
# ${2} : 错误时需要输出的错误原因
function checkError() {
    if [ ${1} -ne 0 ]; then
        printErrorEndMsg ${2}
    fi
}

# 打印安装前言
function printPrefaceMsg() {
    infoLog "-------------------------------"
    infoLog "--> Power by : Leor, Welcome to https://leor.com.cn"
    infoLog "--> Begin instaling~"
    infoLog "-------------------------------"
}

# 打印结束语
function printEndMsg() {
    infoLog "-------------------------------"
    infoLog "--> Installed success!"
    infoLog "--> Power by : Leor, Welcome to https://leor.com.cn"
    infoLog "-------------------------------"
    exit
}

# 打印错误安装失败
# ${1} : 错误原因
function printErrorEndMsg() {
    errorLog "-------------------------------" $FALSE
    errorLog "--> Instaling failed!" $FALSE
    errorLog "--> Cause : ${1}" $FALSE
    errorLog "--> Power by : Leor, Welcome to https://leor.com.cn" $FALSE
    errorLog "-------------------------------" $FALSE
    exit
}

# 获取当前文件夹下指定前缀的子文件或子目录名称
function getAssignPrefixChildDir() {
    echo $(ls | grep "${1}*" | xargs)
}

# 下载文件，返回文件名称, 也可以传入存储文件名称
# ${1} : 下载地址
# ${2} : 文件名称(可选)
function downloadFile() {
    local DloadGloandUrl=${1}
    local DloadSaveName=${DloadGloandUrl##*/}
    if [ ! -z ${2} ]; then
        local DloadSaveName=${2}
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
    local desktop="${1}"
    local deskName=${2}
    local optPath=${3}
    local pngPath=${4}
    local desktop="${DESKTOP_DIR}${desktop}"

    forceCreateAndWriteContToFile ${desktop} '[Desktop Entry]\nName='${deskName}'\nExec='${optPath}'\nIcon='${pngPath}'\nTerminal=false\nType=Application\nEncoding=UTF-8\nCategories=Development'\n

    echo "desktop creation success"
}

# 删除快捷方式
# ${1} : 快捷方式名称
function deleteDesktop() {
    local desktop_full_name="${DESKTOP_DIR}${1}"
    if [ -e "${desktop_full_name}" ]; then
        sudo rm -f ${desktop_full_name}
    fi
}

# 删除文件夹
# ${1} : 需要删除的文件夹
function deleteDir() {
    sudo rm -rf ${1}
}

# 输出快捷方式全路径
# ${1} : 快捷方式名称
function returnDesktopPath() {
    echo "/usr/share/applications/${1}"
}

# manjaro 判断 程序是否已安装
function isProcedureExist() {
    local proName=$(pacman -Q ${1})
    isEmpty "${proName}"
    echo $?
}

# 设置环境变量
# ${1} 需要匹配内容是否存在
# ${2} 需要写入的内容
# ${3} 在PATH中添加的内容
function editSystemPATH() {
    local ProPath="${HOME}/.xprofile"
    # ProPath="${HOME}/Developments/ManjaroConfigrue/Shell/test-sed"
    # 判断需要配置的配置项是否存在
    local path=$(sudo sed -n "/^PATH=.*$/p" ${ProPath})
    isEmpty "${path}"
    if [ $? == 0 ]; then
        # 不存在则添加配置项，同时添加PATH项
        local path="PATH=\$PATH"
        sudo echo "" >> $ProPath
        sudo sed -i "\$a ${path}" ${ProPath}
    fi
    local string=$(sudo sed -n "/${1}/p" ${ProPath})
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

# 使用文件路径创建文件
# ${1} : 文件路径
# ${2} : 文件内容
# e.g call : forceCreateAndWriteContToFile "file_path" "file_content"
function forceCreateAndWriteContToFile() {
    sudo touch ${1}
    echo -e ${2} | sudo tee -a ${1}
}

# 写入内容到文件
# ${1} : 文件路径目标
# ${2} : 写入内容
function editWriteFile() {
    echo -e ${2} | sudo tee -a ${1}
}

# 写入内容到文件，如果文件不存在则创建文件
# ${1} : 文件路径目标
# ${2} : 写入内容
function contentWriteToFileOnCreate() {
    if [ -f "${1}" ]; then
        sudo touch "${1}"
    fi
    echo -e ${2} | sudo tee -a ${1}
}

# 搜寻并替换指定行的内容
# ${1} : 编辑的文件
# ${2} : 搜寻的内容
# ${3} : 替换的内容
function editReplaceFileByLine() {
    # 搜寻获取行号
    local lineNum=`sed -n "/${2}/=" ${1}`
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

# 输出指定颜色的内容

# 黑色
# ${1} : 内容
function echoBlackContent() {
    echoContentWithAssginColor "${1}" $BLACK $DEFAULT_COLOR $DEFAULT_MODE
}

# 红色
# ${1} : 内容
function echoRedContent() {
    echoContentWithAssginColor "${1}" $RED $DEFAULT_COLOR $DEFAULT_MODE
}

# 绿色
# ${1} : 内容
function echoGreen() {
    echoContentWithAssginColor "${1}" $GREEN $DEFAULT_COLOR $DEFAULT_MODE
}

# 黄色
# ${1} : 内容
function echoYellow() {
    echoContentWithAssginColor "${1}" $YELLOW $DEFAULT_COLOR $DEFAULT_MODE
}

# 青色
# ${1} : 内容
function echoCyanBlue() {
    echoContentWithAssginColor "${1}" $CYAN_BLUE $DEFAULT_COLOR $DEFAULT_MODE
}

# 紫色
# ${1} : 内容
function echoPurple() {
    echoContentWithAssginColor "${1}" $PURPLE $DEFAULT_COLOR $DEFAULT_MODE
}

# 蓝色
# ${1} : 内容
function echoBule() {
    echoContentWithAssginColor "${1}" $BLUE $DEFAULT_COLOR $DEFAULT_MODE
}

# 白色
# ${1} : 内容
function echoWhite() {
    echoContentWithAssginColor "${1}" $WHITE_BACK $DEFAULT_COLOR $DEFAULT_MODE
}

# 前景   背景 对应颜色
# 30	40	 黑色
# 31	41	 红色
# 32	42	 绿色
# 33	43	 黃色
# 34	44	 蓝色
# 35	45	 紫红色
# 36	46	 青蓝色
# 37	47	 白色
# \033[显示方式;前景色;背景色m ${content} \033[0m

# 颜色
DEFAULT_COLOR=""
BLACK="black"
RED="red"
GREEN="green"
YELLOW="yellow"
BLUE="blue"
PURPLE="purple"
CYAN_BLUE="cyanBlue"
WHITE="white"

# 显示方式
DEFAULT_MODE="0"
BOLD="1"
UNDERLINE="4"
FLICKER="5"
WHITE_BACK="7"
INVISIBLE="8"

# 输出指定字体颜色、背景、是否闪烁、是否粗体的字体
# ${1} : 内容
# ${2} : 字体颜色
# ${3} : 背景颜色
# ${4} : 显示方式
# CALL e.g : echoContentWithAssginColor "content" "front color" "backgured color" "shwo mode"
function echoContentWithAssginColor() {
    local ret="\\033["
    if [ "${4}" != "${DEFAULT_MODE}" ]; then
        ret=${ret}${4}";"
    fi

    case "$2" in
        ${BLACK})
            ret=$ret"30;"
        ;;
        ${RED})
            ret=$ret"31;"
        ;;
        ${GREEN})
            ret=$ret"32;"
        ;;
        ${YELLOW})
            ret=$ret"33;"
        ;;
        ${BLUE})
            ret=$ret"34;"
        ;;
        ${PURPLE})
            ret=$ret"35;"
        ;;
        ${CYAN_BLUE})
            ret=$ret"36;"
        ;;
        ${WHITE})
            ret=$ret"37;"
        ;;
        *)
        ;;
    esac

    case "$3" in
        ${BLACK})
            ret=$ret"40;"
        ;;
        ${RED})
            ret=$ret"41;"
        ;;
        ${GREEN})
            ret=$ret"42;"
        ;;
        ${YELLOW})
            ret=$ret"43;"
        ;;
        ${BLUE})
            ret=$ret"44;"
        ;;
        ${PURPLE})
            ret=$ret"45;"
        ;;
        ${CYAN_BLUE})
            ret=$ret"46;"
        ;;
        ${WHITE})
            ret=$ret"47;"
        ;;
        *)
        ;;
    esac
    ret="${ret%;*}m ${1} \\033[0m"
    echo -e ${ret}
}

TRUE="1"
FALSE="0"

# 输出错误 白字红底 内容前加日期时间
# ${1} : 输出内容
# ${2} : 是否输出到文件
# ${3} : 日志文件路径
function errorLog() {
    local date=$(date +%F%n%T)
    local data="[${date}] ERROR : ${1}"
    echoContentWithAssginColor "${data}" $WHITE $RED $DEFAULT_MODE
    
    if [ "${2}" = "${TRUE}" ]; then
        contentWriteToFileOnCreate "${3}" "${data}"
    fi
}

# 输出信息 白字蓝底 添加日期时间
# ${1} : 输出内容
# ${2} : 是否输出到文件
# ${3} : 日志文件路径
function infoLog() {
    local date=$(date +%F%n%T)
    local data="[${date}] INFO : ${1}"
    echoContentWithAssginColor "${data}" $WHITE $CYAN_BLUE $DEFAULT_MODE
    if [ "${2}" = "${TRUE}" ]; then
        contentWriteToFileOnCreate "${3}" "${data}"
    fi
}
