`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:24 11/08/2022 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
input rst,
input [5:0] opcode,
output reg mem_write, mem_read, write_reg,
output reg [1:0]reg_dst, data_select, alu_src, instr_select,
output reg [3:0] operation
    ); 
//
// reg_dst: 00 rs 01 rt 10 $31 11 nothing
//	data_select: 00 alu_output 01 mem_output 10 pc+1 11 0
// alu_src: 00 rt_data 01 0 10 imm1 11 imm2
// instr_select: 00 pc+1 01 
//
//


always @(*) begin
		if(rst) begin
			mem_write = 1'b0;
			mem_read = 1'b0;
			write_reg = 1'b0;
			reg_dst = 2'b00;
			data_select = 2'b00;
			alu_src = 2'b00;
			instr_select = 2'b00;
			operation = 4'd0;
		end
		else begin		
			case(opcode)
					6'b000000: begin  // add 
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b00; // rt_data
						instr_select = 2'b00; // pc+1
						operation = 4'd0; // add
					end
					6'b000001: begin  // comp 
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b00; // rt_data
						instr_select = 2'b00; // pc+1
						operation = 4'd1; // comp
					end
					6'b000010: begin  // and
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b00; // rt_data
						instr_select = 2'b00; // pc+1
						operation = 4'd2; // and
					end
					6'b000011: begin  // xor 
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b00; // rt_data
						instr_select = 2'b00; // pc+1
						operation = 4'd3; // xor
					end
					6'b000100: begin  // shll
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b10; // imm1
						instr_select = 2'b00; // pc+1
						operation = 4'd4; // shll
					end
					6'b000101: begin  // shrl 
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b10; // imm1
						instr_select = 2'b00; // pc+1
						operation = 4'd5; // shrl
					end
					6'b000110: begin  // shra 
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b10; // imm1
						instr_select = 2'b00; // pc+1
						operation = 4'd6; // shrl
					end
					6'b000111: begin  // diff 
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b00; // rt_data
						instr_select = 2'b00; // pc+1
						operation = 4'd7; // diff
					end
					6'b001000: begin  // shllv 
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b00; // rt_data
						instr_select = 2'b00; // pc+1
						operation = 4'd4; // shll
					end
					6'b001001: begin  // shrlv
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b00; // rt_data
						instr_select = 2'b00; // pc+1
						operation = 4'd5; // shrl
					end
					6'b001010: begin  // shrav
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b00; // rt_data
						instr_select = 2'b00; // pc+1
						operation = 4'd6; // shrl
					end
					6'b001110: begin  // lw
						mem_write = 1'b0; // 
						mem_read = 1'b1; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b01; // rt
						data_select = 2'b01; // mem_output
						alu_src = 2'b10; // imm1
						instr_select = 2'b00; // pc+1
						operation = 4'd0; // add
					end
					6'b001111: begin  // sw
						mem_write = 1'b1; // 
						mem_read = 1'b1; // 
						write_reg = 1'b0; // 
						reg_dst = 2'b00; // doesn't matter
						data_select = 2'b00; // doesn't matter
						alu_src = 2'b10; // imm1
						instr_select = 2'b00; // pc+1
						operation = 4'd0; // add
					end
					// 01 type instruction
					6'b010000: begin  //addi
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b11; // imm2
						instr_select = 2'b00; //  pc+1
						operation = 4'd0; // add
					end
					6'b010001: begin  //compi
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b00; // rs
						data_select = 2'b00; // alu_output
						alu_src = 2'b11; // imm2
						instr_select = 2'b00; // 
						operation = 4'd1; // 
					end
					6'b010010: begin  //br
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b0; // 
						reg_dst = 2'b00; // dnm
						data_select = 2'b00; // dnm
						alu_src = 2'b00; // dnm
						instr_select = 2'b11; // (rs)
						operation = 4'd8; // 
					end
					6'b010011: begin  //bltz
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b0; // 
						reg_dst = 2'b00; // dnm
						data_select = 2'b00; // dnm
						alu_src = 2'b00; // dnm
						instr_select = 2'b01; // imm2
						operation = 4'd8; // 
					end
					6'b010100: begin  //bz
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b0; // 
						reg_dst = 2'b00; // dnm
						data_select = 2'b00; // dnm
						alu_src = 2'b00; // dnm
						instr_select = 2'b01; // imm2
						operation = 4'd8; // 
					end
					6'b010101: begin  //bnz
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b0; // 
						reg_dst = 2'b00; // dnm
						data_select = 2'b00; // dnm
						alu_src = 2'b00; // dnm
						instr_select = 2'b01; // imm2
						operation = 4'd8; // 
					end
					// 10 type instruction
					6'b100000: begin  // b
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b0; // 
						reg_dst = 2'b00; // dnm
						data_select = 2'b00; // dnm
						alu_src = 2'b00; // dnm
						instr_select = 2'b10; // label
						operation = 4'd8; // 
					end
					6'b100001: begin  // bl
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b1; // 
						reg_dst = 2'b10; // 31
						data_select = 2'b10; // pc + 1
						alu_src = 2'b00; // dnm
						instr_select = 2'b10; // label
						operation = 4'd8; // 
					end
					6'b100010: begin  // bcy
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b0; // 
						reg_dst = 2'b00; // dnm
						data_select = 2'b00; // dnm
						alu_src = 2'b00; // dnm
						instr_select = 2'b10; // label
						operation = 4'd8; // 
					end
					6'b100011: begin  // bncy
						mem_write = 1'b0; // 
						mem_read = 1'b0; // 
						write_reg = 1'b0; // 
						reg_dst = 2'b00; // dnm
						data_select = 2'b00; // dnm
						alu_src = 2'b00; // dnm
						instr_select = 2'b10; // label
						operation = 4'd8; // 
					end
			endcase			
		end
end

endmodule
