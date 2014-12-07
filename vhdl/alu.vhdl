library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port(
        Value1, Value2: in std_logic_vector(31 downto 0);
        Operation: in std_logic_vector(3 downto 0);
        ValueOut: out std_logic_vector(31 downto 0);
        Overflow, Negative, Zero, Carryout: out std_logic
    );
end alu;

architecture struct of alu is
    --signals
    signal add_r, shift_r, xor_r, nor_r, nand_r, complement_r, slt_r, zero_vec, result: std_logic_vector(31 downto 0);
    signal signed_operation, subtract, shift_direction, sum_overflow, sum_carryout, shift_overflow, shift_carryout, zero_bit: std_logic;
begin
    --do stuff
    zero_vec <= "00000000000000000000000000000000";
    zero_bit <= '0';
    signed_operation <= not Operation(0) after 5 ps;
    subtract <= Operation(2);
    shift_direction <= Operation(0);

    adder: entity work.adder32(struct) port map (Value1, Value2, subtract, signed_operation, add_r, sum_overflow, sum_carryout);
    complement: entity work.complement32(struct) port map (Value1, complement_r);
    xor0: entity work.xor32(struct) port map (Value1, Value2, xor_r);
    nor0: entity work.nor32(struct) port map (Value1, Value2, nor_r);
    nand0: entity work.nand32(struct) port map (Value1, Value2, nand_r);
    shift: entity work.shifter32(struct) port map (Value1, Value2, shift_direction, shift_r, shift_overflow, shift_carryout);
    slt0: entity work.set_less_than(struct) port map (Value1, Value2, slt_r);

    result0: entity work.mux16to1(struct) port map (add_r, add_r, shift_r, shift_r, add_r, slt_r, zero_vec, zero_vec, xor_r, nor_r, nand_r, zero_vec, complement_r, zero_vec, zero_vec, zero_vec, Operation, result);

    carry: entity work.mux16to1_bit(struct) port map (sum_carryout, sum_carryout, shift_carryout, shift_carryout, sum_carryout, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, Operation, Carryout);

    over: entity work.mux16to1_bit(struct) port map (sum_overflow, sum_overflow, shift_overflow, shift_overflow, sum_overflow, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, Operation, Overflow);

    Negative <= result(31);
    ValueOut <= result;

    zero0: entity work.zero32(struct) port map (result, Zero);
end struct;
