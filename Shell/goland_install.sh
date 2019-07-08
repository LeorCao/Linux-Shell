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
DloadSaveName=
DloadPatchUrl=
LocalPatchPath=
PatchName=

readonly DloadGloandUrl
readonly DloadPatchUrl
readonly LocalPatchPath
readonly PatchName

if [ ! -e ~/Downloads ];then
    mkdir ~/Downloads
fi

cd ~/Downloads

# Download Goland
curl -L $DloadGloandUrl -o ${DloadGloandUrl}

# Decompression Goland
sudo tar -xzvf $GolandSaveName -C /opt/

# 下载补丁
if [ -z "$DloadPatchUrl" ]; then
    curl ${DloadPatchUrl} -o ${PatchName}
fi

if [ ! -d "~/Downloads${PatchName}" ]; then

fi



exit