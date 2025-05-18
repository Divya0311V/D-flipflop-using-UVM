class dff_agent extends uvm_agent;
  // UVM factory reg
  `uvm_component_utils(dff_agent)
  
  // Declaration
  dff_driver driver;
  dff_seqr seqr;
  dff_monitor monitor;
  
  // Default constructor 
  function new(string name = "dff_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("Agent Class", "Constructor", UVM_NONE);
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    driver  = dff_driver::type_id::create("driver", this);
    seqr    = dff_seqr::type_id::create("sequencer", this);
    monitor = dff_monitor::type_id::create("monitor", this);
  endfunction
  
  // Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Agent Class", "Connect Phase", UVM_NONE);
    driver.seq_item_port.connect(seqr.seq_item_export);
    // Connects the sequencer to the driver
  endfunction
endclass
