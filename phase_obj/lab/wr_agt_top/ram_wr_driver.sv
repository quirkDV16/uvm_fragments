/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_driver.sv

Description		:	Write Deriver class for Dual Port RAM
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_wr_driver from uvm_driver

class ram_wr_driver extends uvm_driver;

   // Factory Registration
   	`uvm_component_utils(ram_wr_driver)

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Add all the UVM phases:
	extern function new(string name = "ram_wr_driver",uvm_component parent);
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
                                      string description = "driv_r_obj", 
                                      int count);
		`uvm_info("RAISED = DRIVER", $sformatf("%0d objection(s) raised from %s, total count is now %0d", 
      		           count, source_obj.get_full_name, objection.get_objection_total(this)), UVM_NONE)
         //description is empty
         `uvm_info("descrip", $sformatf("description=%s", description), UVM_NONE)
 	endfunction : raised

	virtual task all_dropped (uvm_objection objection, 
                            	  uvm_object source_obj,
                            	  string description = "driv_d_obj", // 2nd argument of phase.drop_objection method
                            	  int count);
	
		`uvm_info("ALL DROPPED = DRIVER", $sformatf("Last 0%d objection(s) dropped from %s, total count is now %0d", 
      			count, source_obj.get_full_name, objection.get_objection_total(this)), UVM_NONE)
    	//	#50;
  	endtask : all_dropped
*/

endclass


//-----------------  constructor new method  -------------------//
//Add code for new()
function ram_wr_driver::new(string name="ram_wr_driver",uvm_component parent);	
	super.new(name,parent);
endfunction 

// Add body for all UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//       Hint : `uvm_info(“RAM_DRIVER”,”This is Build Phase ”, UVM_HIGH)   

//-----------------  Add UVM build() phase   -------------------//
     
function void ram_wr_driver:: build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("RAM_DRIVER","THIS IS BUILD PHASE IN DRIVER",UVM_HIGH)
endfunction

//-----------------  Add UVM connect() phase   -------------------//
     
function void ram_wr_driver:: connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info("RAM_DRIVER","THIS IS CONNECT PHASE IN DRIVER",UVM_HIGH)
endfunction

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
     
function void ram_wr_driver:: end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	`uvm_info("RAM_DRIVER","THIS IS END_OF_ELABORATION PHASE IN DRIVER",UVM_HIGH)
endfunction

//-----------------  Add UVM start_of_simulation() phase   -------------------//
     
 function void ram_wr_driver:: start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	`uvm_info("RAM_DRIVER","THIS IS START_OF_SIMULATION PHASE IN DRIVER",UVM_HIGH)
endfunction



//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// With in raising ans dropping the objections add 10 delay in the run phase before printing
task ram_wr_driver:: run_phase(uvm_phase phase);
	super.run();
    phase.raise_objection(this);
	#10;
	`uvm_info("RAM_DRIVER","THIS IS RUNPHASE IN DRIVER",UVM_HIGH)
    phase.drop_objection(this);
endtask


//-----------------  Add UVM extract() phase   -------------------//

function void ram_wr_driver:: extract_phase(uvm_phase phase);
	super.extract_phase(phase);
	`uvm_info("RAM_DRIVER","THIS IS EXTRACT PHASE IN DRIVER",UVM_HIGH)
endfunction


   
//-----------------  Add UVM check() phase   -------------------//

function void ram_wr_driver::check_phase(uvm_phase phase);
	super.check_phase(phase);
	`uvm_info("RAM_DRIVER","THIS IS CHECK PHASE IN DRIVER",UVM_HIGH)
endfunction


//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_driver::report_phase(uvm_phase phase);
	super.report_phase(phase);
	`uvm_info("RAM_DRIVER","THIS IS REPORT PHASE IN DRIVER",UVM_HIGH)
endfunction



  
   


