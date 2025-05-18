class dff_test extends uvm_test;
  // UVM factory reg
  `uvm_component_utils(dff_test);
  
  //Declaration
  dff_env env;
  dff_seq seq;
  
  //Default constructor
  function new(string name = "test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("test class","constructor",UVM_NONE);
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = dff_env::type_id::create("env",this);
    seq = dff_seq::type_id::create("seq",this);
  endfunction
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction 
  
  //end_of_elaboration phase
  virtual function void end_of_elaboration();
    `uvm_info("test","constructor",UVM_NONE);
    print();
  endfunction
  
  //run phase
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.agent.seqr);
    phase.drop_objection(this);
  endtask
endclass
