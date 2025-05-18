//module declaration
module dff(
  //port declaration
  input clk,
  input rst,
  input din,
  output reg dout
);
  //clk generation and rst generation 
  //logic implementation
  always @(posedge clk or negedge clk ) begin 
    if (rst) 
      begin
        assign dout = 0;

      end
    else 
      begin 
        assign dout = din;
      end
  end
endmodule 
