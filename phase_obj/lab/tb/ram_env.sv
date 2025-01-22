/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:	ram_env.sv

Description 	: 	Environment class for Dual Port RAm testbench
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_env from uvm_env
class ram_env extends uvm_env;

   // Factory Registration
	`uvm_component_utils(ram_env)

	// Declare the ram_wr_agent handle
 	ram_wr_agent wr_agnth;


	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "ram_env",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern function void end_of_elaboration_phase(uvm_phase phase);
	extern function void start_of_simulation_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern function void extract_phase(uvm_phase phase);
	extern function void check_phase(uvm_phase phase);
	extern function void report_phase(uvm_phase phase);

/*
	virtual function void raised (uvm_objection objection, 
                                      uvm_object source_obj,
                                      string description, 
                                      int count);
		`uvm_info("RAISED = ENVIR", $sformatf("%0d objection(s) raised from %s, total count is now %0d", 
      		           count, source_obj.get_full_name, objection.get_objection_total(this)), UVM_NONE)
         //description is empty
         //`uvm_info("raised", $sformatf("description=%s", description), UVM_HIGH)
 	 endfunction : raised


	virtual task all_dropped (uvm_objection objection, 
                            	  uvm_object source_obj,
                            	  string description, // 2nd argument of phase.drop_objection method
                            	  int count);
	
		`uvm_info("ALL DROPPED = ENVIR", $sformatf("Last %0d objection(s) dropped from %s, total count is now %0d", 
      			count, source_obj.get_full_name, objection.get_objection_total(this)), UVM_NONE)
    	//	#50;
  	endtask : all_dropped
*/

endclass
	
//-----------------  constructor new method  -------------------//
function ram_env::new(string name="ram_env",uvm_component parent);
	super.new(name,parent);
endfunction

       
  
// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//         Hint : `uvm_info(“RAM_ENV”,”This is Build Phase ”, UVM_HIGH)   
   

 //-----------------  Add UVM build() phase   -------------------//
function void ram_env::build_phase(uvm_phase phase);	
	super.build_phase(phase);
	// Create the instance of agent in the build phase
	wr_agnth=ram_wr_agent::type_id::create("wr_agnth",this);
	`uvm_info("RAM_ENV","THIS IS BUILD PHASE OF ram_env",UVM_HIGH)
endfunction
   
	
//-----------------  Add UVM connect() phase   -------------------//
function void ram_env::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info("RAM_ENV","THIS IS CONNECT PHASE OF ram_env",UVM_HIGH)
endfunction

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_env::end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	`uvm_info("RAM_ENV","THIS IS AN END OF ELABORATION OF ram_env",UVM_HIGH)
endfunction

   
//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_env::start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	`uvm_info("RAM_ENV","THIS IS START OF SIMULATION OF ram_env",UVM_HIGH)
endfunction


//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// With in raising ans dropping the objections add 100 delay in the run phase before printing

task ram_env::run_phase(uvm_phase phase);
	super.run();
    phase.raise_objection(this);
	#10;
	`uvm_info("RAM_ENV ","THIS IS RUN PHASE OF ram_env",UVM_HIGH)
    phase.drop_objection(this);

/////////////////////////// SET_DRAIN TIME ()
/*
uvm_objection objection;
super.run();
objection = phase.get_objection();
// $display("[p=]//%p, {d-}//%d",objection,objection);
objection.set_drain_time(this,20);
	`uvm_info("RAM_ENV","THIS IS RUN PHASE IN ENV",UVM_HIGH)
*/
endtask


//-----------------  Add UVM extract() phase   -------------------//
function void ram_env::extract_phase(uvm_phase phase);
	super.extract_phase(phase);
	`uvm_info("RAM_ENV","THIS IS EXTRACT PHASE OF ram_env",UVM_HIGH)
endfunction


   
//-----------------  Add UVM check() phase   -------------------//

function void ram_env::check_phase(uvm_phase phase);
	super.check_phase(phase);
	`uvm_info("RAM_ENV","THIS IS CHECK PHASE OF ram_env",UVM_HIGH)
endfunction


//-----------------  Add UVM report() phase   -------------------//
function void ram_env::report_phase(uvm_phase phase);
	super.report_phase(phase);
	`uvm_info("RAM_ENV","THIS IS REPORT PHASE OF ram_env",UVM_HIGH)
endfunction



   
  
   


