`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:13:07 11/05/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
input clk, rst,
input [31:0] in1, in2,
input [3:0] operation,
output reg [31:0] out,
output reg carryFlag,
output reg zeroFlag,
output reg signFlag
    );
	 
	 reg carry, carry_;
	 
always @(posedge clk or posedge rst) begin
		if(rst) begin
		  carryFlag <= 1'b0;
		end
		else if(operation == 4'b0000) begin
		  carryFlag <= carry;
		end
end
integer i;
always @(*)begin
		carry = 1'b0;
		carry_ = 1'b0;
		case(operation)
				4'd0:  begin   // add
					{carry_,out[30:0]}=in1[30:0]+in2[30:0];
					{carry,out[31]}=in1[31]+in2[31]+carry_;
					zeroFlag=(out==0)?1'b1:1'b0;
					signFlag=out[31];
				end
				
				4'd1:  begin   // comp
					out = (~in2) + 1;
					zeroFlag=(out==0)?1'b1:1'b0;
					signFlag=out[31];
				end
				
				4'd2:  begin	// and
					out = in1&in2;
					zeroFlag=(out==0)?1'b1:1'b0;
					signFlag=out[31];
				end
				
				4'd3:  begin	// xor
					out = in1 ^ in2;
					zeroFlag=(out==0)?1'b1:1'b0;
					signFlag=out[31];
				end
				
				4'd4:  begin	// shll
					out = in1 << in2;
					zeroFlag=(out==0)?1'b1:1'b0;
					signFlag=out[31];
				end
				
				4'd5:  begin	// shrl
					out = in1 >> in2;
					zeroFlag=(out==0)?1'b1:1'b0;
					signFlag=out[31];
				end
				
				4'd6:  begin	// shra
					out = in1 >>> in2;
					zeroFlag=(out==0)?1'b1:1'b0;
					signFlag=out[31];
				end
				
				4'd7:  begin	// diff
					for(i=31;i>=0;i=i-1)begin
						if(in1[i] != in2[i])begin
							out = i;
						end
					end
					zeroFlag = (out==0)?1'b1:1'b0;
					signFlag = out[31];
				end
				
				4'd8:  begin	// equal to zero
					out = in1;
					zeroFlag = (out==0)?1'b1:1'b0;
					signFlag = out[31];
				end
				
				default:  begin
					out = 32'd0;
					zeroFlag = 1'b0;
					signFlag = 1'b0;
				end
				
		endcase
end

endmodule
