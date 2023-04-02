
# Verilog Tutorial

This repo contains verilog tutorial projects


## Authors

- [@snwizard](https://github.com/snwizard/)


## Deployment

To deploy this project run

```bash
  source setup/setup.sh
```



## Updating verilog source files

The verilog source code needs to be updated under the ***src/*** directory. All the verilog files in project need to be updated in the corresponding ***top_file*** .



## Compilation and run

The verilog source code can be compiled and run by using the commands mentioned below. 

***top_file*** should contain the list of all the verilog source files to be compiled. The compiled files are generated in the ***target/*** directory with extension ****.vvp***  
The waveform dump is generated in the ***target/*** directory with extension ****.vcd***  
The schematic is generated in the ***target/*** directory with extension ****.svg***  
The  synthesized netlist is generated in the ***target/*** directory with extension *****_synth.v***  

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

