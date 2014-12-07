LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux2to1_bit is
    port (
        i0, i1 : in STD_LOGIC;
        s : in STD_LOGIC; 
        q : out STD_LOGIC
    );
end mux2to1_bit;

architecture struct of mux2to1_bit is
begin
    q <= (i0 and not s) or (i1 and s) after 15 ps;
end struct;

		


