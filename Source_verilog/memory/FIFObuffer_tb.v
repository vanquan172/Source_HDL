
`timescale 1ns / 1ps

module FIFObuffer_tb;

 // Inputs

 reg Clk;

 reg [31:0] dataIn;

 reg RD;

 reg WR;

 reg EN;

 reg Rst;

 // Outputs

 wire [31:0] dataOut;

 wire EMPTY;

 wire FULL;

 // Instantiate the Unit Under Test (UUT)

 FIFObuffer uut (

                  .Clk(Clk), 

                  .dataIn(dataIn), 

                  .RD(RD), 

                  .WR(WR), 

                  .EN(EN), 

                  .dataOut(dataOut), 

                  .Rst(Rst), 

                  .EMPTY(EMPTY), 

                  .FULL(FULL)

                  );

 initial begin

  // Initialize Inputs

  Clk  = 1'b0;

  dataIn  = 32'h0;

  RD  = 1'b0;

  WR  = 1'b0;

  EN  = 1'b0;

  Rst  = 1'b1;

  // Wait 100 ns for global reset to finish

  #20;        

  // Add stimulus here

  EN  = 1'b1;

  Rst  = 1'b0;

  Rst  = 1'b0;

  WR  = 1'b1;

  dataIn  = 32'h0;

  #10;

  dataIn  = 32'h1;

  #10;

  dataIn  = 32'h2;

  #10;

  dataIn  = 32'h3;

  #10;

  dataIn  = 32'h4;

  #10;

  dataIn  = 32'h5;

  #10;

  dataIn  = 32'h6;

  #10;

  dataIn  = 32'h7;

  #10;
    
  dataIn  = 32'h8;

  #10;


  WR = 1'b0;

  RD = 1'b1;  
  #100;
  $stop ; 

 end 

   always #5 Clk = ~Clk;    

endmodule