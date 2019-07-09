# !bin/bash

# import
source ./common/file.sh
source ./common/decomp.sh
source ./common/string.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing WebStrom IDE

# configuration definition
DloadUrl=https://download-cf.jetbrains.com/webstorm/WebStorm-2019.1.2.tar.gz
DloadSaveName=${DloadUrl##*/}
GolandChildDir=/opt/WebStorm-191.7141.49
DeskTopName=webstrom.desktop

readonly DloadUrl
readonly DloadSaveName
readonly GolandChildDir

if [ ! -e ~/Downloads ]; then
     mkdir ~/Downloads
 fi

cd ~/Downloads

# Download Webstrom
curl -L ${DloadUrl} -o ${DloadSaveName}

# Decompression Goland
sudo tar -xzvf ${DloadSaveName} -C /opt/

touch $DeskTopName

echo '[Desktop Entry]
Name=Goland IDEA
Exec='${GolandChildDir}'/bin/goland.sh
Icon='${GolandChildDir}'/bin/goland.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Development' > $DeskTopName
