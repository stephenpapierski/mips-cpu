LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regfile_tb IS
END regfile_tb;

ARCHITECTURE test OF regfile_tb IS
    SIGNAL reg1, reg2, writeReg : STD_LOGIC_VECTOR(4 downto 0);
    signal WE, clock : STD_LOGIC;
    signal writeData, read1Data, read2Data : STD_LOGIC_VECTOR(31 downto 0);
BEGIN
    mux_1: ENTITY work.regfile(v1) PORT MAP (reg1, reg2, writeReg, WE, clock, writeData, read1Data, read2Data);

    PROCESS
	TYPE pattern_type IS RECORD
        reg1, reg2, writeReg : STD_LOGIC_VECTOR(4 downto 0);
        WE, clock : STD_LOGIC;
        writeData, read1Data, read2Data : STD_LOGIC_VECTOR(31 downto 0);
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (
       -- reg1     reg2    writeReg  WE clock  writeData                           read1Data                           read2Data                           --**WRITE TESTS**
        ("00000", "00000", "00001", '1', '0', "00000000000000000000000000000001", "00000000000000000000000000000000", "00000000000000000000000000000000"), -- write 1 to reg_1
        ("00000", "00000", "00001", '1', '1', "11111111111111111111111111111111", "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ("00000", "00000", "00010", '1', '0', "00000000000000000000000000000010", "00000000000000000000000000000000", "00000000000000000000000000000000"), -- write 2 to reg_2
        ("00000", "00000", "00010", '1', '1', "11111111111111111111111111111111", "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ("00000", "00000", "00011", '1', '0', "00000000000000000000000000000011", "00000000000000000000000000000000", "00000000000000000000000000000000"), -- write 3 to reg_3
        ("00000", "00000", "00011", '1', '1', "11111111111111111111111111111111", "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ("00000", "00000", "00100", '1', '0', "00000000000000000000000000000100", "00000000000000000000000000000000", "00000000000000000000000000000000"), -- write 4 to reg_4
        ("00000", "00000", "00100", '1', '1', "11111111111111111111111111111111", "00000000000000000000000000000000", "00000000000000000000000000000000"), 
        ("00000", "00000", "00000", '1', '0', "10101010101010101010101010101010", "00000000000000000000000000000000", "00000000000000000000000000000000"), -- write value to reg_0
        ("00000", "00000", "00000", '0', '1', "10101010101010101010101010101010", "00000000000000000000000000000000", "00000000000000000000000000000000"),
        ("00000", "00001", "00000", '0', '0', "00000000000000000000000000000000", "00000000000000000000000000000000", "00000000000000000000000000000001"), -- reg_0 -> reg1, reg_1 -> reg2 (0, 1)
        ("00010", "00011", "00000", '0', '1', "00000000000000000000000000000000", "00000000000000000000000000000010", "00000000000000000000000000000011"), -- reg_2 -> reg1, reg_3 -> reg2 (2, 3)
        ("00100", "00100", "00000", '0', '0', "00000000000000000000000000000000", "00000000000000000000000000000100", "00000000000000000000000000000000"), -- reg_4 -> reg1, reg_0 -> reg2 (4, 0)
        ("00000", "00000", "00000", '0', '1', "00000000000000000000000000000000", "00000000000000000000000000000000", "00000000000000000000000000000000")
     );
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
      clock <= patterns(i).clock;
      wait for 500 ps;
	  reg1 <= patterns(i).reg1;
	  reg2 <= patterns(i).reg2;
	  writeReg <= patterns(i).writeReg;
      WE <= patterns(i).WE;
      writeData <= patterns(i).writeData;
      --read1Data <= patterns(i).read1Data;
      --read2Data <= patterns(i).read2Data;
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
