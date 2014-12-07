LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY extender_tb IS
END extender_tb;

ARCHITECTURE test OF extender_tb IS
    signal imm: std_logic_vector(15 downto 0);
    signal signext: std_logic;
    signal extended: std_logic_vector(31 downto 0);
BEGIN
    extender_1: ENTITY work.extender(struct) PORT MAP (imm, signext, extended);

    PROCESS
	TYPE pattern_type IS RECORD
        imm: std_logic_vector(15 downto 0);
        signext: std_logic;
        extended: std_logic_vector(31 downto 0);

	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("0101010101010101", '0', "00000000000000000101010101010101"),
	     ("1010101010101010", '0', "00000000000000001010101010101010"),
	     ("0101010101010101", '1', "00000000000000000101010101010101"),
	     ("1010101010101010", '1', "11111111111111111010101010101010")
        );
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  imm <= patterns(i).imm;
	  signext <= patterns(i).signext;
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
