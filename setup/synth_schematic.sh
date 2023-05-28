#!/bin/bash

SYNTH=0
case "$1" in
  -s) SYNTH=1
      shift;; #synthesis enabled
   *) ;;
esac


source setup.sh
mkdir -p $GIT_ROOT/target
cd $GIT_ROOT/target
YOSYS_LOG="$GIT_ROOT/target/yosys.log"
YOSYS_RUN="$GIT_ROOT/target/yosys_run.ys"
rm $YOSYS_LOG
rm $YOSYS_RUN
full_path=$(realpath $1)

dir_name="$(basename $(dirname $full_path))" #dir name only 
#echo $dir_name
base_name="$(basename $full_path)" #name of file with extension
name=${base_name%%.*} #name of file without extension
schematic_name="$dir_name"_"$name"_schematic.json
schematic_svg_name="$dir_name"_"$name"_schematic.svg
synth_name="$dir_name"_"$name"_synth.v
synth_schematic_name="$dir_name"_"$name"_synth_schematic.json
synth_schematic_svg_name="$dir_name"_"$name"_synth_schematic.svg

#generate $YOSYS_RUN ----start
IFS_OLD=$IFS
IFS=''
while read -r line; do #reading the import file lines
  if ! [[ "$line" =~ \_tb.v$ ]]; then #if file name is not _tb.v
    echo "read_verilog $GIT_ROOT/$line" >> $YOSYS_RUN
  fi
done < $full_path
IFS=$IFS_OLD

echo "prep -top $name; write_json $schematic_name"  >> $YOSYS_RUN
if [ $SYNTH == 1 ]; then
    echo "synth -top $name; write_json $synth_schematic_name" >> $YOSYS_RUN
    echo "dfflibmap -liberty $LIB" >> $YOSYS_RUN
    echo "abc -liberty $LIB" >> $YOSYS_RUN
    echo "clean" >> $YOSYS_RUN
    echo "write_verilog -noattr $synth_name" >> $YOSYS_RUN
fi

#generate $YOSYS_RUN ----end

Y_LOG=$(yosys $YOSYS_RUN 2>&1)
echo "$Y_LOG"
echo "$Y_LOG" >> $YOSYS_LOG

netlistsvg $schematic_name -o $schematic_svg_name 

if [ $SYNTH == 1 ]; then
    netlistsvg $synth_schematic_name -o $synth_schematic_svg_name
fi
