library ieee;
use ieee.std_logic_1164.all;

entity mux32to1_bit is
	port (
        i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31 :in STD_LOGIC;
        s : in STD_LOGIC_VECTOR(4 downto 0);
		q : out STD_LOGIC
	);
end mux32to1_bit;

architecture struct of mux32to1_bit is
    signal qa1, qa2, qa3, qa4, qa5, qa6, qa7, qa8, qb1, qb2: STD_LOGIC;
begin
	mux_a1: entity work.mux4to1_bit(struct) port map (i0, i1, i2, i3, s(1), s(0), qa1);
	mux_a2: entity work.mux4to1_bit(struct) port map (i4, i5, i6, i7, s(1), s(0), qa2);
	mux_a3: entity work.mux4to1_bit(struct) port map (i8, i9, i10, i11, s(1), s(0), qa3);
	mux_a4: entity work.mux4to1_bit(struct) port map (i12, i13, i14, i15, s(1), s(0), qa4);
	mux_a5: entity work.mux4to1_bit(struct) port map (i16, i17, i18, i19, s(1), s(0), qa5);
	mux_a6: entity work.mux4to1_bit(struct) port map (i20, i21, i22, i23, s(1), s(0), qa6);
	mux_a7: entity work.mux4to1_bit(struct) port map (i24, i25, i26, i27, s(1), s(0), qa7);
	mux_a8: entity work.mux4to1_bit(struct) port map (i28, i29, i30, i31, s(1), s(0), qa8);

	mux_b1: entity work.mux4to1_bit(struct) port map (qa1, qa2, qa3, qa4, s(3), s(2), qb1);
	mux_b2: entity work.mux4to1_bit(struct) port map (qa5, qa6, qa7, qa8, s(3), s(2), qb2);

	mux_c1: entity work.mux2to1_bit(struct) port map (qb1, qb2, s(4), q);
end struct;
