`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    00:35:17 11/05/2022
// Design Name:
// Module Name:    decoder
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
module decoder(
input [31:0] instruction,
output reg [5:0] opcode,
output reg [4:0] rs, rt,
output reg [31:0] label, imm1, imm2
    );
always @(*)begin
		opcode <= instruction[31:26];
		rs <= instruction[25:21];
		rt <= instruction[20:16];
		if(instruction[31:26] == 6'b001110 || instruction[31:26] == 6'b001111)begin // store and load word
				imm1[15:0] <= instruction[15:0];
				imm1[31:16] <= {16{instruction[15]}}; // sign extension for lw and sw
		end
		else begin
				imm1[15:0] <= instruction[15:0];  // shift value in r-type instruction
				imm1[31:16] <= 16'd0;
		end

		if(instruction[31:26] == 6'b010000 || instruction[31:26] == 6'b010001)begin // addi and comi
				imm2[20:0] <= instruction[20:0];
				imm2[31:21] <= {11{instruction[20]}};
		end
		else begin
				imm2[20:0] <= instruction[20:0];  // branch L
				imm2[31:21] <= 11'd0;
		end
		label[25:0] <= instruction[25:0];  // label for jump
		label[31:26] <= 6'd0;
end


endmodule

////////////////////////////////////////////////////////////////
//
// input: instruction which is fetched by the instruction Fetch
// output: are the decoded all the required data needed by the
// other module such as ALU (needs rs, rt and imm1, imm2, opcode)
// MEMORY (needs output of ALU which needs this decoding)
// and also BRANCHING needs imm2 and label as the address
//
////////////////////////////////////////////////////////////////