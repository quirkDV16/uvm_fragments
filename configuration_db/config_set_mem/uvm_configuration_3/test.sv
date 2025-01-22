////////////////////////////////////////////////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////s           www.testbench.in           s////
////s                                      s////
////s              UVM Tutorial            s////
////s                                      s////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////////////////////////////////////////////////

class test1 extends uvm_test;

   `uvm_component_utils(test1)
    env t_env;
 
    function new (string name="test1", uvm_component parent=null);
        super.new (name, parent);
        print_config_matches = 1;
        //t_env.ag1.drv.int_cfg
        //t_env.ag1.mon.int_cfg
        set_config_int("*.ag1.*","int_cfg",32);

        //t_env.ag2.drv
        set_config_int("t_env.ag2.drv","int_cfg",32);

        //t_env.ag2.mon
        set_config_int("t_env.ag2.mon","int_cfg",32);

        //t_env.ag1.mon.str_cfg
        //t_env.ag2.mon.str_cfg
        //t_env.ag1.drv.str_cfg
        //t_env.ag2.drv.str_cfg
        set_config_string("*.ag?.*","str_cfg","pars");

        //t_env.str_cfg
        set_config_string("t_env","str_cfg","abcd");
        t_env = new("t_env",this);
    endfunction : new 


    function void end_of_elaboration();
        print();
        print_config_settings("",this,1);
    endfunction : end_of_elaboration
 
    task run ();
        #1000;
        global_stop_request();
    endtask : run


endclass

