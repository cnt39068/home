#!/usr/bin/env bash

# ME=$0
# test "$BASH" && ME=${BASH_SOURCE[0]}
# export SCRIPTPATH="$(readlink -f `dirname $ME`)"
# 
# alias select_config=$ERBS_ROOT"/tools/@@/LTERBS-SWDI-PUBLIC/config/LTERBS-PUBLIC/R0/LTERBS-R0-PUBLIC/selectconfig/LTERBS-R0-PUBLIC/select_config.sh/LTERBS-R0-PUBLIC"
# 
# for files in `ls ${SCRIPTPATH}/scripts/bash_completion.d`; do
#     . ${SCRIPTPATH}/scripts/bash_completion.d/${files}
# done

source ~/bin/git-prompt.sh

# SCRIPTSETUPPATH=${SCRIPTPATH}/scripts/setup

# Get misc help functions
source ~/bin/func.sh

# Misc setup
# source ${SCRIPTSETUPPATH}/misc_setup $1 $2
set_prompt

