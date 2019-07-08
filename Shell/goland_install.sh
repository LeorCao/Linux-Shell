# !bin/bash

# import
source ./command/string.sh
source ./command/file.sh
source ./command/decom.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing Goland IDE,
#    you can configure <LocalPatchPath> or <DloadPatchUrl> params
#    installation and configuration patchs.
#    You can use the command line to pass in parameters,
#    or you can configure parameters in scripts.
# Parameter   : -u  : goland installation package download url
#    -sn : goland installation package download storage local name
#    -pu : patchs file download url
#    -pn : patchs file download storage local name
#    -lp : local patch file storage path
#    [-pu -pn] and [-lp] only one can be used, [-pu -pn] must be used at the same time.

# configuration definition
DloadGloandUrl=https://download.jetbrains.8686c.com/go/goland-2019.1.2.tar.gz
DloadSaveName=${DloadGloandUrl##*/}
DloadPatchUrl=
PatchName=/JetbrainsCrack-4.2.jar
GolandChildDir=

readonly DloadGloandUrl
readonly DloadSaveName
readonly DloadPatchUrl

if [ ! -e ~/Downloads ]; then
    mkdir ~/Downloads
fi

cd ~/Downloads

# Download Goland
curl -L $DloadGloandUrl -o ${DloadGloandUrl}

# Decompression Goland
sudo tar -xzvf $GolandSaveName -C /opt/

# 下载补丁

# 补丁下载url不为空字符串
isEmpty "$DloadPatchUrl"
if [ $? == 1 ]; then
    PatchName=${DloadPatchUrl##*/}
else
    # url 为空指定文件名称
    PatchName=/JetbrainsCrack.jar
fi

# 截取文件名称不为空字符串？
isEmpty "$PatchName"
if [ $? == 0 ]; then
    # 为空为文件指定名称
    PatchName=/JetbrainsCrack.jar
fi

# 下载补丁文件
curl ${DloadPatchUrl} -o ${PatchName}

# 检查补丁文件是否存在
if [ ! -e "${PatchName}" ]; then
    echo "not found patch file${PatchName}"
else
    sudo mv ${PatchName} /opt/
fi

exit
