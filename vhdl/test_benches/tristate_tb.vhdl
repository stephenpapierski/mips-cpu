library ieee;
use ieee.std_logic_1164.all;

entity tristate_tb is
end tristate_tb;

architecture test of tristate_tb is
    signal signal_in, signal_out: std_logic_vector(31 downto 0);
    signal enable: std_logic;
begin
    tristate_0: entity work.tristate(v1) port map (signal_in, enable, signal_out);
    process
    type pattern_type is record
        signal_in, signal_out: std_logic_vector(31 downto 0);
        enable: std_logic;
    end record;
    type pattern_array is array(natural range <>) of pattern_type;
    constant patterns: pattern_array :=
    (
        ("00000000000000000000000000000000", "00000000000000000000000000000000", '1'),
        ("00000000000000000000000000000001", "00000000000000000000000000000000", '1'),
        ("00000000000000000000000000000000", "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ", '0'),
        ("00000000000000000000000000000010", "00000000000000000000000000000010", '1')
    );
    begin
        for i in patterns'range loop
            signal_in <= patterns(i).signal_in;
            enable <= patterns(i).enable;
            signal_out <= patterns(i).signal_out;
            wait for 1 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end test;

