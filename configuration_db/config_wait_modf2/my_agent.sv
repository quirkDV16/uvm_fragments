class my_agent extends uvm_agent;

`uvm_component_utils(my_agent)

int local_dut;

extern function new(string name = "my_agent", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
endclass

function my_agent::new(string name = "my_agent", uvm_component parent = null);
super.new(name, parent);
endfunction
     
  
function void my_agent::build_phase(uvm_phase phase);
super.build_phase(phase);

if(uvm_config_db#(int)::exists(this," ","int"))
	`uvm_info("CONFIG_EXISTS","was able find config handle",UVM_LOW)


//if(!uvm_resource_db #(int)::read_by_name(get_full_name(), "int", local_dut,this))
//	`uvm_fatal(get_type_name(), "read_by_name failed for resource in this scope");

//	`uvm_info(get_type_name(), $sformatf("\n---value in agent local handle--- %d\n", local_dut), UVM_LOW);
endfunction

task my_agent::run_phase(uvm_phase phase);
    	`uvm_info("my_agent","THIS IS RUN PHASE IN AGENT",UVM_LOW)
//phase.raise_objection(this);

repeat(5)
begin	
//run_ph.wait_for_state(UVM_PHASE_STARTED);  

	$display("Waiting to receive dut_int - ",$time); 
	uvm_config_db#(int)::wait_modified(this,"","int");
	//wait_for_state(UVM_PHASE_STARTED,UVM_EQ); 
	$display("Received dut_int value - ",$time);
 
	if(!uvm_config_db#(int)::get(this,"","int",local_dut))
		`uvm_fatal("MY_AGENT","CAN'T GET CONFIG, HAVE U SET IT???")
	else	$display("ATH_CLASS ::: local_dut value == %0d",local_dut);
end
//phase.drop_objection(this);

endtask	