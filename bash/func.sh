#!/usr/bin/env bash

# Used by the RCS simulator (or is it?)
function get_port {
    if [ -d /local/scratch ]; then
        TEMP_DIR=/local/scratch
    else
        local TEMP_DIR=`dirname \`mktemp -u\``
    fi
    if [ -f ${TEMP_DIR}/${USER}/RCS_ROOT/sourceMe.sh ]; then
        . ${TEMP_DIR}/${USER}/RCS_ROOT/sourceMe.sh
    fi
}

function module {
    eval `/app/modules/0/bin/modulecmd bash $@`
}

function add_to_path () {
    dir="$1"
    env="$2"
    var=\$"$env"
    tmp=`eval echo "$var" | sed -e "s|\${dir}:||"`
    export $env="$dir:$tmp"
}

function set_prompt() {
    # Set this variable if you want to define your own prompt in .bashrc.user or .zshrc
    if [ -z "$OWN_BASH_PROMPT" ]; then
        export PS1="[\[\033[00m\]\u@\h\[\033[01;34m\] \W\[\033[00m\]]\[\033[01;31m\]\$(__git_ps1)\[\033[00m\]$\[\033[00m\] "
    fi
}

function module_remove() {
    local mod=$1
    module rm $mod
}

# Make sure that the module is added to the beginning to PATH if it already exists, best (?) way is to remove the module first
function module_add() {
    local mod=$1
    module rm $mod
    module rm $mod
    module add $mod
}

function cond_module_add() {
	local var_value=$1
	local expected_value=$2
    local mod=$3

	if [ $var_value == $expected_value ] ; then	
		module use /app/rbs/modules/
	    module add $mod
		which arm-wrs-linux-gnueabi-gcc
	fi
}


function alias_set() {
    aliasname=$1
    aliasstring=$2
    alias $aliasname="$aliasstring"
}

function unset_var() {
    var=$1
    unset $var
}

function export_var() {
	name=$1
    word=$2
    if [ "$name" == "TOP_DIR" ]; then
        export $name=${word%/*/*}
    elif [ "$name" == "REPOROOT" ]; then
        export $name=${word%/*}
    else
        export $name="$word"
    fi
}


function export_var_if_empty() {
    local name=$1
    local value=$2
    if [ -z "${!name}" ]; then
        export $name=${value}
	else
		value=${!name}
		unset $name
		export $name="$value"
    fi
}



