class my_test extends uvm_test;

`uvm_component_utils(my_test)

my_env env_h;

int dut_int=8;
int dut_int1=10;

extern function new(string name = "my_test",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass

function my_test::new(string name = "my_test",uvm_component parent);
super.new(name,parent);
endfunction

function void my_test::build_phase(uvm_phase phase);
super.build_phase(phase);
	`uvm_info("my_test","THIS IS BUILD PHASE IN TEST",UVM_LOW)

env_h = my_env::type_id::create("env_h",this);
uvm_config_db #(int)::set(this,"*","integer",dut_int);
//uvm_config_db #(int)::set(this,"*","int[0]",dut_int1);		
endfunction

function void my_test::connect_phase(uvm_phase phase);
//if(!uvm_config_db #(int)::get(this,"","int",dut_int))
//	`uvm_fatal("M_cfg","getting is failed")

//$display("\n---value in test dut handle--- %d\n",dut_int);

endfunction

	
