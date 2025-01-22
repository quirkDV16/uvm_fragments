///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////   MY_ENV   //////////////////////////////////
///////////////////////////////////////////////////////////////////////////////	

class my_env extends uvm_env;
		
`uvm_component_utils(my_env)

//int dut_int = 4;
	
my_agent agt_h;

extern function new(string name = "my_env",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
endclass
	
function my_env::new(string name="my_env",uvm_component parent);
super.new(name,parent);
endfunction

//////////////////// BUILD PHASE  
function void my_env::build_phase(uvm_phase phase);	
super.build_phase(phase);
	`uvm_info("my_env","THIS IS BUILD PHASE IN ENV",UVM_LOW)

	agt_h=my_agent::type_id::create("agt_h",this);
//uvm_config_db #(int)::set(this,"*","int",dut_int);

endfunction

//////////////////// RUN PHASE
task my_env::run_phase(uvm_phase phase);
	`uvm_info("my_env","THIS IS RUN PHASE IN ENV",UVM_LOW);
//for(int i=0;i<10;i++)
//begin
// uvm_config_db#(int)::set(this,"*","loopcount",i);
//end
endtask
