LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux32to1_bit_tb IS
END mux32to1_bit_tb;

ARCHITECTURE test OF mux32to1_bit_tb IS
    SIGNAL i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, q1, result, q: STD_LOGIC; 
    SIGNAL s : STD_LOGIC_VECTOR(4 downto 0);
BEGIN
    mux_1: ENTITY work.mux32to1_bit(struct) PORT MAP (i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, s, q1);

    PROCESS
	TYPE pattern_type IS RECORD
	    i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31: STD_LOGIC;
        s: STD_LOGIC_VECTOR(4 downto 0);
	    q: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (
        ('1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', "00000", '1'),

	    ('0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', "00001", '1'),

        ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', "01111", '1'),

        ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', "10000", '0')
     );
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  i0 <= patterns(i).i0;
	  i1 <= patterns(i).i1;
	  i2 <= patterns(i).i2;
	  i3 <= patterns(i).i3;
	  i4 <= patterns(i).i4;
	  i5 <= patterns(i).i5;
	  i6 <= patterns(i).i6;
	  i7 <= patterns(i).i7;
	  i8 <= patterns(i).i8;
	  i9 <= patterns(i).i9;
	  i10 <= patterns(i).i10;
	  i11 <= patterns(i).i11;
	  i12 <= patterns(i).i12;
	  i13 <= patterns(i).i13;
	  i14 <= patterns(i).i14;
	  i15 <= patterns(i).i15;
	  i16 <= patterns(i).i16;
	  i17 <= patterns(i).i17;
	  i18 <= patterns(i).i18;
	  i19 <= patterns(i).i19;
	  i20 <= patterns(i).i20;
	  i21 <= patterns(i).i21;
	  i22 <= patterns(i).i22;
	  i23 <= patterns(i).i23;
	  i24 <= patterns(i).i24;
	  i25 <= patterns(i).i25;
	  i26 <= patterns(i).i26;
	  i27 <= patterns(i).i27;
	  i28 <= patterns(i).i28;
	  i29 <= patterns(i).i29;
	  i30 <= patterns(i).i30;
	  i31 <= patterns(i).i31;
	  s <= patterns(i).s;
      q <= patterns(i).q;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  --assert o1 = patterns(i).o
	  --  report "bad Behavior output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
