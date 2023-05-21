
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

## Vscode setup

Download and install vscode from [`Visual Studio Code's website`](https://code.visualstudio.com/Download). We will use the following extensions to integrate the workflow in a single window.  

* [`Verilog-HDL/SystemVerilog/Bluespec SystemVerilog`](https://marketplace.visualstudio.com/items?itemName=mshr-h.VerilogHDL) for verilog syntax highlighting and linting
* [`SVG Previewer`](https://marketplace.visualstudio.com/items?itemName=vitaliymaz.vscode-svg-previewer) to preview the circuit schematic
* [`WaveTrace`](https://marketplace.visualstudio.com/items?itemName=wavetrace.wavetrace) waveform viewer (gtkwave works fine but wavetrace is integrated in vscode so the waveform can be viewed in the same window in which we code)


## Example

Follow the ***`Prerequisites`*** and ***`Vscode setup`*** steps to setup the IDE.  

* Launch vscode and open the git repo. Run the following command from vscode terminal (needs to be run only once after launching vscode)
```bash
   source setup/setup.sh
```

* We will compile and synthesize the RTL source code `src/counter/counter.v`. This path is added to the top file `src/counter/counter.top`. The top file also includes the test-bench file path.  

* We need to run the following command from vscode terminal to compile, simulate and synthesize the rtl code.
```bash
   compile_synth.sh -cs src/counter/counter.top
```

* The results are generated in the `target/` directory. `target/counter_counter_schematic.svg` has the circuit schematic and can be viewed using the `SVG Previewer` extension in vscode as shown below

* `target/counter_counter_sim.log` contains the simulation logs. `target/counter.vcd` has the waveform dump which can be viewed using `WaveTrace` vscode extension as shown below


## Appendix

[`Setup FPGA development workflow`](https://nishtahir.com/a-mostly-free-fpga-development-workflow-for-macos/)

