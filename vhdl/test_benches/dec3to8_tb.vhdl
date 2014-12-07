LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec3to8_tb IS
END dec3to8_tb;

ARCHITECTURE test OF dec3to8_tb IS
    SIGNAL i2, i1, i0, w, q0, q1, q2, q3, q4, q5, q6, q7: STD_LOGIC;
BEGIN
    dec_0: ENTITY work.dec3to8(struct) PORT MAP (i2, i1, i0, w, q0, q1, q2, q3, q4, q5, q6, q7);

    PROCESS
	TYPE pattern_type IS RECORD
	    i2, i1, i0, w: STD_LOGIC;
	    q0, q1, q2, q3, q4, q5, q6, q7: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (
         ('0', '0', '0', '0','0', '0', '0','0', '0', '0','0', '0'),
         ('0', '0', '1', '0','0', '0', '0','0', '0', '0','0', '0'),
	     ('0', '1', '0', '0','0', '0', '0','0', '0', '0','0', '0'),
	     ('0', '1', '1', '0','0', '0', '0','0', '0', '0','0', '0'),
	     ('1', '0', '0', '0','0', '0', '0','0', '0', '0','0', '0'),
	     ('1', '0', '1', '0','0', '0', '0','0', '0', '0','0', '0'),
	     ('1', '1', '0', '0','0', '0', '0','0', '0', '0','0', '0'),
	     ('1', '1', '1', '0','0', '0', '0','0', '0', '0','0', '0'),

         ('0', '0', '0', '1','1', '0', '0','0', '0', '0','0', '0'),
         ('0', '0', '1', '1','0', '1', '0','0', '0', '0','0', '0'),
	     ('0', '1', '0', '1','0', '0', '1','0', '0', '0','0', '0'),
	     ('0', '1', '1', '1','0', '0', '0','1', '0', '0','0', '0'),
	     ('1', '0', '0', '1','0', '0', '0','0', '1', '0','0', '0'),
	     ('1', '0', '1', '1','0', '0', '0','0', '0', '1','0', '0'),
	     ('1', '1', '0', '1','0', '0', '0','0', '0', '0','1', '0'),
	     ('1', '1', '1', '1','0', '0', '0','0', '0', '0','0', '1')
     );
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  i2 <= patterns(i).i2;
	  i1 <= patterns(i).i1;
	  i0 <= patterns(i).i0;
	  w <= patterns(i).w;
	  q0 <= patterns(i).q0;
	  q1 <= patterns(i).q1;
	  q2 <= patterns(i).q2;
	  q3 <= patterns(i).q3;
	  q4 <= patterns(i).q4;
	  q5 <= patterns(i).q5;
	  q6 <= patterns(i).q6;
	  q7 <= patterns(i).q7;
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
