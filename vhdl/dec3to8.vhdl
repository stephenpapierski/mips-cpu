library ieee;
use ieee.std_logic_1164.all;

entity dec3to8 is
    port (
        i2, i1, i0 : in STD_LOGIC;
        w : in STD_LOGIC;
        q0, q1, q2, q3, q4, q5, q6, q7 : out STD_LOGIC
    );
end dec3to8;

architecture struct of dec3to8 is
begin
    q0 <= not i2 and not i1 and not i0 and w after 10 ps;
    q1 <= not i2 and not i1 and i0 and w after 10 ps;
    q2 <= not i2 and i1 and not i0 and w after 10 ps;
    q3 <= not i2 and i1 and i0 and w after 10 ps;
    q4 <= i2 and not i1 and not i0 and w after 10 ps;
    q5 <= i2 and not i1 and i0 and w after 10 ps;
    q6 <= i2 and i1 and not i0 and w after 10 ps;
    q7 <= i2 and i1 and i0 and w after 5 ps;
end struct;
