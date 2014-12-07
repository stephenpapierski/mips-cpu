library ieee;
use ieee.std_logic_1164.all;

entity set_less_than_tb is
end set_less_than_tb;

architecture test of set_less_than_tb is
    signal a, b, q : std_logic_vector(31 downto 0);
begin
    slt: entity work.set_less_than(struct) port map(a,b,q);
    process
    type pattern_type is record
        a, b, q : std_logic_vector(31 downto 0);
    end record;
    type pattern_array is array(natural range <>) of pattern_type;
    constant patterns: pattern_array :=
    (
    --                  a                                    b                                   q
        ("00000000000000000000000000000000", "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ("00000000000000000000000000000000", "00000000000000000000000000000001", "00000000000000000000000000000000"),
        ("01111111111111111111111111111110", "01111111111111111111111111111111", "00000000000000000000000000000000")
    );
    begin
        for i in patterns'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            --q <= patterns(i).q;

            wait for 1 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end test;
