/*
Name: MD. Nazimuddowla
Desgin: 8-bit up-down asynchonus counter test bech
date: 12th December, 2107
*/


//	Module	//
module count;
  reg clk;
  reg up;
  reg down;
  reg rst;
  reg en;
  wire c_out;
  
  
// DUT Connections	//
  COUNT count (
    .clk(clk),
    .up(up),
    .down(down),
    .en(en),
    .rst(rst),
    .c_out(c_out)
  );
  
  
//	Clock Generation	//
  initial forever #10 clk = ~clk;
  initial forever #160 up = ~up;
  initial forever #40 down = ~down;
  initial forever #1000 en = ~en;
  
  initial begin
    clk = 0;
    up = 0;
    down = 0;
    en = 1;
    rst = 1;
    
    #30
    rst = 0;
    
  end
  
//	Simulation Time		//
  initial begin
    #5000
    $finish;
  end
  
  
//	Waveform	//
  initial begin
    $dumpfile ("dump.vcd");
    $dumpvars;
  end
  
endmodule