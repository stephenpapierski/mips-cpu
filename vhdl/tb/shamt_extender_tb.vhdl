LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shamt_extender_tb IS
END shamt_extender_tb;

ARCHITECTURE test OF shamt_extender_tb IS
    signal shamt: std_logic_vector(4 downto 0);
    signal extended: std_logic_vector(31 downto 0);
BEGIN
    shamt_extender_1: ENTITY work.shamt_extender(struct) PORT MAP (shamt, extended);

    PROCESS
	TYPE pattern_type IS RECORD
        shamt: std_logic_vector(4 downto 0);
        extended: std_logic_vector(31 downto 0);

	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("10101", "00000000000000000000000000010101"),
	     ("01010", "00000000000000000000000000001010"),
	     ("11111", "00000000000000000000000000011111"),
	     ("00000", "00000000000000000000000000000000")
        );
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  shamt <= patterns(i).shamt;
	  extended <= patterns(i).extended;
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
