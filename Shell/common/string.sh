# !bin/bash

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
