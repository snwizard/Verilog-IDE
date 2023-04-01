#!/bin/bash

echo_sim_log () {
    echo "$1"
    echo "$1" >> $log_file
}

#sim
source setup.sh
cd $GIT_ROOT/target
output_file=$1
base_name="$(basename $output_file)" #name of file with extension
name=${base_name%%.*} #name of file without extension
log_file="$name"_sim.log

echo
echo "Sim run in progress ..."

vvp -l $log_file $base_name

echo_sim_log
waveform_loc_print="Waveform dump file location: $PWD"
echo_sim_log "$waveform_loc_print"

now=$(date)
log_print="\nRun completed on $now"
echo -e "$log_print" >> $log_file


