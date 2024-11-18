#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f counter.vcd

# connect to Vbuddy
# source ~/Documents/iac/lab0-devtools/tools/attach_usb.sh

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace counter.sv --trace top.sv --trace bin2bcd.sv --exe top_tb.cpp

# build C++ project via make automatically generated by Verilator
make -j -C obj_dir/ -f Vcounter.mk Vcounter

# run executable simulation file
obj_dir/Vcounter