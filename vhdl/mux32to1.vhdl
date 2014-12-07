library ieee;
use ieee.std_logic_1164.all;

entity mux32to1 is
	port (
        i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31 :in STD_LOGIC_VECTOR(31 downto 0);
        s : in STD_LOGIC_VECTOR(4 downto 0);
		q : out STD_LOGIC_VECTOR(31 downto 0)
	);
end mux32to1;

architecture struct of mux32to1 is
	signal s0, s1, s2, s3, s4 : STD_LOGIC_VECTOR(0 downto 0);
    signal qa1, qa2, qa3, qa4, qa5, qa6, qa7, qa8, qb1, qb2: STD_LOGIC_VECTOR(31 downto 0);
begin
    s0(0) <= s(0);
    s1(0) <= s(1);
    s2(0) <= s(2);
    s3(0) <= s(3);
    s4(0) <= s(4);
	mux_a1: entity work.mux4to1(struct) port map (i0, i1, i2, i3, s1, s0, qa1);
	mux_a2: entity work.mux4to1(struct) port map (i4, i5, i6, i7, s1, s0, qa2);
	mux_a3: entity work.mux4to1(struct) port map (i8, i9, i10, i11, s1, s0, qa3);
	mux_a4: entity work.mux4to1(struct) port map (i12, i13, i14, i15, s1, s0, qa4);
	mux_a5: entity work.mux4to1(struct) port map (i16, i17, i18, i19, s1, s0, qa5);
	mux_a6: entity work.mux4to1(struct) port map (i20, i21, i22, i23, s1, s0, qa6);
	mux_a7: entity work.mux4to1(struct) port map (i24, i25, i26, i27, s1, s0, qa7);
	mux_a8: entity work.mux4to1(struct) port map (i28, i29, i30, i31, s1, s0, qa8);

	mux_b1: entity work.mux4to1(struct) port map (qa1, qa2, qa3, qa4, s3, s2, qb1);
	mux_b2: entity work.mux4to1(struct) port map (qa5, qa6, qa7, qa8, s3, s2, qb2);

	mux_c1: entity work.mux2to1(struct) port map (qb1, qb2, s4, q);
end struct;
