 class dff_seq_item extends uvm_sequence_item; 
  // UVM factory reg 
  `uvm_object_utils(dff_seq_item)
  
  rand logic rst;
  rand logic din;
  rand logic dout;
  
  //default constructor 
  function new(string name = "dff_seq_item");
    super.new(name);
    `uvm_info("sequence item class", "constructor", UVM_NONE)
  endfunction
  

  constraint wr_rd_c { rst != 1; }; 
  
endclass
