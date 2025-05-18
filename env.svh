class dff_env extends uvm_env;
  // UVM factory reg
  `uvm_component_utils(dff_env)
  
  // Declarations
  dff_scoreboard scoreboard;
  dff_agent agent;

  // Default constructor
  function new(string name = "env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("Environment Class", "Constructor", UVM_NONE)
  endfunction

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    scoreboard = dff_scoreboard::type_id::create("scoreboard", this);
    agent = dff_agent::type_id::create("agent", this);
  endfunction

  // Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.item_collected_port.connect(scoreboard.item_collected_export);
  endfunction
endclass

