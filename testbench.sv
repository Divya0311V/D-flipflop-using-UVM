//UVM package
`include "uvm_macros.svh"
import uvm_pkg::*;

//`include "files.svh"

//Files
`include "interface.svh"
`include "sequence_item.svh"
`include "sequence.svh"
`include "sequencer.svh"
`include "monitor.svh"
`include "driver.svh"
`include "agent.svh"
`include "scoreboard.svh"
`include "env.svh"
`include "test.svh"

//Declaration
module dff_top_tb;
  logic clk;
  
//Instantiate 
  dff_interf intf(.clk(clk));

// Connect the DUT 
  dff dut_inst (
    .clk (intf.clk),
    .rst (intf.rst),
    .din (intf.din),
    .dout(intf.dout)
  );

//Connecting virtual interface 
  initial begin
    //driver -- set here, get in driver file
    uvm_config_db#(virtual dff_interf)::set(null, "uvm_test_top.env.agent.driver", "vif", intf);

    //monitor -- set here, get in monitor file
    uvm_config_db#(virtual dff_interf)::set(null, "uvm_test_top.env.agent.monitor", "vif", intf);
  end

  // Clk generation
  always #10 clk = ~clk;

  //  Stimulation block
  initial begin
    clk = 1;
    intf.rst = 1;
    intf.din = 1;
    #10 intf.rst = 0;
    repeat (10) begin
      #10 intf.din = $urandom % 2; 
    end
    #100 $finish;
  end


  // Display 
  initial begin
    $monitor($time, " clk = %b, rst = %b, din = %b, dout = %b", clk, intf.rst, intf.din, intf.dout);
  end

  // Run UVM test
  initial begin 
    run_test("dff_test");
  end

  // Dump waveform
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
