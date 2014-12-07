library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture test of full_adder_tb is
    signal a, b, cin, sum, cout: std_logic;
begin
    adder_1: entity work.full_adder(struct) port map (a, b, cin, sum, cout);
    process
    type pattern_type is record
        a, b, cin, sum, cout: std_logic;
    end record;
    type pattern_array is array(natural range <>) of pattern_type;
    constant patterns: pattern_array :=
        (
            ('0', '0', '0', '0', '0'),
            ('0', '0', '1', '1', '0'),
            ('0', '1', '0', '1', '0'),
            ('0', '1', '1', '0', '1'),
            ('1', '0', '0', '1', '0'),
            ('1', '0', '1', '0', '1'),
            ('1', '1', '0', '0', '1'),
            ('1', '1', '1', '1', '1')
        );
    begin
        for i in patterns'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            cin <= patterns(i).cin;
            sum <= patterns(i).sum;
            cout <= patterns(i).cout;
            
            wait for 1 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end test;

