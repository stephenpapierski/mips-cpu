library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is
    port (
        i1, i0 : in STD_LOGIC;
        w : in STD_LOGIC;
        q0, q1, q2, q3 : out STD_LOGIC
    );
end dec2to4;

architecture struct of dec2to4 is
begin
    q0 <= not i1 and not i0 and w after 10 ps;
    q1 <= not i1 and i0 and w after 10 ps;
    q2 <= i1 and not i0 and w after 10 ps;
    q3 <= i1 and i0 and w after 5 ps;
end struct;
