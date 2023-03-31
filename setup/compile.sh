#!/bin/bash

#------------function definitions----------------
file_gen () { 
  if [ -f $1 ];
  then
    echo_log "File exists"
    full_path=$1
    #base_name=${full_path##*/}
    base_name="$(basename $full_path)"
    name=${base_name%%.*}
    dir_name="$(basename $(dirname $full_path))"
    echo_log $name
    echo_log $dir_name
    touch target/"$dir_name"_"$name".o
  else
    echo_log "File doesn't exist"
  fi
}

echo_log () {
    echo $1
    echo $1 >> $LOG_FILE
}

exit_shell () {
    #echo $?
    now=$(date)
    echo_log "Script completed on $now"
    exit
} 
#------------function definitions----------------

#help
case "$1" in
  --help) echo "  -f             verilog compiles all files after this switch"
          echo "      --help     display this help and exit"
          exit;;
  *)  ;;
esac


source setup.sh

#check if git installed
if git --version 2>&1 >/dev/null ;
then
    #git --version
    echo
else
    echo "git not installed"
    exit
fi

#check if git repo, if not exit
git_repo="$(git rev-parse --git-dir)"
if [ "$git_repo" == "" ];
then
    echo "Not a git repo"
    exit
else
    #echo "git repo"
    echo
fi


mkdir -p $GIT_ROOT/target
LOG_FILE="$GIT_ROOT/target/compile.log"
rm -rf $LOG_FILE

echo_log "=========================================================================="
echo_log $0
echo_log "=========================================================================="
echo_log "$(git --version)"
#echo_log $#

arg_num=$#

#for var in "$@"
#do
#  echo_log "$var"
#  #mkdir -p "$var"_"$var"
#  case "$var" in
#    -a) echo_log "Found the -a option" ;;
#    -b) echo_log "Found the -b option" ;;
#    -c) echo_log "Found the -c option" ;;
#     *) echo_log "Not an option" ;;
#  esac
#done

while [ -n "$1" ]
do
  case "$1" in
    -f) while [ -n "$2" ]
        do          
          echo_log "Found the -f option, with parameter value $2"
          file_gen $2
          shift
        done;;
    
    #--) shift
    #    break ;;
    
    *)  echo_log "$1 is not an option";;
  esac
  shift
done

if [ $arg_num -eq 0 ];
then
    echo_log "no arguments"
fi

exit_shell


