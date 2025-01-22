////////////////////////////////////////////////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////s           www.testbench.in           s////
////s                                      s////
////s              UVM Tutorial            s////
////s                                      s////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////////////////////////////////////////////////


class env extends uvm_env;
integer int_cfg;
string  str_cfg;

     `uvm_component_utils_begin(env)
         `uvm_field_int(int_cfg, UVM_DEFAULT)
         `uvm_field_string(str_cfg, UVM_DEFAULT)
     `uvm_component_utils_end

     agent ag1;
     agent ag2;
      
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build();
        super.build();
        ag1 = agent::type_id::create("ag1",this);   
        ag2 = agent::type_id::create("ag2",this);   
    endfunction

endclass


