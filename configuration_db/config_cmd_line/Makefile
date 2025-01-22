#Makefile for UVM RESOURCE_DB

SVTB1= ./top.sv
INC= +incdir+./my_test.sv +incdir+./my_env.sv +incdir+./my_agent.sv
SVTB2 = ./test_pkg.sv

help:
	@echo =================================================================================
	@echo "! USAGE   	--  make target                             				!"
	@echo "! clean   	=>  clean the earlier log and intermediate files.       	!"
	@echo "! sv_cmp    	=>  Create library and compile the code.                   	!"
	@echo "! run_test	=>  clean, compile & run the simulation for sub-run & user-defined phase.		!" 
	@echo =================================================================================
 
sv_cmp:
	vcs -l vcs.log -timescale=1ns/1ns -sverilog -ntb_opts uvm -debug_access+all -full64 $(INC) $(SVTB2) $(SVTB1) +define+UVM_REPORT_DISABLE_FILE_LINE 
	      
run_test:	clean  sv_cmp
	./simv -a test.log +ntb_random_seed_automatic +uvm_set_config_int=\*,int,8 #+UVM_TESTNAME=test
	
clean:
	rm -rf simv* csrc* *.tmp *.vdb *.key *.log *hdrs.h urgReport* novas* vdCov*
	clear
