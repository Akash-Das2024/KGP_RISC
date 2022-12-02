`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:18 11/08/2022 
// Design Name: 
// Module Name:    registerFile 
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
module registerFile(
input clk,rst,
input [4:0] rs,
input [4:0] rt,
input [4:0] wad, // register address where data to be written if written
input [31:0] wd, // write data (data to be stored)
input write_reg, // control signal for data write information
output [31:0] rs_data,
output [31:0] rt_data
    );
	 
	reg [31:0] RegisterFile[0:31];

assign rs_data = RegisterFile[rs];
assign rt_data = RegisterFile[rt];

always @(posedge clk or posedge rst)begin
	if(rst)begin
		RegisterFile[0] <= 0;
		RegisterFile[1] <= 0;
		RegisterFile[2] <= 0;
		RegisterFile[3] <= 0;
		RegisterFile[4] <= 0;
		RegisterFile[5] <= 0;
		RegisterFile[6] <= 0;
		RegisterFile[7] <= 0;
		RegisterFile[8] <= 0;
		RegisterFile[9] <= 0;
		RegisterFile[10] <= 0;
		RegisterFile[11] <= 0;
		RegisterFile[12] <= 0;
		RegisterFile[13] <= 0;
		RegisterFile[14] <= 0;
		RegisterFile[15] <= 0;
		RegisterFile[16] <= 0;
		RegisterFile[17] <= 0;
		RegisterFile[18] <= 0;
		RegisterFile[19] <= 0;
		RegisterFile[20] <= 0;
		RegisterFile[21] <= 0;
		RegisterFile[22] <= 0;
		RegisterFile[23] <= 0;
		RegisterFile[24] <= 0;
		RegisterFile[25] <= 0;
		RegisterFile[26] <= 0;
		RegisterFile[27] <= 0;
		RegisterFile[28] <= 0;
		RegisterFile[29] <= 0;
		RegisterFile[30] <= 0;
		RegisterFile[31] <= 0;
	end
	else if(write_reg)
		RegisterFile[wad] <= wd;
end
	
endmodule
