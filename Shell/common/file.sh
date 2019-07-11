# !bin/bash

source ./common/string.sh

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
Categories=Development' > ${desktop}

    sudo chmod 755 "${optPath}"

    sudo mv ${desktop} /usr/share/applications/

    sudo chmod 644 "/usr/share/applications/${desktop}"
    
    echo "desktop creation success"
}

# 判断文件是否存在
function isProcedureExist () {
    proName=$(pacman -Q ${1})
    isEmpty "${proName}"
    echo $?
}
