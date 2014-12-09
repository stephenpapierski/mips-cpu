library ieee;
use ieee.std_logic_1164.all;

entity cpu is
end cpu;

architecture v1 of cpu is
    --signals
    signal clk, overflow_f, negative_f, zero_f, carryout_f: std_logic;
    signal zeros, PC, nPC, PC4, instruction, read1Data, read2Data, storeValue, ALUResult, ALUInput1, ALUInput2, shamtExtended, immExtended: std_logic_vector(31 downto 0);
    signal immediate: std_logic_vector(15 downto 0);
    signal opcode, func: std_logic_vector(5 downto 0);
    signal Rs, Rt, Rd, shamt, storeReg: std_logic_vector(4 downto 0);
    signal ALUOperation: std_logic_vector(3 downto 0);
    signal branch, memRead, memWrite, regWrite, signExtend, ALUSrc1, memToReg: std_logic;
    signal ALUSrc2, storeRegDst, PCSrc, ALUOpType: std_logic_vector(1 downto 0);
    signal branch_0, memRead_0, memWrite_0, ALUSrc1_0, memToReg_0, ALUSrc2_0, ALUSrc2_1, storeRegDst_0, storeRegDst_1, PCSrc_0, PCSrc_1: STD_LOGIC_VECTOR(0 downto 0);
begin

    zeros <= "00000000000000000000000000000000"; --DELETE

    -- CLOCK
    clk_0: entity work.clock(v1) port map(500.0E6, clk); --generates 500MHz clock

    --INSTRUCTION MEMORY
    instruction_mem : entity work.sram64kx8(sram_behaviour) port map('0', PC, instruction, '1', clk); --configures instruction memory, populates from sram64kx8.dat

    opcode <= instruction(31 downto 26);
    Rs <= instruction(25 downto 21);
    Rt <= instruction(20 downto 16);
    Rd <= instruction(15 downto 11);
    shamt <= instruction(10 downto 6);
    func <= instruction(5 downto 0);
    immediate <= instruction(15 downto 0);


    --PROGRAM COUNTER
    PC_0: entity work.dflipflop(behav) port map (clk, '1', nPC, PC); --configures PC register
    PC_4: entity work.alu(struct) port map(PC, "00000000000000000000000000000100", "0000", PC4); --generates PC+4
    PC_src: entity work.mux4to1(struct) port map (PC4, zeros, zeros, zeros, PCSrc_1, PCSrc_0, nPC);
    
    --CONTROLLER
    control_0: entity work.Control(behav) port map(opcode, func, branch, memRead, memWrite, regWrite, signExtend, ALUSrc1, memToReg, ALUSrc2, storeRegDst, PCSrc, ALUOpType); -- configure control unit
        --Control Logic Parsing (this is necessary because we designed our muxes really poorly, a.k.a. before we understood VHDL)
    branch_0(0) <= branch;
    memRead_0(0) <= memRead;
    memWrite_0(0) <= memWrite;
    ALUSrc1_0(0) <= ALUSrc1;
    memToReg_0(0) <= memToReg;
    ALUSrc2_0(0) <= ALUSrc2(0);
    ALUSrc2_1(0) <= ALUSrc2(1);
    storeRegDst_0(0) <= storeRegDst(0);
    storeRegDst_1(0) <= storeRegDst(1);
    PCSrc_0(0) <= PCSrc(0);
    PCSrc_1(0) <= PCSrC(1);
    --END Control Logic Parsing


    --SHAMT EXTENDER
    shamt_extender_0: entity work.shamt_extender(struct) port map (shamt, shamtExtended);

    --IMMEDIATE EXTENDER
    ext_imm_0: entity work.extender(struct) port map (immediate, signExtend, immExtended);
    
    --REGISTER FILE
    write_reg_mux: entity work.mux4to1_5(struct) port map ("00000", Rd, "00000", "00000", storeRegDst_1, storeRegDst_0, storeReg); --selects the register to store data in (reg 0 through 31)
    store_val_mux: entity work.mux2to1(struct) port map (ALUResult, zeros, memToReg_0, storeValue);

    reg_file: entity work.RegFile(v1) port map(Rs, Rt, storeReg,regWrite, clk, storeValue, read1Data, read2Data); -- sets up Register File


    --ALU
    alu_src1: entity work.mux2to1(struct) port map (read1Data, zeros, ALUSrc1_0, ALUInput1);
    alu_src2: entity work.mux4to1(struct) port map (read2Data, zeros, shamtExtended, zeros, ALUSrc2_1, ALUSrc2_0, ALUInput2);
    
    alu_ctrl: entity work.ALUControl(behav) port map(ALUOpType, func, ALUOperation);

    alu_0: entity work.alu(struct) port map(ALUInput1, ALUInput2, ALUOperation, ALUResult, overflow_f, negative_f, zero_f, carryout_f);






end v1;
