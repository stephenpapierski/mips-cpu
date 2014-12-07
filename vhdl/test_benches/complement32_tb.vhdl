library ieee;
use ieee.std_logic_1164.all;

entity complement32_tb is
end complement32_tb;

architecture test of complement32_tb is
    signal a, q : std_logic_vector(31 downto 0);
begin
    complement_1: entity work.complement32(struct) port map (a, q);
    process
    type pattern_type is record
        a, q : std_logic_vector(31 downto 0);
    end record;
    type pattern_array is array(natural range <>) of pattern_type;
    constant patterns: pattern_array :=
    (
        ("00000000000000000000000000000000", "11111111111111111111111111111111"),
        ("11111111111111111111111111111111", "00000000000000000000000000000000"),
        ("10101010101010101010101010101010", "01010101010101010101010101010101")
    );
    begin
        for i in patterns'range loop
            a <= patterns(i).a;
            q <= patterns(i).q;
            
            wait for 1 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end test;
