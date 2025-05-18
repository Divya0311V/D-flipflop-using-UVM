class dff_monitor extends uvm_monitor;
  // UVM factory reg
  `uvm_component_utils(dff_monitor)
  
  virtual dff_interf intf;
  uvm_analysis_port #(dff_seq_item) item_collected_port;
  dff_seq_item tx;

  
   //Default constructor
  function new(string name = "dff_monitor",uvm_component parent);
     super.new(name,parent);
     `uvm_info("monitor class", "constructor", UVM_NONE)
  endfunction
  
  //Build phase
  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
           item_collected_port = new("item_collected_port", this);
    
    // virtual interface
    if(!uvm_config_db#(virtual dff_interf	)::get(this, "", "vif", intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction
      
  task run_phase(uvm_phase phase);
    tx = dff_seq_item::type_id::create("tx");
    wait(!intf.rst)
  
    @(posedge intf.clk)
    tx.rst = logic'(intf.rst); 
    tx.din = intf.din;
    tx.dout = intf.dout;

    item_collected_port.write(tx); 
  endtask

  
endclass
