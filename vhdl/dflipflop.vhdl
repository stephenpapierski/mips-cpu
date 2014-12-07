library ieee;
use ieee.std_logic_1164.all;

entity dflipflop is
    port (
        clock, we : in STD_LOGIC;
        d : in STD_LOGIC_VECTOR(31 downto 0);
        q : out STD_LOGIC_VECTOR(31 downto 0)
    );
end dflipflop;

architecture behav of dflipflop is
begin
    process (clock) is
    begin
        if rising_edge(clock) then
            if (we='1') then
                q <= d after 20 ps;
            end if;
        end if;
    end process;
end architecture behav;
