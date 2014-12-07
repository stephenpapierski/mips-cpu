library ieee;
use ieee.std_logic_1164.all;

entity nand32_tb is
end nand32_tb;

architecture test of nand32_tb is
    signal a, b, q : std_logic_vector(31 downto 0);
begin
    nand_1: entity work.nand32(struct) port map (a, b, q);
    process
    type pattern_type is record
        a, b, q : std_logic_vector(31 downto 0);
    end record;
    type pattern_array is array(natural range <>) of pattern_type;
    constant patterns: pattern_array :=
    (
        ("00000000000000000000000000000000", "00000000000000000000000000000000", "11111111111111111111111111111111"),
        ("00000000000000000000000000000000", "11111111111111111111111111111111", "11111111111111111111111111111111"),
        ("11111111111111111111111111111111", "00000000000000000000000000000000", "11111111111111111111111111111111"),
        ("11111111111111111111111111111111", "11111111111111111111111111111111", "00000000000000000000000000000000")
    );
    begin
        for i in patterns'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            q <= patterns(i).q;
            
            wait for 1 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end test;
