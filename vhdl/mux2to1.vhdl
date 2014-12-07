LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity mux2to1 is
    port (
        i0, i1 : in STD_LOGIC_VECTOR(31 downto 0);
        s : in STD_LOGIC_VECTOR(0 downto 0); 
        q : out STD_LOGIC_VECTOR(31 downto 0)
    );
end mux2to1;

architecture struct of mux2to1 is
    signal s_32 : STD_LOGIC_VECTOR(31 downto 0); 
begin
    s_32 <= std_logic_vector(resize(signed(s), 32)); --sign extends select bit to 32 bit std_logic_vector
    q <= (i0 and not s_32) or (i1 and s_32) after 15 ps;
end struct;
