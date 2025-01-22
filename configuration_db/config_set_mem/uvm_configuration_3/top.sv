////////////////////////////////////////////////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////s           www.testbench.in           s////
////s                                      s////
////s              UVM Tutorial            s////
////s                                      s////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////////////////////////////////////////////////

`include "uvm.svh"
 import uvm_pkg::*;

`include "driver.sv"  
`include "monitor.sv"  
`include "agent.sv"  
`include "env.sv"  
`include "test.sv"

module top;

  initial
    run_test();

endmodule


