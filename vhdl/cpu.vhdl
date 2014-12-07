library ieee;
use ieee.std_logic_1164.all;

entity cpu is
end cpu;

architecture v1 of cpu is
    --signals
    signal clk: std_logic;
begin
    clk_0: entity work.clock(v1) port map (1.0E9, clk); --generates 1GHz clock
    --do stuff
end v1;
