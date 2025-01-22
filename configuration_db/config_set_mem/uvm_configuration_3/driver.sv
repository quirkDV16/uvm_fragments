////////////////////////////////////////////////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////s           www.testbench.in           s////
////s                                      s////
////s              UVM Tutorial            s////
////s                                      s////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////////////////////////////////////////////////

class driver extends uvm_driver;

integer int_cfg;
string  str_cfg;

     `uvm_component_utils_begin(driver)
         `uvm_field_int(int_cfg, UVM_DEFAULT)
         `uvm_field_string(str_cfg, UVM_DEFAULT)
     `uvm_component_utils_end

     function new(string name, uvm_component parent);
         super.new(name, parent);
     endfunction

     function void build();
         super.build();
     endfunction

endclass


