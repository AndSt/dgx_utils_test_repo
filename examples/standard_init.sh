#!/bin/bash

# We assume all things are stored under /storage/$USER.
# Additionally, we assume that the gateway server and slurm has access to it.
SETUP_DIR=/storage/$USER/server_setup

# source all export files
for file in "${SETUP_DIR}"/exports/*; do
    source $file
done

# source all alias files
for file in "${SETUP_DIR}"/aliases/*; do
    source $file
done

# We assume anaconda is installed on the system
# The code below is standard anaconda code.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# install and setup venv
export WORKON_HOME="${STORAGE}/virtual-envs"
export VIRTUALENVWRAPPER_PYTHON=/opt/anaconda3/bin/python

source $GATEWAY_HOME/.local/bin/virtualenvwrapper.sh