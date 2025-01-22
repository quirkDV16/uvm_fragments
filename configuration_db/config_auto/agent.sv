////////////////////////////////////////////////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////s           www.testbench.in           s////
////s                                      s////
////s              UVM Tutorial            s////
////s                                      s////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////////////////////////////////////////////////

class agent extends uvm_agent;
integer int_cfg;
string  str_cfg;

     `uvm_component_utils_begin(agent)
         `uvm_field_int(int_cfg, UVM_DEFAULT)
         `uvm_field_string(str_cfg, UVM_DEFAULT)
     `uvm_component_utils_end

      protected uvm_active_passive_enum is_active = UVM_ACTIVE;
      monitor mon;
      driver drv;

     function new(string name, uvm_component parent);
         super.new(name, parent);
     endfunction

     function void build();
         super.build();
         mon = monitor::type_id::create("mon",this);   
         drv = driver::type_id::create("drv",this);   
     endfunction

endclass


