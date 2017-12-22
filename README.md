# ARM-CPU
ARM CPU is Verilog model of a CPU and memory running a subset of the ARM instruction set. 

## Motivation
The motivation behind this project was to learn how a CPU is designed at the gate level, as well as common CPU components like instruction memory, arithmetic logic unit, registers, and multiplexors.

## Prerequisites
Modelsim, which offers a free student edition [here.](https://www.mentor.com/company/higher_ed/modelsim-student-edition)

## Usage
Programs written in binary are located in ARM_CPU/benchmarks. To run a program simulation, uncomment the line containing the program's file name at the top of instructionmem.sv in ARM-CPU/verilog_files.

Run the Modelsim executable and enter the command "do runlab.do" in the Modelsim command line. From there, the simulation window will display the state of memory and CPU registers to verify that the program executed correctly!
