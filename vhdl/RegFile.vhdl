library ieee;
use ieee.std_logic_1164.all;

entity RegFile is
    port(
        reg1, reg2, writeReg : in STD_LOGIC_VECTOR(4 downto 0);
        WE, clock : in STD_LOGIC;
        writeData : in STD_LOGIC_VECTOR(31 downto 0);
        read1Data, read2Data : out STD_LOGIC_VECTOR(31 downto 0)
    );
end RegFile;

architecture v1 of RegFile is
    signal we0, we1, we2, we3, we4, we5, we6, we7, we8, we9, we10, we11, we12, we13, we14, we15, we16, we17, we18, we19, we20, we21, we22, we23, we24, we25, we26, we27, we28, we29, we30, we31 : STD_LOGIC; --write enable bits routed to each register
    signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31 : STD_LOGIC_VECTOR(31 downto 0); --32 bit outputs from the registers
    signal reset: std_logic;
begin
    reset <= '1', '0' after 5 ps;
    dec: entity work.dec5to32(struct) port map (writeReg, WE, we0, we1, we2, we3, we4, we5, we6, we7, we8, we9, we10, we11, we12, we13, we14, we15, we16, we17, we18, we19, we20, we21, we22, we23, we24, we25, we26, we27, we28, we29, we30, we31);

    q0 <= "00000000000000000000000000000000"; --holds $zero at a value of 0
    reg_1: entity work.dflipflop(behav) port map (clock, we1, reset, writeData, q1);
    reg_2: entity work.dflipflop(behav) port map (clock, we2, reset, writeData, q2);
    reg_3: entity work.dflipflop(behav) port map (clock, we3, reset, writeData, q3);
    reg_4: entity work.dflipflop(behav) port map (clock, we4, reset, writeData, q4);
    reg_5: entity work.dflipflop(behav) port map (clock, we5, reset, writeData, q5);
    reg_6: entity work.dflipflop(behav) port map (clock, we6, reset, writeData, q6);
    reg_7: entity work.dflipflop(behav) port map (clock, we7, reset, writeData, q7);
    reg_8: entity work.dflipflop(behav) port map (clock, we8, reset, writeData, q8);
    reg_9: entity work.dflipflop(behav) port map (clock, we9, reset, writeData, q9);
    reg_10: entity work.dflipflop(behav) port map (clock, we10, reset, writeData, q10);
    reg_11: entity work.dflipflop(behav) port map (clock, we11, reset, writeData, q11);
    reg_12: entity work.dflipflop(behav) port map (clock, we12, reset, writeData, q12);
    reg_13: entity work.dflipflop(behav) port map (clock, we13, reset, writeData, q13);
    reg_14: entity work.dflipflop(behav) port map (clock, we14, reset, writeData, q14);
    reg_15: entity work.dflipflop(behav) port map (clock, we15, reset, writeData, q15);
    reg_16: entity work.dflipflop(behav) port map (clock, we16, reset, writeData, q16);
    reg_17: entity work.dflipflop(behav) port map (clock, we17, reset, writeData, q17);
    reg_18: entity work.dflipflop(behav) port map (clock, we18, reset, writeData, q18);
    reg_19: entity work.dflipflop(behav) port map (clock, we19, reset, writeData, q19);
    reg_20: entity work.dflipflop(behav) port map (clock, we20, reset, writeData, q20);
    reg_21: entity work.dflipflop(behav) port map (clock, we21, reset, writeData, q21);
    reg_22: entity work.dflipflop(behav) port map (clock, we22, reset, writeData, q22);
    reg_23: entity work.dflipflop(behav) port map (clock, we23, reset, writeData, q23);
    reg_24: entity work.dflipflop(behav) port map (clock, we24, reset, writeData, q24);
    reg_25: entity work.dflipflop(behav) port map (clock, we25, reset, writeData, q25);
    reg_26: entity work.dflipflop(behav) port map (clock, we26, reset, writeData, q26);
    reg_27: entity work.dflipflop(behav) port map (clock, we27, reset, writeData, q27);
    reg_28: entity work.dflipflop(behav) port map (clock, we28, reset, writeData, q28);
    reg_29: entity work.dflipflop(behav) port map (clock, we29, reset, writeData, q29);
    reg_30: entity work.dflipflop(behav) port map (clock, we30, reset, writeData, q30);
    reg_31: entity work.dflipflop(behav) port map (clock, we31, reset, writeData, q31);

    mux1: entity work.mux32to1(struct) port map (q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, reg1, read1Data);
    mux2: entity work.mux32to1(struct) port map (q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, reg2, read2Data);
end v1;

