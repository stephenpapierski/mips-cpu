library ieee;
use ieee.std_logic_1164.all;

entity dec5to32 is
    port (
        i : in STD_LOGIC_VECTOR(4 downto 0);
        we : in STD_LOGIC;
        q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31 : out STD_LOGIC
    );
end dec5to32;

architecture struct of dec5to32 is
    signal w0, w1, w2, w3, w4, w5, w6, w7 : STD_LOGIC;
begin
    decw: entity work.dec3to8(struct) port map (i(4), i(3), i(2), we, w0, w1, w2, w3, w4, w5, w6, w7);

    dec0: entity work.dec2to4(struct) port map (i(1), i(0), w0, q0, q1, q2, q3);
    dec1: entity work.dec2to4(struct) port map (i(1), i(0), w1, q4, q5, q6, q7);
    dec2: entity work.dec2to4(struct) port map (i(1), i(0), w2, q8, q9, q10, q11);
    dec3: entity work.dec2to4(struct) port map (i(1), i(0), w3, q12, q13, q14, q15);
    dec4: entity work.dec2to4(struct) port map (i(1), i(0), w4, q16, q17, q18, q19);
    dec5: entity work.dec2to4(struct) port map (i(1), i(0), w5, q20, q21, q22, q23);
    dec6: entity work.dec2to4(struct) port map (i(1), i(0), w6, q24, q25, q26, q27);
    dec7: entity work.dec2to4(struct) port map (i(1), i(0), w7, q28, q29, q30, q31);
end struct;
