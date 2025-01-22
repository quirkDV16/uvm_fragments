class my_agent extends uvm_agent;

`uvm_component_utils(my_agent)

int local_dut;

extern function new(string name = "my_agent", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
endclass

function my_agent::new(string name = "my_agent", uvm_component parent = null);
super.new(name, parent);
endfunction
     
  
function void my_agent::build_phase(uvm_phase phase);
super.build_phase(phase);

if(uvm_config_db#(int)::exists(this," ","int"))
	`uvm_info("CONFIG_EXISTS","was able find config handle",UVM_LOW)


if(!uvm_resource_db #(int)::read_by_name(get_full_name(), "int", local_dut,this))
	`uvm_fatal(get_type_name(), "read_by_name failed for resource in this scope");

	`uvm_info(get_type_name(), $sformatf("\n---value in agent local handle--- %d\n", local_dut), UVM_LOW);
	
endfunction

