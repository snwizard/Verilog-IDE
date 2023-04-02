#!/bin/bash

#------------function definitions----------------
file_gen () { 
  if [ -f $1 ];
  then
    echo_log "File exists"
   
    COMPILE=0
    SYNTH=0 
    case "$2" in
        -c) COMPILE=1;;#synthesis enabled
        -cs)COMPILE=1 
            SYNTH=1;;#synthesis enabled
        -s) SYNTH=1;;#synthesis enabled
         *) ;;
    esac

    full_path=$(realpath $1)
    #base_name=${full_path##*/}
    base_name="$(basename $full_path)"
    name=${base_name%%.*}
    dir_name="$(basename $(dirname $full_path))"
    #echo_log $name
    #echo_log $dir_name
    output_file_name="$dir_name"_"$name".vvp
    output_file="$GIT_ROOT/target/$output_file_name"
     
    #cd to the git root
    #import_dir="$(dirname $full_path)"
    cd $GIT_ROOT

    if [ $COMPILE == 1 ]; then 
        #compile  
        ERROR_LOG=$(iverilog -o $output_file -c $full_path 2>&1 > /dev/null)
        
        echo_log "Compilation in Progress ..."
        echo_log "$ERROR_LOG"

        if [ "$ERROR_LOG" == "" ];
        then
            echo_log "Compiled Output File : $output_file"
        else
            echo_log "ERROR : Compilation Failed"
            exit_shell
        fi

        #sim
        source sim.sh $output_file
    fi

    #synthesis and schematic
    if [ $SYNTH == 1 ]; then 
        synth_schematic $full_path -s
    else
        synth_schematic $full_path
    fi

    


  else
    echo_log "File doesn't exist"
    echo_log "ERROR : Compilation Failed"
    exit_shell
  fi
}

synth_schematic () {
    source synth_schematic.sh $2 $1
}

echo_log () {
    echo "$1"
    echo "$1" >> $LOG_FILE
}

exit_shell () {
    #echo $?
    now=$(date)
    echo_log "Script completed on $now"
    exit
} 
#------------function definitions----------------

RUN_DIR=$PWD

#help
case "$1" in
  --help) echo "  -c             verilog compile and sim all files after this switch"
          echo "  -cs            verilog compile, sim and synthesis of all files after this switch"
          echo "  -s             verilog sythesis of all files after this switch"
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
rm -rf $LOG_FILE #remove older versions if any

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
    -c) while [ -n "$2" ] #compilation,sim,schematic
        do          
          cd $RUN_DIR
          echo_log "Found the -f option, with file name $2"
          file_gen $2 -c
          shift
        done;;
    
    -cs) while [ -n "$2" ] #compilation,sim,schematic and synthesis
        do          
          cd $RUN_DIR
          echo_log "Found the -f option, with file name $2"
          file_gen $2 -cs
          shift
        done;;

    -s) while [ -n "$2" ] #schematic and synthesis
        do          
          cd $RUN_DIR
          echo_log "Found the -f option, with file name $2"
          file_gen $2 -s
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
    echo_log "ERROR: No arguments"
fi

exit_shell


