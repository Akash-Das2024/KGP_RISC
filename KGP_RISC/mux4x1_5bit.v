`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:57 11/08/2022 
// Design Name: 
// Module Name:    mux4x1 
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
module mux4x1(
input clk, rst,
input [4:0] a,b,c,d,
input [1:0] select,
output reg [4:0] out
    );
always @(a or b or c or d or select) begin
	case(select)
		2'b00:begin
			out = a;
		end
		2'b01:begin
			out = b;
		end
		2'b10:begin
			out = c;
		end
		2'b11:begin
			out = d;
		end
	endcase
end

endmodule
