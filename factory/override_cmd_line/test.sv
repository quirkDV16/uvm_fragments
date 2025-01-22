`include "uvm_macros.svh"
import uvm_pkg::*;

//////////	class  A	//////////
class A extends uvm_agent;
  `uvm_component_utils(A)
 
  function new (string name="A", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_full_name, $sformatf("A new"), UVM_LOW);
  endfunction : new
 
  virtual function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from Original class 'A'"), UVM_LOW);
  endfunction : hello
endclass : A

//////////	class  A_ovr	//////////
class A_ovr extends A;
  `uvm_component_utils(A_ovr)
 
  function new (string name="A_ovr", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_full_name, $sformatf("A_ovr new"), UVM_LOW);
  endfunction : new
 
  function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from override class 'A_ovr'"), UVM_LOW);
  endfunction : hello
endclass : A_ovr 

//////////	class  A_override	//////////
class A_override extends A;
  `uvm_component_utils(A_override)
 
  function new (string name="A_override", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_full_name, $sformatf("A_override new"), UVM_LOW);
  endfunction : new
 
  function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from override class 'A_override'"), UVM_LOW);
  endfunction : hello
endclass : A_override

//////////	class  B	//////////
class B extends uvm_sequence_item;
  `uvm_object_utils(B)
 
  function new (string name="B");
    super.new(name);
    `uvm_info(get_full_name, $sformatf("B new"), UVM_LOW);
  endfunction : new
 
  virtual function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from Original class 'B'"), UVM_LOW);
  endfunction : hello 
endclass : B

//////////	class  B_ovr	//////////
class B_ovr extends B;
  `uvm_object_utils(B_ovr)
 
  function new (string name="B_ovr");
    super.new(name);
    `uvm_info(get_full_name, $sformatf("B_ovr new"), UVM_LOW);
  endfunction : new
 
  function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from override class 'B_ovr'"), UVM_LOW);
  endfunction : hello
endclass : B_ovr

//////////	class  B_override	//////////
class B_override extends B_ovr;
  `uvm_object_utils(B_override)
 
  function new (string name="B_override");
    super.new(name);
    `uvm_info(get_full_name, $sformatf("B_override new"), UVM_LOW);
  endfunction : new
 
  function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from override class 'B_override'"), UVM_LOW);
  endfunction : hello
endclass : B_override

//--------------------env class--------------------
class environment extends uvm_env;
  `uvm_component_utils(environment)
  A a1, a2, a3;
  B b1, b2, b3;

  function new(string name="environment", uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    a1 = A::type_id::create("a1", this);
    a2 = A::type_id::create("a2", this);
    a3 = A::type_id::create("a3", this);
    b1 = B::type_id::create("b1",,"path1");
    b2 = B::type_id::create("b2",,"path2");
    b3 = B::type_id::create("b3",,"path3");
 
    void'(a1.hello()); // This will print from overridden class A_ovr
    void'(a2.hello()); // This will print from overridden class A_ovr
    void'(a3.hello()); // This will print from overridden class A_override
    void'(b1.hello()); // This will print from overridden class B_ovr
    void'(b2.hello()); // This will print from overridden class B_override
    void'(b3.hello()); // This will print from overridden class B_override 
  endfunction : build_phase
endclass : environment

//-------------------test class--------------------------
class test extends uvm_test;
  `uvm_component_utils(test)
  environment env;
 
  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env", this);
    `uvm_info(get_full_name, $sformatf("TEST set_inst_override_by_name"), UVM_LOW);
    
    //factory.set_type_override_by_type(A::get_type(), A_ovr::get_type()); // Working
    //factory.set_type_override_by_name("B", "B_override"); // Working
    
    //factory.set_inst_override_by_type(A::get_type(), A_override::get_type(), {get_full_name, ".", "env.a3"});
    //factory.set_inst_override_by_name("B", "B_ovr", "path1.b1");

   factory.print(); // This will print info about overridden classes.
  endfunction : build_phase
  
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
	uvm_top.print_topology();
  endfunction: end_of_elaboration_phase
endclass : test
