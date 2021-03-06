library ieee;
use ieee.std_logic_1164.all;

entity clock is
    port (
        freq : in real;
        halt :in std_logic;
        clk : out std_logic
    );
end clock;

architecture v1 of clock is
    --signals
    procedure clk_gen(signal CLK: out std_logic; constant FREQ: real; signal HALT: std_logic) is
        constant period       :time := 1 sec / FREQ;
        constant high_time    :time := period / 2;
        constant low_time     :time := period - high_time;
    begin
        loop
            if (HALT = '1') then
                exit;
            end if;

            CLK <= '1';
            wait for high_time;
            CLK <= '0';
            wait for low_time;
        end loop;
    end procedure;
begin
    --do stuff
    clk_gen(clk, freq, halt);
end v1;
