import uvm_pkg::*;

`include "uvm_macros.svh"
`include "my_agent.sv"
`include "my_env.sv"
`include "my_test.sv"


module top;
	
int dut_int = 16;

initial 

uvm_config_db#(int)::set(null,"*","int",dut_int);

initial run_test();

endmodule
