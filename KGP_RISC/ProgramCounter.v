`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:14:39 11/05/2022 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(
input clk,
input rst,
input [31:0] PC,
output reg [31:0] NPC
    );
	 
	 always@(posedge clk or posedge rst)
	 begin
		if(rst)begin
			NPC <= 32'd0;
		end
		else begin 
			NPC <= PC;
		end
	end

endmodule
