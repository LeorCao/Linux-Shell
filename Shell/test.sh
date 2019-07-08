# !bin/bash

pwd

source ./common/file.sh

# if [ ! -e ~/Download ];then
#     echo "文件夹不存在"
# fi

# echo 'aaaaaaa
# bbbbbbbbb'

result=$(getChildDir "test")
echo "call result : "${result}