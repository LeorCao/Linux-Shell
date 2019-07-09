# !bin/bash

source ./string.sh

# 获取当前文件夹下制定前缀的子文件（目录）名称
function getChildDir() {
    echo `ls | grep "${1}*" | xargs`
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
    isEmpty "$DloadGloandUrl"
    if [ $? == 0 ]; then
        echo "download url is empty"
    fi
    curl -L ${DloadGloandUrl} -o ${DloadSaveName}
    echo $DloadSaveName
    unset DloadGloandUrl
    unset DloadSaveName
}