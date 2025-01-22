class my_test extends uvm_test;

`uvm_component_utils(my_test)

my_env env_h;

int dut_int=8;

extern function new(string name = "my_test",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
endclass

function my_test::new(string name = "my_test",uvm_component parent);
super.new(name,parent);
endfunction

function void my_test::build_phase(uvm_phase phase);
super.build_phase(phase);
	`uvm_info("my_test","THIS IS BUILD PHASE IN TEST",UVM_LOW)

env_h = my_env::type_id::create("env_h",this);
//uvm_config_db #(int)::set(this,"*","int",dut_int);	
endfunction

task my_test::run_phase(uvm_phase phase);
    	`uvm_info("my_test","THIS IS RUN PHASE IN TEST",UVM_LOW)

	phase.raise_objection(this);
	#100;
	uvm_config_db #(int)::set(this,"*","int",dut_int);
	phase.drop_objection(this);

endtask

	
