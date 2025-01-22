///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////   MY_AGENT   ////////////////////////////////
///////////////////////////////////////////////////////////////////////////////	

class my_agent extends uvm_agent;

`uvm_component_utils(my_agent)

bit[13:0] ctrl_agt;

extern function new(string name = "my_agent", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass

function my_agent::new(string name = "my_agent", uvm_component parent = null);
super.new(name, parent);
endfunction
     
//////////////////// BUILD PHASE  
function void my_agent::build_phase(uvm_phase phase);
//if(!uvm_config_db#(bit[31:0])::get(this,"","bit[31:0]",ctrl_agt))
//		`uvm_fatal("MY_AGENT","CAN'T GET CONFIG-CTRL, HAVE U SET IT???")
//	else	$display("value of agt_control = %b",ctrl_agt);
`uvm_info("my_agent","THIS IS BUILD PHASE IN AGENT",UVM_LOW)
	

super.build_phase(phase);
endfunction

//////////////////// START OF SIMULATION
function void my_agent::start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	//start_of_simulation_ph.wait_for_state(UVM_PHASE_STARTED); 
endfunction


//////////////////// RUN PHASE
task my_agent::run_phase(uvm_phase phase);
    	`uvm_info("my_agent","THIS IS RUN PHASE IN AGENT",UVM_LOW)
//phase.raise_objection(this);

repeat(5)
begin	
//run_ph.wait_for_state(UVM_PHASE_STARTED);  

	$display($time," - Waiting to receive ctrl_agt"); 
	uvm_config_db#(bit[31:0])::wait_modified(this,"","bit[31:0]");
	//wait_for_state(UVM_PHASE_STARTED,UVM_EQ); 
	$display($time," - Received ctrl_agt value");
 
	if(!uvm_config_db#(bit[31:0])::get(this,"","bit[31:0]",ctrl_agt))
		`uvm_fatal("MY_AGENT","CAN'T GET CONFIG-CTRL, HAVE U SET IT???")
	else	$display("ATH_CLASS ::: control_reg value == %b ::: %0d\n",ctrl_agt,ctrl_agt);
end
//phase.drop_objection(this);

endtask	
