LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux4to1_bit is
	port (
        i0, i1, i2, i3 : in STD_LOGIC;
        s0, s1 : in STD_LOGIC;
		q : out STD_LOGIC
	);
end mux4to1_bit;

architecture struct of mux4to1_bit is
begin
	q <= (i0 and not s0 and not s1) or (i1 and not s0 and s1) or (i2 and s0 and not s1) or (i3 and s0 and s1) after 15 ps;
end struct;
