class dff_scoreboard extends uvm_scoreboard;
  // UVM factory reg
  `uvm_component_utils(dff_scoreboard);
  uvm_analysis_imp#(dff_seq_item,dff_scoreboard) item_collected_export;
  
  dff_seq_item tx_q[$];
  
  //constructor
  function new(string name="scoreboard",uvm_component parent);
    super.new(name,parent);
    `uvm_info("scoreboard class","constructor",UVM_NONE)
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export=new("item_collected_export",this);
  endfunction
  
  //virtual function
  virtual function void write(dff_seq_item tx);
    $display("Pkt received");
    tx_q.push_back(tx);
  endfunction
  
endclass
