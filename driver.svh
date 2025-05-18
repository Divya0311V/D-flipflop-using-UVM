import uvm_pkg::*;

class dff_driver extends uvm_driver#(dff_seq_item);
  // UVM factory reg
  `uvm_component_utils(dff_driver)
  
  virtual dff_interf intf;
  dff_seq_item tx;
  
  // Default constructor
  function new(string name = "dff_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("driver class", "constructor", UVM_NONE)
  endfunction
   
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // virtual interface
    if (!uvm_config_db#(virtual dff_interf)::get(this, "", "vif", intf))
      `uvm_fatal("NOVIF", "Virtual interface must be set for: dff_driver");
  endfunction
  
  // Run phase
  task run_phase(uvm_phase phase);
    forever begin
      `uvm_info("driver Class", "run_phase", UVM_NONE)
      seq_item_port.get_next_item(tx);
      drive(tx);
      seq_item_port.item_done();
    end
  endtask
  

  task drive(dff_seq_item tx);
    @(posedge intf.clk)
    intf.rst <= tx.rst;
    intf.din <= tx.din;

  endtask  
endclass
