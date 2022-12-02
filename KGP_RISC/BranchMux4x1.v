`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:08 11/08/2022 
// Design Name: 
// Module Name:    BranchMux4x1 
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
module BranchMux4x1(
input [1:0] instr_select,
input carryFlag, zeroFlag, signFlag,
input [5:0] opcode,
input [31:0] pc, rs_data, imm2, label,
output reg [31:0] npc
    );
always @(*) begin
		case(instr_select)
			2'b00:begin
				npc = pc + 1;
			end
			2'b01:begin
				if(opcode == 6'b010011)begin
					if(signFlag)
						npc = imm2;
					else
						npc = pc + 1;
				end
				if(opcode == 6'b010100)begin
					if(zeroFlag)
						npc = imm2;
					else 
						npc = pc + 1;
				end
				if(opcode == 6'b010101)begin
					if(~zeroFlag)
						npc = imm2;
					else 
						npc = pc + 1;
				end
			end
			2'b10:begin
				if(opcode == 6'b100000)begin
					npc = label;
				end
				else if(opcode == 6'b100001)begin
					npc = label;
				end
				else if(opcode == 6'b100010)begin
					if(carryFlag)
						npc = label;
					else
						npc = pc + 1;
				end
				else if(opcode == 6'b100011)begin
					if(~carryFlag)
						npc = label;
					else
						npc = pc + 1;
				end
			end
			2'b11:begin
				npc = rs_data;
			end
		endcase
		 
end

endmodule
