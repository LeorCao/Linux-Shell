# !bin/bash

# 引入外部文件
source ./common/file.sh
source ./common/string.sh

# 检查文件夹（文件）是否存在
# if [ ! -e ~/Download ];then
#     echo "文件夹不存在"
# fi

# 格式化输出字符串
# echo 'aaaaaaa
# bbbbbbbbb'

# 测试方法执行返回值是否正常
# result=$(getChildDir "test")
# echo "call result : "${result}

# 字符串截取
# DloadGloandUrl=https://download.jetbrains.8686c.com/go/goland-2019.1.2.tar.gz
# DloadSaveName=${DloadGloandUrl##*/}
# echo ${DloadSaveName}

# str="\t"
# if [ ${str} = "\n" ]; then
#     echo "换行"
# fi

# isEmpty "\n"
# if [ $? == 0 ]; then
#     echo "等于0"
# fi

touch goland.desktop

echo '[Desktop Entry]
Name=Goland IDEA
Exec='${GolandChildDir}'/bin/goland.sh
Icon='${GolandChildDir}'/bin/goland.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Development
StartupNotify=true' > goland.desktop
