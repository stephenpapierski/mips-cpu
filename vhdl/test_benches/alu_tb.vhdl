library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end alu_tb;

architecture test of alu_tb is
    signal Value1, Value2, ValueOut : std_logic_vector(31 downto 0);
    signal Operation : std_logic_vector(3 downto 0);
    signal Overflow, Negative, Zero, Carryout : std_logic;
begin
    alu_1 : entity work.alu(struct) port map (Value1, Value2, Operation, ValueOut, Overflow, Negative, Zero, Carryout);
    process
    type pattern_type is record
        Value1, Value2, ValueOut : std_logic_vector(31 downto 0);
        Operation : std_logic_vector(3 downto 0);
        Overflow, Negative, Zero, Carryout : std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns: pattern_array :=
        (
        --                                                                                                              [NOT IMPLEMENTED FOR GTKWave]
        --              Value1                               Value2                             ValueOut                  Opp   Over  Neg Zero Carry
        --add
            ("00000000000000000000000000010000", "11111111111111111111111111111111", "00000000000000000000000000001111", "0000", '0', '0', '0', '0'),
        --uadd
            ("00000000000000000000000000011111", "00000000000000000000000000000001", "00000000000000000000000000100000", "0001", '0', '0', '0', '0'),
        --subtract 400-50 = 350
            ("00000000000000000000000000010000", "11111111111111111111111111111111", "00000000000000000000000000001111", "0000", '0', '0', '0', '0'),
        --left shift 126<<6 = 8064
            ("00000000000000000000000001111110", "00000000000000000000000000000110", "00000000000000000001111110000000", "0010", '0', '0', '0', '0'),
        --right shift 8064>>6 = 126
            ("00000000000000000001111110000000", "00000000000000000000000000000110", "00000000000000000000000001111110", "0011", '0', '0', '0', '0'),
        --set less than
            ("00000000000000000001111110000000", "01000000000000000000000000000110", "00000000000000000000000000000001", "0101", '0', '0', '0', '0'),
        --xor
            ("11111111111111111111111111111111", "01010101010101010101010101010101", "10101010101010101010101010101010", "1000", '0', '0', '0', '0'),
        --nor
            ("00000000000000000000000000000000", "01010101010101010101010101010101", "10101010101010101010101010101010", "1001", '0', '0', '0', '0'),
        --nand
            ("11111111111111111111111111111111", "01010101010101010101010101010101", "10101010101010101010101010101010", "1010", '0', '0', '0', '0'),
        --complement
            ("01010101010101010101010101010101", "00000000000000000000000000000000", "10101010101010101010101010101010", "1100", '0', '0', '0', '0'),
        --zero + carryout
            ("00000000000000000000000000000000", "00000000000000000000000000000000", "00000000000000000000000000000000", "0100", '0', '0', '1', '1')
        );
    begin
        for i in patterns'range loop
            Value1 <= patterns(i).Value1;
            Value2 <= patterns(i).Value2;
            Operation <= patterns(i).Operation;
            ValueOut <= patterns(i).ValueOut;
            wait for 1 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end test;
