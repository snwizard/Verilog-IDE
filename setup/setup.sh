#!/bin/bash

export GIT_ROOT=$(git rev-parse --show-toplevel)
#echo $GIT_ROOT
export PATH=$PATH:$GIT_ROOT/setup/
export LIB=$GIT_ROOT/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
alias gr='cd $GIT_ROOT'
