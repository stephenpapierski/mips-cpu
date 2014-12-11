library ieee;
use ieee.std_logic_1164.all;

entity tristate is
    port (
        signal_in: in std_logic_vector(31 downto 0);
        enable: in std_logic;
        signal_out: out std_logic_vector(31 downto 0)
    );
end tristate;

architecture v1 of tristate is
    --signals
begin
    --do stuff
    process(enable) is
    begin
        if (enable = '1') then
            signal_out <= signal_in after 20 ps;
        else signal_out <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" after 20 ps;
        end if;
    end process;
end architecture v1;
