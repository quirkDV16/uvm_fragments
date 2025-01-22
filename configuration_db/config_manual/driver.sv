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

     `uvm_component_utils(driver)

     function new(string name, uvm_component parent);
         super.new(name, parent);
     endfunction

     function void build();
         super.build();
         void'(get_config_int("int_cfg",int_cfg));
         void'(get_config_string("str_cfg",str_cfg));
         uvm_report_info(get_full_name(),$psprintf("int_cfg %0d : str_cfg %0s ",int_cfg,str_cfg),UVM_LOW);
     endfunction

endclass


