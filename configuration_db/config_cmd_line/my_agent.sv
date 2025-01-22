
// `define print_config
// `define print_config_with_audit
// `define check_config_usage

class my_agent extends uvm_agent;
//integer integ;

`uvm_component_utils(my_agent)

//`uvm_component_utils_begin(my_agent)
//`uvm_field_int(integ, UVM_DEFAULT)
//`uvm_component_utils_end

int local_dut;
//uvm_resource_pool h_pool;
extern function new(string name = "my_agent", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
endclass

function my_agent::new(string name = "my_agent", uvm_component parent = null);
super.new(name, parent);
//h_pool=new();
endfunction
     
  
function void my_agent::build_phase(uvm_phase phase);
super.build_phase(phase);

// uvm_component::print_config_matches = 1;

if(uvm_config_db#(int)::exists(this," ","int"))
	`uvm_info("CONFIG_EXISTS","was able find config handle",UVM_LOW)


if(!uvm_config_db#(uvm_bitstream_t)::get(this,"","int",local_dut))
	`uvm_warning("M_cfg","getting is failed")

//uvm_resource_db #(uvm_bitstream_t)::read_by_name(get_full_name(), "int", local_dut,this);
//	`uvm_fatal(get_type_name(), "read_by_name failed for resource in this scope");

$display("\n---value in agent dut handle--- %d\n",local_dut);

endfunction

function void my_agent::start_of_simulation_phase(uvm_phase phase);
//uvm_resource_db#(int)::dump();
//uvm_component::print_config_settings();
//uvm_component::print_config();
//uvm_resource_pool::dump_get_records();
//h_pool.spell_check("int");

`ifdef print_config
      `uvm_info(get_type_name(),"print_config", UVM_LOW)
      `uvm_info(get_type_name(),"------------", UVM_LOW)
      this.print_config();
`endif

`ifdef print_config_with_audit
      `uvm_info(get_type_name(),"print_config_with_audit", UVM_LOW)
      `uvm_info(get_type_name(),"-----------------------", UVM_LOW)
      this.print_config_with_audit(1);
`endif
    
`ifdef check_config_usage
      `uvm_info(get_type_name(),"check_config_usage", UVM_LOW)
      `uvm_info(get_type_name(),"------------------", UVM_LOW)
      this.check_config_usage();
`endif

//uvm_component:: print_config_matches=1;
//uvm_resources::uvm_resource_pool.dump_get_records();
uvm_resources.dump(.audit(1));
//uvm_resources.dump_get_records();
uvm_resources.spell_check("int");
//uvm_resources.find_unused_resources();

//uvm_root root=uvm_root::get();
//   root.check_config_usage(1);
endfunction


