library ieee;
use ieee.std_logic_1164.all;

--**********************************************************


entity cpu is
end cpu;

architecture v1 of cpu is
    --signals
    signal clk, overflow_f, pre_negative_f, negative_f, zero_f, carryout_f, halt, dataMem_nwe, dataMem_noe, clk_20ps, tristate_en, addui: std_logic;
    signal clk_pulse: std_logic := '1';
    signal zeros, four_32, PC, nPC, PC4, instruction, read1Data, read2Data, storeValue, ALUResult, ALUInput1, ALUInput2, shamtExtended, immExtended, ALUout, notALUout, dataMemory_data, jumpAddr, branchAddr, PC4_branch, PC4_or_branch: std_logic_vector(31 downto 0);
    signal addr: std_logic_vector(25 downto 0);
    signal immediate: std_logic_vector(15 downto 0);
    signal opcode, func: std_logic_vector(5 downto 0);
    signal Rs, Rt, Rd, shamt, storeReg: std_logic_vector(4 downto 0);
    signal ALUOperation: std_logic_vector(3 downto 0);
    signal branch, memRead, memWrite, regWrite, signExtend, ALUSrc1, memToReg: std_logic;
    signal ALUSrc2, storeRegDst, PCSrc, ALUOpType: std_logic_vector(1 downto 0);
    signal branch_0, memRead_0, memWrite_0, ALUSrc1_0, memToReg_0, ALUSrc2_0, ALUSrc2_1, storeRegDst_0, storeRegDst_1, PCSrc_0, PCSrc_1, ALUOpType_0, ALUOpType_1, branch_equal: STD_LOGIC_VECTOR(0 downto 0);
begin

    zeros <= "00000000000000000000000000000000";
    four_32 <= "00000000000000000000000000000100";

    -- CLOCK
    clk_0: entity work.clock(v1) port map(500.0E6, halt, clk); --generates 500MHz clock
    
    clk_pulse <= clk and not clk_20ps after 40 ps;
    clk_20ps <= clk after 20 ps;

    --INSTRUCTION MEMORY
    instruction_mem : entity work.sram64kx8(sram_behaviour) port map('0', PC, instruction, '1', clk); --configures instruction memory, populates from sram64kx8.dat

    opcode <= instruction(31 downto 26);
    Rs <= instruction(25 downto 21);
    Rt <= instruction(20 downto 16);
    Rd <= instruction(15 downto 11);
    shamt <= instruction(10 downto 6);
    func <= instruction(5 downto 0);
    immediate <= instruction(15 downto 0);
    addr <= instruction(25 downto 0);


    --PROGRAM COUNTER
    PC_0: entity work.dflipflop(behav) port map (clk, '1', nPC, PC); --configures PC register
    PC_4: entity work.alu(struct) port map(PC, four_32, "0000", PC4); --generates PC+4
    branchAddr <= immExtended(29 downto 0) & "00";
    PC_4_branch: entity work.alu(struct) port map(branchAddr, PC4, "0000", PC4_branch); -- generates PC+4+branchAddr, the branch location
    branch_equal(0) <= zero_f and branch after 5 ps;
    PC_4_or_branch: entity work.mux2to1(struct) port map (PC4, PC4_branch, branch_equal, PC4_or_branch);
    jumpAddr <= PC4(31 downto 28) & addr & "00";
    PC_src: entity work.mux4to1(struct) port map (PC4_or_branch, jumpAddr, read1Data, zeros, PCSrc_1, PCSrc_0, nPC);
    
    --CONTROLLER
    control_0: entity work.Control(behav) port map(opcode, func, branch, memRead, memWrite, regWrite, signExtend, ALUSrc1, memToReg, halt, addui, ALUSrc2, storeRegDst, PCSrc, ALUOpType); -- configure control unit
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
    write_reg_mux: entity work.mux4to1_5(struct) port map (Rt, Rd, "11111", "00000", storeRegDst_1, storeRegDst_0, storeReg); --selects the register to store data in (reg 0 through 31)
    store_val_mux: entity work.mux2to1(struct) port map (ALUResult, dataMemory_data, memToReg_0, storeValue);

    reg_file: entity work.RegFile(v1) port map(Rs, Rt, storeReg, regWrite, clk, storeValue, read1Data, read2Data); -- sets up Register File


    --ALU
    alu_src1: entity work.mux2to1(struct) port map (read1Data, four_32, ALUSrc1_0, ALUInput1);
    alu_src2: entity work.mux4to1(struct) port map (read2Data, immExtended, shamtExtended, PC4, ALUSrc2_1, ALUSrc2_0, ALUInput2);
    
    alu_ctrl: entity work.ALUControl(behav) port map(ALUOpType, func, ALUOperation);
    ALUOpType_0(0) <= ALUOpType(0);
    ALUOpType_1(0) <= ALUOpType(1);

    alu_0: entity work.alu(struct) port map(ALUInput1, ALUInput2, ALUOperation, ALUout, overflow_f, pre_negative_f, zero_f, carryout_f);
    negative_f <= pre_negative_f and not addui after 10 ps; --corrects the negative flag output from the alu when performing an unsigned add immediate

    notALUout <= not ALUout after 5 ps;
    or_implementation: entity work.mux4to1(struct) port map (ALUout, ALUout, ALUout, notALUout, ALUOpType_1, ALUOpType_0, ALUResult);


    --DATA MEMORY
    dataMem_nwe <= clk_20ps or (not memWrite) after 600 ps; -- not write enable for data memory
    dataMem_noe <= clk_20ps or (not memRead) after 600 ps; -- not output enable for data memory

    tristate_en <= not clk_20ps and memWrite after 600 ps;
    --600 ps delay gives enough time for the alu to calculate and output the load/store address

    tristate_0: entity work.tristate(v1) port map (read2Data, tristate_en, dataMemory_data);

    data_mem: entity work.sram64kx8(sram_behaviour) port map ('0', ALUResult, dataMemory_data, dataMem_nwe, dataMem_noe);






end v1;
