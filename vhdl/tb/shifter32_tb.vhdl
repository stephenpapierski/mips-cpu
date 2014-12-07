library ieee;
use ieee.std_logic_1164.all;

entity shifter32_tb is
end shifter32_tb;

architecture test of shifter32_tb is
    signal a, b, q : std_logic_vector(31 downto 0);
    signal direction, overflow, carryout : std_logic;
begin
    shifter_1: entity work.shifter32(struct) port map(a, b, direction, q, overflow, carryout);
    process
    type pattern_type is record
        a, b : std_logic_vector(31 downto 0);
        direction : std_logic;
        q : std_logic_vector(31 downto 0);
        overflow, carryout : std_logic;
    end record;
    type pattern_array is array(natural range <>) of pattern_type;
    constant patterns: pattern_array :=
    (
                                                                             --right?
        --a                                 --b, shamt                     --direction         --q, output         --overflow carryout 
        ("10000000000000000000000000000000", "00000000000000000000000000011111", '1', "00000000000000000000000000000001", '0', '0'),
        ("11111000000000000000000000000000", "00000000000000000000000000000011", '1', "00011111000000000000000000000000", '0', '0'),
        ("00000000000000000000000000000001", "00000000000000000000000000000100", '0', "00000000000000000000000000010000", '0', '0'),
        ("01110000000000000000000000000000", "00000000000000000000000000000010", '0', "11000000000000000000000000000000", '1', '1'),
        ("11000000000000000000000000000000", "00000000000000000000000000011111", '1', "00000000000000000000000000000001", '0', '1')
    );
    begin
        for i in patterns'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            direction <= patterns(i).direction;
            q <= patterns(i).q;
            overflow <= patterns(i).overflow;
            carryout <= patterns(i).carryout;

            wait for 1 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end test;

