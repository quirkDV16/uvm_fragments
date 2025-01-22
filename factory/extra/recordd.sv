import uvm_pkg::*;
`include "uvm_macros.svh"

typedef enum {BAD,GOOD}var1;
//typedef packed struct{string name;int sn;}var2;

class my_xtn extends uvm_sequence_item;
    rand bit [3:0]addr;
    rand bit [7:0]data;
//    rand var1 en_typ;
//    rand var2 det;
    string str;
    constraint valid_addr{addr inside {[2:13]};}
    constraint valid_data{data inside {[15:150]};}

    `uvm_object_utils_begin(my_xtn)
        `uvm_field_int(addr,UVM_ALL_ON)
        `uvm_field_int(data,UVM_DEFAULT)
//        `uvm_field_enum(var1,en_typ,UVM_DEFAULT)
//        `uvm_field_int(var2,det,UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "my_xtn");    
        super.new(name);
    endfunction
    
    virtual function void do_record( uvm_recorder recorder );
	super.do_record( recorder );
	`uvm_record_int( "data", data,1,UVM_DEC)
	`uvm_record_int( "addr", addr,1,UVM_DEC)
    endfunction: do_record

endclass




class my_subscriber extends uvm_component#(my_xtn);
	 `uvm_component_utils( my_subscriber )
  uvm_tr_database tr_db;
  uvm_tr_stream   tr_strm;
  uvm_recorder    rec;
 
  virtual function void build_phase( uvm_phase phase );
      super.build_phase( phase );
	tr_db   = uvm_coreservice_t::get().get_default_tr_database();
	tr_strm = tr_db.open_stream( "tr_strm" );
	rec     = tr_strm.open_recorder( "rec" );
    endfunction: build_phase
 
    function void write( my_xtn t );
	`uvm_info("write",$sformatf("rec is %b",rec.is_open),UVM_NONE);
  	t.record( rec );
    endfunction: write 

endclass


module xtn_test();
    my_xtn xtn;
      initial begin
        xtn = my_xtn::type_id::create();
        assert(xtn.randomize());
        xtn.print();
/*	xtn.record();
        $display("%s",xtn.sprint());
        xtn.str = $sformatf("%s",xtn.sprint());
        xtn.str = $psprintf("%s",xtn.sprint());
        $display("str = %s",xtn.str); */
      end
endmodule
