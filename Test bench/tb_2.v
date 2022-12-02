`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:58:13 11/09/2022
// Design Name:   miniRISC
// Module Name:   /home/ad-2001/Desktop/Academic/Assignments-5thsem/COA-lab assgn 6/KGP_miniRISC/tb_2.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: miniRISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_2;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] out1;
	wire [31:0] out2;

	// Instantiate the Unit Under Test (UUT)
	miniRISC uut (
		.clk(clk), 
		.rst(rst), 
		.out1(out1), 
		.out2(out2)
	);
	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#5 rst = 0;

		// Wait 100 ns for global reset to finish
		#3000 $finish;
        
		// Add stimulus here

	end
      
endmodule

