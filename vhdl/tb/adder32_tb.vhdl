library ieee;
use ieee.std_logic_1164.all;

entity adder32_tb is
end adder32_tb;

architecture test of adder32_tb is
    signal a, b, sum : std_logic_vector (31 downto 0);
    signal subtract, signed_operation,  overflow, carryout : std_logic;
begin
    adder_1: entity work.adder32(struct) port map (a, b, subtract, signed_operation, sum, overflow, carryout);
    process
    type pattern_type is record
        a, b, sum: std_logic_vector(31 downto 0);
        subtract, signed_operation: std_logic;
        overflow, carryout : std_logic;
    end record;
    type pattern_array is array(natural range <>) of pattern_type;
    constant patterns: pattern_array :=
    (
        --a                                 --b                                 --sum                               sub signed over carry
        ("11111111111111111111111111111111", "00000000000000000000000000000001", "00000000000000000000000000000000", '0', '0', '1', '1'),
        ("00000000000000000000000000000001", "00000000000000000000000000000001", "00000000000000000000000000000010", '0', '0', '0', '0'),
        ("01111111111111111111111111111111", "00000000000000000000000000000001", "10000000000000000000000000000000", '0', '1', '1', '0'),
        ("00000000000000000000000000000000", "00000000000000000000000000000000", "00000000000000000000000000000000", '1', '0', '0', '0'),
        ("00000000010000000000000000000000", "00000000000000000000000000000001", "00000000001111111111111111111111", '1', '1', '0', '0'),
        ("00000000000000000000000000000001", "00000000000000000000000000000011", "11111111111111111111111111111110", '1', '1', '0', '0'),
        ("11111111111111111111111111111111", "01111111111111111111111111111111", "10000000000000000000000000000000", '1', '1', '1', '0'),
        ("01111111111111111111111111111110", "01111111111111111111111111111111", "11111111111111111111111111111111", '1', '1', '0', '0')
    );
    begin
        for i in patterns'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            subtract <= patterns(i).subtract;
            signed_operation <= patterns(i).signed_operation;
            sum <= patterns(i).sum;
            overflow <= patterns(i).overflow;
            carryout <= patterns(i).carryout;
            
            wait for 1 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end test;
