library ieee;
use ieee.std_logic_1164.all;

entity mux16to1 is
    port(
        i0, i1, i2, i3, i4,i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15 : in std_logic_vector(31 downto 0);
        s : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(31 downto 0)
    );
end mux16to1;

architecture struct of mux16to1 is
    --signals
    signal qa1, qa2, qa3, qa4 : std_logic_vector(31 downto 0);
    signal s0, s1, s2, s3 : std_logic_vector(0 downto 0);
begin
    --do stuff
    s0(0) <= s(0);
    s1(0) <= s(1);
    s2(0) <= s(2);
    s3(0) <= s(3);
    mux_a1: entity work.mux4to1(struct) port map (i0, i1, i2, i3, s1, s0, qa1);
    mux_a2: entity work.mux4to1(struct) port map (i4, i5, i6, i7, s1, s0, qa2);
    mux_a3: entity work.mux4to1(struct) port map (i8, i9, i10, i11, s1, s0, qa3);
    mux_a4: entity work.mux4to1(struct) port map (i12, i13, i14, i15, s1, s0, qa4);

    mux_b1: entity work.mux4to1(struct) port map (qa1, qa2, qa3, qa4, s3, s2, q);

end struct;
