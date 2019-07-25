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
Categories=Development' >${desktop}

    sudo chmod 755 "${optPath}"

    sudo mv ${desktop} /usr/share/applications/

    sudo chmod 644 "/usr/share/applications/${desktop}"

    echo "desktop creation success"
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
