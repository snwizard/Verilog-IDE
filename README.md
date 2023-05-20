
# Verilog IDE

Verilog IDE is an automated Verilog development environment for semiconductor enthusiasts. Once the RTL design is ready a single command generates the simulation waveform dump, synthesised netlist and a circuit svg schematic. This project has been tested on macOS, Ubuntu and Windows11(with Ubuntu WSL).


## Authors

- [`@snwizard`](https://github.com/snwizard/)


## Prerequisites

* [`icarus-verilog`](https://github.com/steveicarus/iverilog) : Verilog compilation and simulation tool  

&emsp;&emsp;`macOS:`
```bash
  brew install icarus-verilog
```   
&emsp;&emsp;`Ubuntu:`
```bash
  sudo apt install iverilog
```

* [`gtkwave`](https://gtkwave.sourceforge.net) : GTK+ based simulation wave viewer

&emsp;&emsp;`macOS:`
```bash
  brew install --cask gtkwave
```
&emsp;&emsp;`Ubuntu:`
```bash
  sudo apt install gtkwave
```

* [`yosys`](https://github.com/YosysHQ/yosys) : Framework for Verilog RTL synthesis

&emsp;&emsp;`macOS:`
```bash
  brew install yosys
```
&emsp;&emsp;`Ubuntu:`
```bash
  sudo apt install yosys
```

* [`netlistsvg`](https://github.com/nturley/netlistsvg) : draws an SVG schematic from a yosys JSON netlist. 

&emsp;&emsp;`macOS:`
```bash
  npm install -g netlistsvg
```
&emsp;&emsp;`Ubuntu:`
```bash
  sudo apt install npm
  sudo npm install -g netlistsvg
```

## Deployment

To deploy this project run

```bash
  source setup/setup.sh
```



## Process Library files

The process library files for synthesis are located in the ***`lib/`*** directory.  
In order to point to a new Library the following line in  ***`setup/setup.sh`*** needs to be updated.  
For more libraries refer to [`The SkyWater Open Source PDK`](https://github.com/google/skywater-pdk)


```bash
  export LIB=$GIT_ROOT/lib/<name of lib file>
```


## Updating verilog source files

The verilog source code needs to be updated under the ***`src/`*** directory.  
All the verilog files in project need to be updated in the corresponding ***`top_file`*** and the name of top file has to be same as the top module of the project.  
All ***`*.v`*** file names have to be same as the module name in the file.  
All testbench files must have ***`*_tb.v`*** naming format.



## Compilation Run and Synthesis

The verilog source code can be compiled and run by using the commands mentioned below. 

***`top_file`*** should contain the list of all the verilog source files to be compiled.  
The compiled files are generated in the ***`target/`*** directory with extension ***`*.vvp`***  
The waveform dump is generated in the ***`target/`*** directory with extension ***`*.vcd`***  
The schematic is generated in the ***`target/`*** directory with extension ***`*.svg`***  
The synthesized netlist is generated in the ***`target/`*** directory with extension ***`*_synth.v`***  

The verilog source code can be compiled and simulated by using the following command. 

```bash
  compile_synth.sh -c <top_file path>
```

The verilog source code can be compiled, simulated and synthesized by using the following command. 

```bash
  compile_synth.sh -cs <top_file path>
```

The verilog source code can be synthesized by using the following command. 

```bash
  compile_synth.sh -s <top_file path>
```


## Appendix

[`Setup FPGA development workflow`](https://nishtahir.com/a-mostly-free-fpga-development-workflow-for-macos/)
[`readme.so`](https://readme.so)
