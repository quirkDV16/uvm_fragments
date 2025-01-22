class my_agent extends uvm_agent;

`uvm_component_utils(my_agent)

int local_dut;

extern function new(string name = "my_agent", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
endclass

function my_agent::new(string name = "my_agent", uvm_component parent = null);
super.new(name, parent);
endfunction
     
  
function void my_agent::build_phase(uvm_phase phase);
super.build_phase(phase);


if(uvm_config_db#(int)::exists(this," ","int"))
	`uvm_info("CONFIG_EXISTS","was able find config handle",UVM_LOW)


if(!uvm_config_db #(int)::get(this,"","int",local_dut))
	`uvm_fatal("M_cfg","getting is failed")

$display("\n---value in agent dut handle--- %d\n",local_dut);

endfunction

function void my_agent::connect_phase(uvm_phase phase);

endfunction

