# !bin/bash

# import
source ./common/file.sh
source ./common/decomp.sh
source ./common/string.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing Goland IDE

# configuration definition
DloadGloandUrl=https://download.jetbrains.8686c.com/go/goland-2019.1.2.tar.gz
DloadSaveName=${DloadGloandUrl##*/}
GolandChildDir=/opt/GoLand-2019.1.2

readonly DloadGloandUrl
readonly DloadSaveName

if [ ! -e ~/Downloads ]; then
     mkdir ~/Downloads
fi

cd ~/Downloads

# Download Goland
curl -L $DloadGloandUrl -o ${DloadSaveName}

# Decompression Goland
sudo tar -xzvf ${DloadSaveName} -C /opt/

touch goland.desktop

echo '[Desktop Entry]
Name=Goland IDEA
Exec='${GolandChildDir}'/bin/goland.sh
Icon='${GolandChildDir}'/bin/goland.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Development' > goland.desktop

sudo chmod 755 "$GolandChildDir/bin/goland.sh"

sudo mv goland.desktop /usr/share/applications/

sudo chmod 644 /usr/share/applications/goland.desktop

$GolandChildDir/bin/goland.sh

exit
