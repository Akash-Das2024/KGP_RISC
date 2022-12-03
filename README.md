# KGP_RISC
RISC PROCESSOR DESIGN:

**Design modules:

1. miniRISC.v (top module)
2. ProgramCounter.v (PC)
3. InstructionFetch (IF) ---> it instantiate a BLOCK RAM name Instruction Memory(IM) which is a single port ROM.
4. decoder (decoder)
5. ControlUnit (CU) ---> generates all the signals based on the opcode.
6. registerFile (RF) ---> stores 32 (32 bit) registers and have writeReg access when writeReg signal is enabled.
7. ALU.v (arithmetic logic unit) ---> does the operation based on the alu_op signal from control unit.
8. MemoryFetch (MF) ---> fetch data from the memory or store data from the memory.\
this is also a memory element which instantiate Memory Block Ram which is also a sigle port ROM.
\
\
\
*** you need to create two memory element (BRAM): one for instruction fetch and the other for memory fetch.\
\
\
\
INSTRUCTIONS:
