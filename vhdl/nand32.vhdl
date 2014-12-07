library ieee;
use ieee.std_logic_1164.all;

entity nand32 is
    port (
        a, b : in std_logic_vector(31 downto 0);
        q : out std_logic_vector(31 downto 0)
    );
end nand32;

architecture struct of nand32 is
begin
    q(0) <= a(0) nand b(0) after 5 ps;
    q(1) <= a(1) nand b(1) after 5 ps;
    q(2) <= a(2) nand b(2) after 5 ps;
    q(3) <= a(3) nand b(3) after 5 ps;
    q(4) <= a(4) nand b(4) after 5 ps;
    q(5) <= a(5) nand b(5) after 5 ps;
    q(6) <= a(6) nand b(6) after 5 ps;
    q(7) <= a(7) nand b(7) after 5 ps;
    q(8) <= a(8) nand b(8) after 5 ps;
    q(9) <= a(9) nand b(9) after 5 ps;
    q(10) <= a(10) nand b(10) after 5 ps;
    q(11) <= a(11) nand b(11) after 5 ps;
    q(12) <= a(12) nand b(12) after 5 ps;
    q(13) <= a(13) nand b(13) after 5 ps;
    q(14) <= a(14) nand b(14) after 5 ps;
    q(15) <= a(15) nand b(15) after 5 ps;
    q(16) <= a(16) nand b(16) after 5 ps;
    q(17) <= a(17) nand b(17) after 5 ps;
    q(18) <= a(18) nand b(18) after 5 ps;
    q(19) <= a(19) nand b(19) after 5 ps;
    q(20) <= a(20) nand b(20) after 5 ps;
    q(21) <= a(21) nand b(21) after 5 ps;
    q(22) <= a(22) nand b(22) after 5 ps;
    q(23) <= a(23) nand b(23) after 5 ps;
    q(24) <= a(24) nand b(24) after 5 ps;
    q(25) <= a(25) nand b(25) after 5 ps;
    q(26) <= a(26) nand b(26) after 5 ps;
    q(27) <= a(27) nand b(27) after 5 ps;
    q(28) <= a(28) nand b(28) after 5 ps;
    q(29) <= a(29) nand b(29) after 5 ps;
    q(30) <= a(30) nand b(30) after 5 ps;
    q(31) <= a(31) nand b(31) after 5 ps;
end struct;
