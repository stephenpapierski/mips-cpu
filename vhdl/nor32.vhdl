library ieee;
use ieee.std_logic_1164.all;

entity nor32 is
    port (
        a, b : in std_logic_vector(31 downto 0);
        q : out std_logic_vector(31 downto 0)
    );
end nor32;

architecture struct of nor32 is
begin
    q(0) <= a(0) nor b(0) after 5 ps;
    q(1) <= a(1) nor b(1) after 5 ps;
    q(2) <= a(2) nor b(2) after 5 ps;
    q(3) <= a(3) nor b(3) after 5 ps;
    q(4) <= a(4) nor b(4) after 5 ps;
    q(5) <= a(5) nor b(5) after 5 ps;
    q(6) <= a(6) nor b(6) after 5 ps;
    q(7) <= a(7) nor b(7) after 5 ps;
    q(8) <= a(8) nor b(8) after 5 ps;
    q(9) <= a(9) nor b(9) after 5 ps;
    q(10) <= a(10) nor b(10) after 5 ps;
    q(11) <= a(11) nor b(11) after 5 ps;
    q(12) <= a(12) nor b(12) after 5 ps;
    q(13) <= a(13) nor b(13) after 5 ps;
    q(14) <= a(14) nor b(14) after 5 ps;
    q(15) <= a(15) nor b(15) after 5 ps;
    q(16) <= a(16) nor b(16) after 5 ps;
    q(17) <= a(17) nor b(17) after 5 ps;
    q(18) <= a(18) nor b(18) after 5 ps;
    q(19) <= a(19) nor b(19) after 5 ps;
    q(20) <= a(20) nor b(20) after 5 ps;
    q(21) <= a(21) nor b(21) after 5 ps;
    q(22) <= a(22) nor b(22) after 5 ps;
    q(23) <= a(23) nor b(23) after 5 ps;
    q(24) <= a(24) nor b(24) after 5 ps;
    q(25) <= a(25) nor b(25) after 5 ps;
    q(26) <= a(26) nor b(26) after 5 ps;
    q(27) <= a(27) nor b(27) after 5 ps;
    q(28) <= a(28) nor b(28) after 5 ps;
    q(29) <= a(29) nor b(29) after 5 ps;
    q(30) <= a(30) nor b(30) after 5 ps;
    q(31) <= a(31) nor b(31) after 5 ps;
end struct;
