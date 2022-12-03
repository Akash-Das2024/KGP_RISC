`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    00:21:47 11/05/2022
// Design Name:
// Module Name:    InstructionFetch
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
module InstructionFetch(
input clk,
input rst,
input [31:0] PC,
output [31:0] instruction
    );

wire [9:0] address;

assign address = PC[9:0];

InstructionMemory IM (
  .clka(clk), // input clka
  .rsta(rst), // input rsta
  .ena(1), // input ena
  .wea(0), // input [0 : 0] wea
  .addra(address), // input [9 : 0] addra
  .dina(), // input [31 : 0] dina
  .douta(instruction) // output [31 : 0] douta
);

endmodule
////////////////////////////////////////////////////////////////
// *** Memory element for instruction fetch.
// Instruction Fetch from Block Ram(single port ROM).the name of
// BRAM is Instruction Memory where we will store the binary code
// or instructions to be executed.
// block ram specification are commented along side the instantia-
// tion of IM, memory address of [9:0], enable and reset pin are
// on and output is the instruction to be executed of 32 bits.
//
////////////////////////////////////////////////////////////////