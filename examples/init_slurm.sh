#!/bin/bash

# standard stuff
source standard_init.sh

# project directory
# note that we assume that $PROJ is set by standard_init.sh and $PROJ_NAME within the .sbatch file
PROJ_DIR=$PROJ/$PROJ_NAME

# choose environment to work on
workon $PROJ_NAME