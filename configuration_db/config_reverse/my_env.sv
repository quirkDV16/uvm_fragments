class my_env extends uvm_env;
		
`uvm_component_utils(my_env)

int env_int;
	
my_agent agt_h;

extern function new(string name = "my_env",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
endclass
	
function my_env::new(string name="my_env",uvm_component parent);
super.new(name,parent);
endfunction

function void my_env::build_phase(uvm_phase phase);	
super.build_phase(phase);
	`uvm_info("my_env","THIS IS BUILD PHASE IN ENV",UVM_LOW)
	agt_h=my_agent::type_id::create("agt_h",this);

endfunction

function void my_env::connect_phase(uvm_phase phase);
if(!uvm_config_db #(int)::get(this,"","int",env_int))
	`uvm_fatal("M_cfg","getting is failed")

$display("\n---value get in envr {agent_dut1} ::: dut handle --- %d",env_int);
endfunction

function void my_env::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
	`uvm_info("my_env","THIS IS EOF PHASE IN ENVR",UVM_LOW)
//print_config_with_audit(); 
//uvm_config_db #(int)::dump();
endfunction