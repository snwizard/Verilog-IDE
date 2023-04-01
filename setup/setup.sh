#!/bin/bash

export GIT_ROOT=$(git rev-parse --show-toplevel)
#echo $GIT_ROOT
export PATH=$PATH:$GIT_ROOT/setup/
alias gr='cd $GIT_ROOT'
