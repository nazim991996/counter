/*
Name: MD. Nazimuddowla
Desgin: 8-bit up-down asynchonus counter
date: 12th December, 2107
*/


//	Module	//

module COUNT (
  clk,
  up,
  down,
  rst,
  en,
  c_out
);
  
  
//	Outputs	//
  output [7:0] c_out;
  
//	Input	//
  input clk;
  input up;
  input down;
  input rst;
  input en;
  
//	Internal	//
  reg [7:0] store;
  
  
// Operation	//
  always @(posedge clk) begin
    if (rst) begin
      store = 8'b0;
    end
    else if (en) begin
      if (up) begin
        if (store == 11111111) begin
          store = 8'b0;
        end
        else begin
          store = store + 1;
        end
        end
      else if (down) begin
        store = store - 1;
      end
    end
  end
  
  assign c_out = store;
  
  
endmodule