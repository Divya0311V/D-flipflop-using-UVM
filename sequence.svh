import uvm_pkg::*;

class dff_seq extends uvm_sequence #(dff_seq_item);
  
  // UVM factory registration
  `uvm_object_utils(dff_seq)
  
  dff_seq_item tx;
  
  // Default constructor
  function new(string name = "dff_seq");
    super.new(name);
    `uvm_info("sequence Class", "constructor", UVM_NONE)
  endfunction
  

  task body();
    repeat(5) begin
      tx = dff_seq_item::type_id::create("tx", null);
      wait_for_grant();
      assert(tx.randomize()) else `uvm_error("SEQ", "Randomization failed");
      send_request(tx);
      wait_for_item_done();
    end
  endtask
endclass
