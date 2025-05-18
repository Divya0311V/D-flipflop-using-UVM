# D-flipflop-using-UVM
SystemVerilog UVM testbench for verifying a D flip-flop design

# D Flip-Flop Verification using UVM

## About the D Flip-Flop
A D Flip-Flop (DFF) is a fundamental sequential digital circuit that captures the value of the input (D) at a triggering clock edge (usually the rising edge) and holds this value stable at the output (Q) until the next clock event. It is widely used for data storage, synchronization, and timing applications in digital systems.

This project verifies a positive-edge triggered D Flip-Flop using a UVM-based testbench, ensuring correct operation under various input scenarios.

## Project Structure
- **RTL Design**
  - `dff.sv` (assumed RTL design file)
  
- **UVM Components** (all `.svh` files)
  - `interface.svh` — Defines the interface for DFF signals
  - `agent.svh` — Contains the agent encapsulating driver, monitor, and sequencer
  - `driver.svh` — Drives stimulus to the DFF inputs
  - `monitor.svh` — Observes DFF outputs and inputs for checking
  - `sequencer.svh` — Generates sequences of input transactions
  - `sequence.svh` — Defines stimulus sequences for DFF inputs
  - `sequence_item.svh` — Defines the transaction item for sequences
  - `scoreboard.svh` — Compares expected and actual DFF outputs
  - `env.svh` — UVM environment integrating all components
  - `test.svh` — Test configuration and testcases
  
- **Top-level Testbench**
  - `testbench.sv` — Instantiates DUT and UVM environment, runs tests
