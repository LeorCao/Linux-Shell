#!/bin/bash

. ./../../common/common.sh

# 配置 optimus.sh

# /usr/local/bin/optimus.sh
export OPTIMUS_SHELL_NAME=optimus.sh
export OPTIMUS_SHELL_PATH=/usr/local/bin/

# Content :
# #!/bin/sh

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

forceCreateAndWriteContToFile "${OPTIMUS_SHELL_PATH}${OPTIMUS_SHELL_NAME}" '#!/bin/sh\n\nxrandr --setprovideroutputsource modesetting NVIDIA-0\nxrandr --auto'

sudo chmod a+rx ${OPTIMUS_SHELL_PATH}${OPTIMUS_SHELL_NAME}

unset OPTIMUS_SHELL_NAME
unset OPTIMUS_SHELL_PATH