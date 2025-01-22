class my_test extends uvm_test;

`uvm_component_utils(my_test)

my_env env_h;

int test_int;

extern function new(string name = "my_test",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
endclass

function my_test::new(string name = "my_test",uvm_component parent);
super.new(name,parent);
endfunction

function void my_test::build_phase(uvm_phase phase);
super.build_phase(phase);
	`uvm_info("my_test","THIS IS BUILD PHASE IN TEST",UVM_LOW)

env_h = my_env::type_id::create("env_h",this);
endfunction

function void my_test::connect_phase(uvm_phase phase);
if(!uvm_config_db #(int)::get(this,"","int",test_int))
	`uvm_fatal("M_cfg","getting is failed")

$display("---value get in test {agent_dut2} ::: dut handle --- %d\n",test_int);
endfunction

function void my_test::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
	`uvm_info("my_env","THIS IS EOF PHASE IN TEST",UVM_LOW)
//uvm_config_db #(int)::dump();
//check_config_usage(1);
//print_config_with_audit(); 
//print_config();
endfunction