`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:30 11/08/2022 
// Design Name: 
// Module Name:    miniRISC 
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

module miniRISC(
input clk,rst,
output [31:0] out1, out2
    );	 
	 
	 // instruction
	 wire [31:0] pc;
	 wire [31:0] npc;
    wire [31:0] instruction;
	 // decoded instructions
	 wire [5:0] opcode;
	 wire [4:0] rs, rt;
	 wire [31:0] label, imm1, imm2;
	 // signals
	 wire mem_write, mem_read, write_reg;
	 wire [1:0] reg_dst, alu_src, data_select, instr_select;
	 wire [3:0] operation;
	 // alu and mem output & input
	 wire [31:0] alu_input2;
	 wire [31:0] alu_output, mem_output;
	 // register input & ouput
	 wire [31:0] wd, rs_data, rt_data;
	 wire [4:0] wad;
	 // flags
	 wire carryFlag, zeroFlag, signFlag;
// wire clk_out;	 
// Instantiate the module
// Clock_divider divider (
//    .clock_in(clk), 
//    .clock_out(clk_out)
//    );
// assign clk_out = clk;
 
ProgramCounter PC (
    .clk(clk),
    .rst(rst), 
    .PC(pc), 
    .NPC(npc)
    );
	// 
InstructionFetch IF (
    .clk(clk), 
    .rst(rst), 
    .PC(npc),
	 // output
    .instruction(instruction)
    );
	 //
decoder Decoder (
    .instruction(instruction),
	 // output
    .opcode(opcode), 
    .rs(rs), 
    .rt(rt), 
    .label(label), 
    .imm1(imm1), 
    .imm2(imm2)
    );
ControlUnit CU ( 
    .rst(rst), 
    .opcode(opcode), 
    .mem_write(mem_write), 
    .mem_read(mem_read), 
    .write_reg(write_reg), 
    .reg_dst(reg_dst), 
    .data_select(data_select), 
    .alu_src(alu_src), 
    .instr_select(instr_select), 
    .operation(operation)
    );

mux4x1 WriteAddressDst (
    .clk(clk), 
    .rst(rst), 
    .a(rs), 
    .b(rt), 
    .c(5'b11111), 
    .d(), 
    .select(reg_dst), 
    .out(wad)
    );

mux4x1_32bit DataInputSelect (
    .clk(clk), 
    .rst(rst), 
    .a(alu_output), 
    .b(mem_output), 
    .c(pc + 1), 
    .d(32'd0), 
    .select(data_select), 
    .out(wd)
    );

	 
registerFile RF (
    .clk(clk), 
    .rst(rst), 
    .rs(rs), 
    .rt(rt), 
    .wad(wad), 
    .wd(wd), 
    .write_reg(write_reg), 
    .rs_data(rs_data), 
    .rt_data(rt_data)
    );

mux4x1_32bit AluSrc (
    .clk(clk), 
    .rst(rst), 
    .a(rt_data), 
    .b(32'd0), 
    .c(imm1), 
    .d(imm2), 
    .select(alu_src), 
    .out(alu_input2)
    );
	 
ALU alu(
    .clk(clk), 
    .rst(rst), 
    .in1(rs_data), 
    .in2(alu_input2), 
    .operation(operation),
	 // output
    .out(alu_output), 
    .carryFlag(carryFlag), 
    .zeroFlag(zeroFlag), 
    .signFlag(signFlag)
    );
	 
MemoryFetch Memory (
    .clk(clk), 
    .rst(rst), 
    .mem_read(mem_read), 
    .mem_write(mem_write), 
    .address(alu_output), 
    .input_data(rt_data), 
    .output_data(mem_output)
    );
	 
BranchMux4x1 Branch (
    .instr_select(instr_select), 
    .carryFlag(carryFlag), 
    .zeroFlag(zeroFlag), 
    .signFlag(signFlag), 
    .opcode(opcode), 
    .pc(npc), 
    .rs_data(rs_data), 
    .imm2(imm2), 
    .label(label), 
    .npc(pc)
    );
	 
assign out1 = instruction;
assign out2 = rt_data;

endmodule
