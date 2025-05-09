`timescale 1ns / 1ps

module TestBench();
  reg R;
  reg clk_0;
  wire A, B, C, D, E, F, G;

EulerTotient DUT0(R, clk_0, A, B, C, D, E, F, G);

  always begin
    clk_0 = 0;
    forever #100 clk_0 = ~clk_0;
  end

  always begin
    clk_0 = 0;
    forever #1000 clk_0 = ~clk_0;
  end

  always @(posedge clk_0) begin
	  R=0;
	  #2000
	  R=1;
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 1
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 1
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 1
	  R=0;
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 1
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 2
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 2
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 4
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 2
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 6
	  #2000
	  $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G); // 4
    #2000
	  /*add more tests as needed*/

      $finish;
  end
endmodule