-- sram64kx8.vhdl
-- standard SRAM vhdl code, 64K*8 Bit,
--                          simplistic model without timing
--                          with startup initialization from file
--
-- (C) 2011,2013 Jonathan Geisler
--     modified to memory map I/O at the two highest addresses
--     NOTE: The changes required that the memory only respond to the
--         falling edges of NWE and NOE to work nicely with file I/O,
--         which actually makes it look more like a real memory unit.
--
-- (C) 2007 Jonathan Geisler
--     modified to work word (32-bits) at a time instead of byte at a time
--
-- (C) 1993,1994 Norman Hendrich, Dept. Computer Science
--                                University of Hamburg
--                                22041 Hamburg, Germany
--                                hendrich@informatik.uni-hamburg.de
--
-- initialization code taken and modified from DLX memory-behaviour.vhdl:
--                    Copyright (C) 1993, Peter J. Ashenden
--                    Mail:       Dept. Computer Science
--                                University of Adelaide, SA 5005, Australia
--                    e-mail:     petera@cs.adelaide.edu.au
--

use std.textio.all;
Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


entity sram64kx8 is

  generic (rom_data_file_name: string := "sram64kx8.dat");

  port (ncs : in std_logic;       -- not chip select
	addr: in std_logic_vector( 31 downto 0 );
        data: inout std_logic_vector( 31 downto 0 );
        nwe : in std_logic;       -- not write enable
        noe : in std_logic        -- not output enable
       );

end sram64kx8;

architecture sram_behaviour of sram64kx8 is
begin

   mem: process

      constant low_address: natural := 0;
      constant high_address: natural := 65535;  -- 64K SRAM

      subtype byte is std_logic_vector( 7 downto 0 );

      type memory_array is
         array (natural range low_address to high_address) of byte;

      variable mem: memory_array;
      variable address : integer;
      variable low_byte : integer;
      variable outL, inL : line;
      variable c : character;
      variable eol : boolean := true;



      procedure read_hex_integer(L: inout line; value: out integer) is
        variable ch: character;
        variable result: integer;
      begin
        result := 0;

        for i in 1 to 8 loop
          read(L, ch);
          if ('0' <= ch and ch <= '9') then
            result := result * 16 + character'pos(ch) - character'pos('0');
          else
            result := result * 16 + character'pos(ch) - character'pos('a') + 10;
          end if;
        end loop;

        value := result;
      end read_hex_integer;

      --
      -- load initial memory contents from text-file
      -- and print a copy to stdout...
      --
      procedure load( mem: out memory_array) is

        file binary_file : text is in rom_data_file_name;
        variable L : line;
        variable add, val, i : integer;
        variable c : character;

        variable val_bits : std_logic_vector(31 downto 0);

      begin
        write( output, "sram initialization:" );
        -- first initialize the RAM array with zeroes
        for add in low_address to high_address loop
           mem(add) := "00000000";
        end loop; 
        -- and now read the data file
        while not endfile(binary_file) loop
           readline(binary_file, L );
           read_hex_integer(L, add);
           read(L, c); -- delimiting space
           read_hex_integer(L, val);

           --
           write( L, add);
           write( L, ' ' );
           write( L, val);
           writeline( output, L );
           --
           val_bits := conv_std_logic_vector(val, 32);
           mem( add ) := val_bits(7 downto 0);
           mem( add + 1 ) := val_bits(15 downto 8);
           mem( add + 2 ) := val_bits(23 downto 16);
           mem( add + 3 ) := val_bits(31 downto 24);
        end loop;
      end load;



   begin
      load( mem );
      data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
      --
      --
      -- process memory cycles
      --
      loop
	  if (ncs = '0') then
            -- decode address
            address := conv_integer( addr(15 downto 0) );
            -- 
            if falling_edge(nwe) then
               --- write cycle
               if address = 65532 then
		  low_byte := conv_integer(data(7 downto 0));
		  if low_byte = 10 then
		    writeline(output, outL);
		  else
	            write(outL, character'val(low_byte));
		  end if;
               else
                  mem( address ) := data(7 downto 0);
                  mem( address + 1 ) := data(15 downto 8);
                  mem( address + 2 ) := data(23 downto 16);
                  mem( address + 3 ) := data(31 downto 24);
               end if;

               data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
            elsif nwe = '1' then
               -- read cycle
               if falling_edge(noe) then
		  if address = 65528 then
		    read(inL, c, eol);
		    while not eol loop
		      readline(input, inL);
		      read(inL, c, eol);
		    end loop;

		    data(7 downto 0) <= conv_std_logic_vector(character'pos(c), 8);
		    data(15 downto 8) <= "00000000";
		    data(23 downto 16) <= "00000000";
		    data(31 downto 24) <= "00000000";
		  else
                    data(7 downto 0) <= mem( address );
                    data(15 downto 8) <= mem( address + 1);
                    data(23 downto 16) <= mem( address + 2);
                    data(31 downto 24) <= mem( address + 3);
		  end if;
	       elsif rising_edge(noe) then
                  data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
               end if;
            end if;
	  end if;

         wait on ncs, nwe, noe, addr, data; -- FNH, 29.1.99: added data
      end loop;

      writeline(output, outL);
   end process;


end sram_behaviour;


configuration cfg_sram of sram64kx8 is
   for sram_behaviour
   end for;
end cfg_sram;
