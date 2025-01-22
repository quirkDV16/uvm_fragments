class my_agent extends uvm_agent;

`uvm_component_utils(my_agent)

int agent_dut1 = 10 ;
int agent_dut2 = 20 ;
int agent_dut3 = 30 ;

extern function new(string name = "my_agent", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
endclass

function my_agent::new(string name = "my_agent", uvm_component parent = null);
	super.new(name, parent);
endfunction
     
  
function void my_agent::build_phase(uvm_phase phase);
	super.build_phase(phase);
	$display("\n---value of set in agent dut handle --- %d",agent_dut1);
	$display("---value of set in agent dut handle --- %d\n",agent_dut2);
	$display("---value of set in agent dut handle --- %d\n",agent_dut3);
endfunction

function void my_agent::connect_phase(uvm_phase phase);
	uvm_config_db #(int)::set(get_parent(),"","int",agent_dut1); // setting to env
	uvm_config_db #(int)::set(get_parent().get_parent(),"","int",agent_dut2); //setting to test
	uvm_report_info(get_type_name(),"my_agent",UVM_LOW);
//print_config_with_audit();
endfunction

function void my_agent::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
	`uvm_info("my_env","THIS IS EOF PHASE IN AGENT",UVM_LOW)
//print_config_with_audit(); 
//uvm_config_db #(int)::dump();
endfunction
