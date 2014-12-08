library ieee;
use ieee.std_logic_1164.all;

entity cpu is
end cpu;

architecture v1 of cpu is
    --signals
    signal clk, reset: std_logic;
    signal PC, nPC, PC4, instruction: std_logic_vector(31 downto 0);
    signal branch, memRead, memWrite, regWrite, signExtend, ALUSrc1, memToReg: std_logic;
    signal ALUSrc2, writeRegDst, PCSrc, ALUOpType: std_logic_vector(1 downto 0);
    signal PCSrc_0, PCSrc_1: STD_LOGIC_VECTOR(0 downto 0);
begin
    reset <= '1', '0' after 5 ps; --send temporary signal to initialize dflipflops to 0's
    clk_0: entity work.clock(v1) port map(500.0E6, clk); --generates 500MHz clock
    instruction_mem : entity work.sram64kx8(sram_behaviour) port map('0', PC, instruction, '1', clk); --configures instruction memory, populates from sram64kx8.dat
    control_0: entity work.Control(behav) port map(instruction(31 downto 26), instruction(5 downto 0), branch, memRead, memWrite, regWrite, signExtend, ALUSrc1, memToReg, ALUSrc2, writeRegDst, PCSrc, ALUOpType); -- configure control unit

    PC_0: entity work.dflipflop(behav) port map (clk, '1', reset, nPC, PC); --configures PC register
    PC_4: entity work.alu(struct) port map(PC, "00000000000000000000000000000100", "0000", PC4); --generats PC+4
    
    --Control Logic Parsing (this is necessary because we designed our muxes really poorly, a.k.a. before we understood VHDL)
    PCSrc_0(0) <= PCSrc(0);
    PCSrc_1(0) <= PCSrC(1);
    --END Control Logic Parsing

    PC_src: entity work.mux4to1(struct) port map(PC4, "00000000000000000000000000000000", "00000000000000000000000000000000", "00000000000000000000000000000000", PCSrc_0, PCSrc_1, nPC);






end v1;

counter:5
