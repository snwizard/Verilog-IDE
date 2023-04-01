
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

The verilog source code needs to be updated under the ***src/*** directory. All the verilog files in project need to be updated in the corresponding ***import_file*** .



## Compilation and run

The verilog source code can be compiled and run by using the following command. 

```bash
  compile.sh -f <import_file path>
```
***import_file*** should contain the list of all the verilog source files to be compiled. The compiled files are generated in the ***target/*** directory with extension ****.vvp***  
The waveform dump is generated in the ***target/*** directory with extension ****.vcd***
