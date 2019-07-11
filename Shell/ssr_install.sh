# !bin/bash

pxyDivPath=/etc/proxydriver.d/

isProcedureExist "yaourt"

if [ $? == 0 ]; then
    sudo pacman -S yaourt
fi

# installing electron_ssr
yaourt -S electron-ssr

# installing proxydriver
yaourt -S proxydriver

cd /etc/proxydriver.d/
confName=$(ls | grep .conf)
sudo cp "${pxyDivPath}${confName}" "${pxyDivPath}${confName}.copy"

