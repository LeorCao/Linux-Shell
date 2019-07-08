# !bin/bash

# 获取当前文件夹下制定前缀的子文件（目录）名称
function getChildDir() {
    echo `ls | grep "${1}*" | xargs`
}