
# Verilog Tutorial

This repo contains verilog tutorial projects


## Authors

- [@snwizard](https://github.com/snwizard/)


## Prerequisites

icarus-verilog : Verilog compilation and simulation tool

```bash
  brew install icarus-verilog
```

gtkwave : GTK+ based simulation wave viewer

```bash
  brew install --cask gtkwave
```

yosys : Framework for Verilog RTL synthesis

```bash
  brew install yosys
```

netlistsvg : draws an SVG schematic from a yosys JSON netlist

```bash
  npm install -g netlistsvg
```

## Deployment

To deploy this project run

```bash
  source setup/setup.sh
```



## Process Library files

The process library files for synthesis are located in the ***lib/*** directory.  
In order to point to a new Library the following line in  ***setup/setup.sh*** needs to be updated.


```bash
  export LIB=$GIT_ROOT/lib/<name of lib file>
```


## Updating verilog source files

The verilog source code needs to be updated under the ***src/*** directory.  
All the verilog files in project need to be updated in the corresponding ***top_file*** and the name of top file has be same as the top module of the project.  
All ****.v*** file names have to be same as the module name in the file.



## Compilation Run and Synthesis

The verilog source code can be compiled and run by using the commands mentioned below. 

***top_file*** should contain the list of all the verilog source files to be compiled.  
The compiled files are generated in the ***target/*** directory with extension ****.vvp***  
The waveform dump is generated in the ***target/*** directory with extension ****.vcd***  
The schematic is generated in the ***target/*** directory with extension ****.svg***  
The synthesized netlist is generated in the ***target/*** directory with extension ****_synth.v***  

The verilog source code can be compiled and simulated by using the following command. 

```bash
  compile.sh -c <top_file path>
```

The verilog source code can be compiled, simulated and synthesized by using the following command. 

```bash
  compile.sh -cs <top_file path>
```

The verilog source code can be synthesized by using the following command. 

```bash
  compile.sh -s <top_file path>
```

