/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_agent.sv

Description 	: 	Write agent class for Dual port RAM testbench
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_wr_agent from uvm_agent
class ram_wr_agent extends uvm_agent;

   // Factory Registration
	`uvm_component_utils(ram_wr_agent)

	//Declare the ram_wr_driver handle
	ram_wr_driver ram_drh;

	ram_wr_monitor ram_moh;

	//------------------------------------------
	// METHODS
	//------------------------------------------

	//Add all the UVM phases
	extern function new(string name = "ram_wr_agent",uvm_component parent);
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
		`uvm_info("RAISED = AGENT", $sformatf("%0d objection(s) raised from %s, total count is now %0d", 
      		           count, source_obj.get_full_name, objection.get_objection_total(this)), UVM_NONE)
         //description is empty
         //`uvm_info("raised", $sformatf("description=%s", description), UVM_HIGH)
 	 endfunction : raised

	
	virtual task all_dropped (uvm_objection objection, 
                            	  uvm_object source_obj,
                            	  string description, // 2nd argument of phase.drop_objection method
                            	  int count);
	
		`uvm_info("ALL DROPPED = AGENT", $sformatf("Last %0d objection(s) dropped from %s, total count is now %0d", 
      			count, source_obj.get_full_name, objection.get_objection_total(this)), UVM_NONE)
    	//	#50;
  	endtask : all_dropped
*/

endclass


//-----------------  constructor new method  -------------------//

function ram_wr_agent::new(string name="ram_wr_agent",uvm_component parent);
	super.new(name,parent);
endfunction

   
// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//       Hint : `uvm_info(“RAM_AGENT”,”This is Build Phase ”, UVM_HIGH) 
    
//-----------------  Add UVM build() phase   -------------------//

function void ram_wr_agent::build_phase(uvm_phase phase);	
	super.build_phase(phase);
	// Create the instance of driver in the build phase
	ram_drh=ram_wr_driver::type_id::create("ram_drh",this);

	ram_moh=ram_wr_monitor::type_id::create("ram_moh",this);

	`uvm_info("RAM_WR_AGENT","THIS IS BUILD IN AGENT",UVM_HIGH)
endfunction

//-----------------  Add UVM connect() phase   -------------------//
  
function void ram_wr_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // Print the info message
    `uvm_info("RAM_WR_AGENT","THIS IS CONNECT PHASE IN AGENT",UVM_HIGH);
endfunction

//-----------------  Add UVM end_of_elaboration() phase   -------------------//

function void ram_wr_agent::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    // Print the info message
    `uvm_info("RAM_WR_AGENT","THIS IS END_OF_ELABORATION PHASE IN AGENT",UVM_HIGH);
 endfunction
 
//-----------------  Add UVM start_of_simulation() phase   -------------------//

function void ram_wr_agent::start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    // Print the info message
    `uvm_info("RAM_WR_AGENT","THIS IS START_OF_SIMULATION PHASE IN AGENT",UVM_HIGH);
endfunction

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// With in raising ans dropping the objections add 100 delay in the run phase before printing
task ram_wr_agent::run_phase(uvm_phase phase);
    phase.raise_objection(this);
    // Print the info message
    #100;
	`uvm_info("RAM_WR_AGENT","This is Run Phase",UVM_HIGH)
    phase.drop_objection(this);


/*
uvm_objection objection;
super.run();
objection = phase.get_objection();
// $display("[p=]//%p, {d-}//%d",objection,objection);
if( objection != null)
`uvm_info("DRAIN", "Setting drain time of 10", UVM_NONE)
objection.set_drain_time(this,50);
	`uvm_info("RAM_WR_AGENT","THIS IS RUN PHASE IN AGENT",UVM_HIGH) 


// phase.phase_done.set_drain_time(this,50);
*/
endtask

//-----------------  Add UVM extract() phase   -------------------//
function void ram_wr_agent::extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    //Print the info message
   `uvm_info("RAM_WR_AGENT","This is Extract Phase",UVM_HIGH)
 endfunction
 
 
//-----------------  Add UVM check() phase   -------------------//
function void ram_wr_agent::check_phase(uvm_phase phase);
    super.check_phase(phase);
    //Print the info message
    `uvm_info("RAM_WR_AGENT","This is Check Phase",UVM_HIGH)
endfunction

//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_agent::report_phase(uvm_phase phase);
    super.report_phase(phase);
    //Print the info message
   `uvm_info("RAM_WR_AGENT","This is Report Phase",UVM_HIGH)
endfunction




