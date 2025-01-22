///////////////////////////////////////////////////////////////////////////////
/////////////////////////////   BASE: MY_CLASS   //////////////////////////////
///////////////////////////////////////////////////////////////////////////////	

class my_test extends uvm_test;

`uvm_component_utils(my_test)

my_env env_h;

//int dut_int = 8;
rand bit[13:0]ctrl_t;

constraint c1{	ctrl_t[6:0] inside{[0:7]};}
constraint c2{	ctrl_t[7]==0;
	//	ctrl_t[31:14]==0;
		ctrl_t[8]==1;}
constraint c3{	ctrl_t[10:9]==2'b01;}
constraint c4{	ctrl_t[11]==1;}
constraint c5{	ctrl_t[13:12]==2'b11;}

extern function new(string name = "my_test",uvm_component parent);
extern function void build_phase(uvm_phase phase);

endclass

function my_test::new(string name = "my_test",uvm_component parent);
	super.new(name,parent);
endfunction

//////////////////// BUILD PHASE  
function void my_test::build_phase(uvm_phase phase);
super.build_phase(phase);
	`uvm_info("my_test","THIS IS BUILD PHASE IN TEST",UVM_LOW)
	
	env_h = my_env::type_id::create("env_h",this);
//uvm_config_db #(int)::set(this,"*","int",dut_int);
//uvm_config_db#(int)::wait_modified(this,"","dut_int");		
endfunction


///////////////////////////////////////////////////////////////////////////////
/////////////////////////////   EXTENDED CLASS   //////////////////////////////
///////////////////////////////////////////////////////////////////////////////	

class ext_test extends my_test;
`uvm_component_utils(ext_test)

extern function new(string name="ext_test",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
endclass

function ext_test::new(string name="ext_test",uvm_component parent);
	super.new(name,parent);
endfunction

//////////////////// BUILD PHASE
function void ext_test::build_phase(uvm_phase phase);
//uvm_config_db #(bit[31:0])::set(this,"env_h.agt_h","bit[31:0]",ctrl_t);

	super.build_phase(phase);
endfunction

//////////////////// RUN PHASE
task ext_test::run_phase(uvm_phase phase);
phase.raise_objection(this);
repeat(5)
	begin
		#1000;
		//this.randomize();
		void'(randomize(ctrl_t));
		//$display("this is test control_reg==%b",ctrl_t);
		uvm_config_db #(bit[31:0])::set(this,"*","bit[31:0]",ctrl_t);
		$display("TST_CLASS ::: control_reg value == %b ::: %0d",ctrl_t,ctrl_t);
 	 	end

phase.drop_objection(this);
endtask

