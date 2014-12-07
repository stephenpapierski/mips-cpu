library ieee;
use ieee.std_logic_1164.all;

entity xor32 is
    port (
        a, b : in std_logic_vector(31 downto 0);
        q : out std_logic_vector(31 downto 0)
    );
end xor32;

architecture struct of xor32 is
begin
    q(0) <= a(0) xor b(0) after 5 ps;
    q(1) <= a(1) xor b(1) after 5 ps;
    q(2) <= a(2) xor b(2) after 5 ps;
    q(3) <= a(3) xor b(3) after 5 ps;
    q(4) <= a(4) xor b(4) after 5 ps;
    q(5) <= a(5) xor b(5) after 5 ps;
    q(6) <= a(6) xor b(6) after 5 ps;
    q(7) <= a(7) xor b(7) after 5 ps;
    q(8) <= a(8) xor b(8) after 5 ps;
    q(9) <= a(9) xor b(9) after 5 ps;
    q(10) <= a(10) xor b(10) after 5 ps;
    q(11) <= a(11) xor b(11) after 5 ps;
    q(12) <= a(12) xor b(12) after 5 ps;
    q(13) <= a(13) xor b(13) after 5 ps;
    q(14) <= a(14) xor b(14) after 5 ps;
    q(15) <= a(15) xor b(15) after 5 ps;
    q(16) <= a(16) xor b(16) after 5 ps;
    q(17) <= a(17) xor b(17) after 5 ps;
    q(18) <= a(18) xor b(18) after 5 ps;
    q(19) <= a(19) xor b(19) after 5 ps;
    q(20) <= a(20) xor b(20) after 5 ps;
    q(21) <= a(21) xor b(21) after 5 ps;
    q(22) <= a(22) xor b(22) after 5 ps;
    q(23) <= a(23) xor b(23) after 5 ps;
    q(24) <= a(24) xor b(24) after 5 ps;
    q(25) <= a(25) xor b(25) after 5 ps;
    q(26) <= a(26) xor b(26) after 5 ps;
    q(27) <= a(27) xor b(27) after 5 ps;
    q(28) <= a(28) xor b(28) after 5 ps;
    q(29) <= a(29) xor b(29) after 5 ps;
    q(30) <= a(30) xor b(30) after 5 ps;
    q(31) <= a(31) xor b(31) after 5 ps;
end struct;
