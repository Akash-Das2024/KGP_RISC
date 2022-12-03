# KGP_RISC
RISC PROCESSOR DESIGN:

**Design modules:

miniRISC.v (top module)
ALU.v (arithmetic logic unit)
ProgramCounter.v (PC)
InstructionFetch (IF) ---> it instantiate a BLOCK RAM name Instruction Memory(IM) which is a single port ROM.
decoder (decoder)
ControlUnit (CU) ---> generates all the signals based on the opcode.
registerFile (RF) ---> stores 32 (32 bit) registers and have writeReg access when writeReg signal is enabled
ALU (alu) ---> does the operation based on the alu_op signal from control unit
MemoryFetch (MF) ---> fetch data from the memory or store data from the memory. this is also a memory element which instatiate Memory Block Ram which is also a sigle port ROM.


*** you need to create two memory element (BRAM): one for instruction fetch and the other for memory fetch.

INSTRUCTIONS:
