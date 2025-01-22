`include "uvm_macros.svh"
import uvm_pkg::*;

class component_A #(parameter ID_WIDTH = 8) extends uvm_component;
  bit [ID_WIDTH-1:0] id;
  `uvm_component_param_utils(component_A #(ID_WIDTH))
  
  function new(string name = "component_A", uvm_component parent = null);
    super.new(name, parent);
    id = 1;
  endfunction
  
  function display();
    `uvm_info(get_type_name(), $sformatf("inside component_A: id = %0b", id), UVM_LOW);
  endfunction
endclass

class mycomponent #(parameter ID_WIDTH = 8) extends uvm_component;
  bit [ID_WIDTH-1:0] id;
  `uvm_component_param_utils(mycomponent #(ID_WIDTH))
  
  function new(string name = "mycomponent", uvm_component parent = null);
    super.new(name, parent);
    id = 2;
  endfunction
  
  function display();
    `uvm_info(get_type_name(), $sformatf("inside mycomponent: id = %0b", id), UVM_LOW);
  endfunction
endclass

class component_B #(int ID_WIDTH = 8) extends component_A #(ID_WIDTH);
  bit ctrl;
  bit [ID_WIDTH-1:0] id;
  mycomponent #(8) my_comp;
  `uvm_component_param_utils(component_B #(ID_WIDTH))
  
  function new(string name = "component_B", uvm_component parent = null);
    super.new(name, parent);
    id = 3;
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_resource_db #(bit)::read_by_name(get_full_name(), "control", ctrl))
      `uvm_fatal(get_type_name(), "read_by_name failed for resource in this scope");
    if(ctrl)  my_comp = mycomponent #(8)::type_id::create("my_comp", this);
    
  endfunction
  
  function display();
    `uvm_info(get_type_name(), $sformatf("inside component_B: id = %0b, ctrl = %0d", id, ctrl), UVM_LOW);
    if(ctrl) void'(my_comp.display());
  endfunction
endclass

class my_test extends uvm_test;
  bit control;
  `uvm_component_utils(my_test)
  component_A #(32) comp_A;
  component_B #(16) comp_B;
  
  function new(string name = "my_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    comp_A = component_A #(32)::type_id::create("comp_A", this);
    comp_B = component_B #(16)::type_id::create("comp_B", this);
    
    uvm_resource_db #(bit)::set("*", "control", 1, this);
  endfunction
   
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    void'(comp_A.display());
    void'(comp_B.display());
  endtask
endclass

