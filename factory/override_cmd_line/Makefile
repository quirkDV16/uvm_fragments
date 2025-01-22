#Makefile for UVM FACTORY COMMAND LINE

SVTB1= ./top.sv
INC = +incdir+./test.sv
SVTB2 = ./test.sv

help:
	@echo =================================================================================
	@echo "! USAGE   	--  make target                             				!"
	@echo "! clean   	=>  clean the earlier log and intermediate files.       	!"
	@echo "! sv_cmp    	=>  Create library and compile the code.                   	!"
	@echo "! run_test	=>  clean, compile & run the simulation for sub-run & user-defined phase.		!" 
	@echo =================================================================================
 
sv_cmp:
	vcs -l vcs.log -timescale=1ns/1ns -sverilog -ntb_opts uvm -debug_access+all -full64 $(INC) $(SVTB1) $(SVTB2) +define+UVM_REPORT_DISABLE_FILE_LINE
	      
run_test:	clean  sv_cmp
	./simv -a reult2.log +ntb_random_seed_automatic +UVM_TESTNAME=test +uvm_set_inst_override=A,A_override,uvm_test_top.env.a3 #+uvm_set_inst_override=B,B_ovr,path1.b1 +uvm_set_type_override=A,A_ovr +uvm_set_type_override=B,B_override
	

# +uvm_set_inst_override=A,A_override,uvm_test_top.env.a3	//
# +uvm_set_inst_override=B,B_ovr,path1.b1			//
# +uvm_set_type_override=A,A_ovr				//
# +uvm_set_type_override=B,B_override				//


clean:
	rm -rf simv* csrc* *.tmp *.vdb *.key *hdrs.h urgReport* novas* vdCov*
	clear
