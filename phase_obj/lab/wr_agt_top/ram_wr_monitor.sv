class ram_wr_monitor extends uvm_monitor;

   // Factory Registration
   	`uvm_component_utils(ram_wr_monitor)

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Add all the UVM phases:
	extern function new(string name = "ram_wr_monitor",uvm_component parent);
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
		`uvm_info("RAISED = MONITOR", $sformatf("0%d objection(s) raised from %s, total count is now %0d", 
      		           count, source_obj.get_full_name, objection.get_objection_total(this)), UVM_NONE)
         //description is empty
         //`uvm_info("raised", $sformatf("description=%s", description), UVM_HIGH)
 	endfunction : raised

	virtual task all_dropped (uvm_objection objection, 
                            	  uvm_object source_obj,
                            	  string description, // 2nd argument of phase.drop_objection method
                            	  int count);
	
		`uvm_info("ALL DROPPED = MONITOR", $sformatf("Last %0d objection(s) dropped from %s, total count is now %0d", 
      			   count, source_obj.get_full_name, objection.get_objection_total(this)), UVM_NONE)
    	//	#50;
  	endtask : all_dropped
*/

endclass


//-----------------  constructor new method  -------------------//
//Add code for new()
function ram_wr_monitor::new(string name="ram_wr_monitor",uvm_component parent);	
	super.new(name,parent);
endfunction 

// Add body for all UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//       Hint : `uvm_info(“RAM_MONITOR”,”This is Build Phase ”, UVM_HIGH)   

//-----------------  Add UVM build() phase   -------------------//
     
function void ram_wr_monitor:: build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("RAM_MONITOR","THIS IS BUILD PHASE IN MONITOR",UVM_HIGH)
endfunction

//-----------------  Add UVM connect() phase   -------------------//
     
function void ram_wr_monitor:: connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info("RAM_MONITOR","THIS IS CONNECT PHASE IN MONITOR",UVM_HIGH)
endfunction

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
     
function void ram_wr_monitor:: end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	`uvm_info("RAM_MONITOR","THIS IS END_OF_ELABORATION PHASE IN MONITOR",UVM_HIGH)
endfunction

//-----------------  Add UVM start_of_simulation() phase   -------------------//
     
 function void ram_wr_monitor:: start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	`uvm_info("RAM_MONITOR","THIS IS START_OF_SIMULATION PHASE IN MONITOR",UVM_HIGH)
endfunction



//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// With in raising ans dropping the objections add 10 delay in the run phase before printing
task ram_wr_monitor:: run_phase(uvm_phase phase);
	super.run();
    phase.raise_objection(this);
	#100;
	`uvm_info("RAM_MONITOR","THIS IS RUN PHASE IN MONITOR",UVM_HIGH)
   phase.drop_objection(this);

/*

/////////////////////////// SET_DRAIN TIME ()

uvm_objection objection;
super.run();
objection = phase.get_objection();
objection.set_drain_time(this,1000);
	`uvm_info("RAM_MONITOR","THIS IS RUN PHASE IN MONITOR",UVM_HIGH)

*/

endtask

//-----------------  Add UVM extract() phase   -------------------//

function void ram_wr_monitor:: extract_phase(uvm_phase phase);
	super.extract_phase(phase);
	`uvm_info("RAM_MONITOR","THIS IS EXTRACT PHASE IN MONITOR",UVM_HIGH)
endfunction


   
//-----------------  Add UVM check() phase   -------------------//

function void ram_wr_monitor::check_phase(uvm_phase phase);
	super.check_phase(phase);
	`uvm_info("RAM_MONITOR","THIS IS CHECK PHASE IN MONITOR",UVM_HIGH)
endfunction


//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_monitor::report_phase(uvm_phase phase);
	super.report_phase(phase);
	`uvm_info("RAM_MONITOR","THIS IS REPORT PHASE IN MONITOR",UVM_HIGH)
endfunction




