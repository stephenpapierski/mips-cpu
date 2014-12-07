LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dflipflop_tb IS
END dflipflop_tb;

ARCHITECTURE test OF dflipflop_tb IS
    SIGNAL clock, we : STD_LOGIC;
    signal d, q: STD_LOGIC_VECTOR(31 downto 0);
BEGIN
    mux_1: ENTITY work.dflipflop(behav) PORT MAP (clock, we, d, q);

    PROCESS
	TYPE pattern_type IS RECORD
	    clock, we : STD_LOGIC;
        d, q: STD_LOGIC_VECTOR(31 downto 0);
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (
        ('0', '1', "10101010101010101010101010101010", "00000000000000000000000000000000"),
        ('1', '0', "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ('0', '0', "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ('1', '0', "11111111111111111111111111111111", "00000000000000000000000000000000"),
        ('0', '0', "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ('1', '0', "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ('0', '1', "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ('1', '0', "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ('0', '0', "11111111111111111111111111111111", "00000000000000000000000000000000"),
        ('1', '0', "00000000000000000000000000000000", "00000000000000000000000000000000")
     );
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  clock <= patterns(i).clock;
      wait for 500 ps;
	  we <= patterns(i).we;
	  d <= patterns(i).d;
      --q <= patterns(i).q;
	  --  Wait for the results.
	  wait for 500 ps;
	  --  Check the outputs.
	  --assert o1 = patterns(i).o
	  --  report "bad Behavior output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
