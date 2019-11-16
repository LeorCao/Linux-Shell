#!/bin/bash

. ./common.sh

# 检查执行是否有错误
# checkError "check conteng" "error print massage"

# 测试输出安装开始语
printPrefaceMsg

# 测试输出正常结束语
# printEndMsg

# 测试输出错误结束语
# printErrorEndMsg "test print error end massage"

# 测试获取指定前缀的文件或目录名称
# getAssignPrefixChildDir "t"

# 测试下载文件，指定存储文件名称，或自动根据url截取文件名
# downloadFile "download url" "file name"

# 测试创建快捷方式
# creationDesktop "goland" "Goland IDEA" "/bin/goland.sh" "/bin/goland.png"

# 测试 manjaro 判断程序是否已安装
# isProcedureExist "xx procedure"

# 测试编辑系统 PATH
# editSystemPATH "^export GOROOT=.*$" "export GOROOT=abcdef" "\$GOPATH/bin"

# 测试强制创建新文件，并写入内容到文件
# forceCreateAndWriteContToFile "./log" "test content"

# 测试输入内容到文件函数
# editWriteFile "./log" "test content"

# 测试写入内容到文件，不存在则创建文件函数
# contentWriteToFileOnCreate "./log" "test content"

# 测试编辑替换指定内容的行
# editReplaceFileByLine ./test.file "abcdefg" "gfedcba"

# 测试判断内容是否为空
# isEmpty ""
# echo $?

# 测试输出黑色字体
# echoBlackContent "test content"

# 测试输出红色字体
# echoRedContent "test content"

# 测试输出绿色字体
# echoGreen "test content"

# 测试输出黄色字体
# echoYellow "test content"

# 测试输出青色字体
# echoCyanBlue "test content"

# 测试输出紫色字体
# echoPurple "test content"

# 测试输出蓝色字体
# echoBule "test content"

# 测试输出白色字体
# echoWhite "test content"

# 测试输出指定颜色的内容函数
# echoContentWithAssginColor "test string" $BLACK $DEFAULT_COLOR $DEFAULT

# 测试输出错误log函数
# errorLog "test string" $FALSE "./log"

# 测试输出log函数
# infoLog "test string" $TRUE "./log"
