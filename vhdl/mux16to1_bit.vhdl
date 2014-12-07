library ieee;
use ieee.std_logic_1164.all;

entity mux16to1_bit is
    port(
        i0, i1, i2, i3, i4,i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15 : in std_logic;
        s : in std_logic_vector(3 downto 0);
        q : out std_logic
    );
end mux16to1_bit;

architecture struct of mux16to1_bit is
    --signals
    signal qa1, qa2, qa3, qa4 : std_logic;
begin
    --do stuff
    mux_a1: entity work.mux4to1_bit(struct) port map (i0, i1, i2, i3, s(1), s(0), qa1);
    mux_a2: entity work.mux4to1_bit(struct) port map (i4, i5, i6, i7, s(1), s(0), qa2);
    mux_a3: entity work.mux4to1_bit(struct) port map (i8, i9, i10, i11, s(1), s(0), qa3);
    mux_a4: entity work.mux4to1_bit(struct) port map (i12, i13, i14, i15, s(1), s(0), qa4);

    mux_b1: entity work.mux4to1_bit(struct) port map (qa1, qa2, qa3, qa4, s(3), s(2), q);

end struct;
