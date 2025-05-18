class dff_seqr extends uvm_sequencer#(dff_seq_item);
  `uvm_component_utils(dff_seqr)// UVM factory reg
  
  //Default constructor
  function new(string name = "dff_sequencer",uvm_component parent);
    super.new(name,parent);
    `uvm_info("sequencer Class","constructor",UVM_NONE)
  endfunction
  
endclass
