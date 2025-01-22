IFILES = my_agent.sv my_env.sv my_test.sv top.sv
FILES = top.sv 
UVM_FLAGS = +incdir+/home/cad/eda/Questa_2019/questasim/uvm-1.1d/../verilog_src/uvm-1.1d/src/uvm_pkg.sv
#VCS_FLAGS = -sverilog +plusarg_save -timescale=1ns/1ns


questa: ${FILES} ${IFILES}
	@if [ ! -e ${UVM_HOME}/src/uvm_pkg.sv ];then \
	 echo "*******************************************************";\
	# echo "Environemnt varible UVM_HOME is not set or points to incorrect path"; \
	 echo "*******************************************************";\
	 fi 
	qverilog ${UVM_FLAGS} +incdir+. ${FILES} -R  +UVM_TESTNAME=my_test #+UVM_CONFIG_DB_TRACE


