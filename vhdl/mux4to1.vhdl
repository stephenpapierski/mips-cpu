LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity mux4to1 is
	port (
        i0, i1, i2, i3 : in STD_LOGIC_VECTOR(31 downto 0);
        s0, s1 : in STD_LOGIC_VECTOR(0 downto 0); -- these are flipped
		q : out STD_LOGIC_VECTOR(31 downto 0)
	);
end mux4to1;

architecture struct of mux4to1 is
    signal s0_32, s1_32 : STD_LOGIC_VECTOR(31 downto 0);
begin
    s0_32 <= std_logic_vector(resize(signed(s0), 32));
    s1_32 <= std_logic_vector(resize(signed(s1), 32));
	q <= (i0 and not s0_32 and not s1_32) or (i1 and not s0_32 and s1_32) or (i2 and s0_32 and not s1_32) or (i3 and s0_32 and s1_32) after 15 ps;
end struct;
