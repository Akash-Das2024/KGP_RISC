`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:43:26 11/08/2022 
// Design Name: 
// Module Name:    mux2x1_32bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux2x1_32bit(
input clk,rst,
input [31:0] a,b,
input select,
output reg [31:0] out
    );
always @(*)begin
		if(select)begin
				out = a;
		end
		else begin
				out = b;
		end
end

endmodule
