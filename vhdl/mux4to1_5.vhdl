LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity mux4to1_5 is
	port (
        i0, i1, i2, i3 : in STD_LOGIC_VECTOR(4 downto 0);
        s0, s1 : in STD_LOGIC_VECTOR(0 downto 0);
		q : out STD_LOGIC_VECTOR(4 downto 0)
	);
end mux4to1_5;

architecture struct of mux4to1_5 is
    signal s0_5, s1_5 : STD_LOGIC_VECTOR(4 downto 0);
begin
    s0_5 <= std_logic_vector(resize(signed(s0), 5));
    s1_5 <= std_logic_vector(resize(signed(s1), 5));
	q <= (i0 and not s0_5 and not s1_5) or (i1 and not s0_5 and s1_5) or (i2 and s0_5 and not s1_5) or (i3 and s0_5 and s1_5) after 15 ps;
end struct;
