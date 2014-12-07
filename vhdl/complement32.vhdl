library ieee;
use ieee.std_logic_1164.all;

entity complement32 is
    port (
        a : in std_logic_vector(31 downto 0);
        q : out std_logic_vector(31 downto 0)
    );
end complement32;

architecture struct of complement32 is
begin
    q(0) <=  not a(0) after 5 ps;
    q(1) <=  not a(1) after 5 ps;
    q(2) <=  not a(2) after 5 ps;
    q(3) <=  not a(3) after 5 ps;
    q(4) <=  not a(4) after 5 ps;
    q(5) <=  not a(5) after 5 ps;
    q(6) <=  not a(6) after 5 ps;
    q(7) <=  not a(7) after 5 ps;
    q(8) <=  not a(8) after 5 ps;
    q(9) <=  not a(9) after 5 ps;
    q(10) <= not a(10) after 5 ps;
    q(11) <= not a(11) after 5 ps;
    q(12) <= not a(12) after 5 ps;
    q(13) <= not a(13) after 5 ps;
    q(14) <= not a(14) after 5 ps;
    q(15) <= not a(15) after 5 ps;
    q(16) <= not a(16) after 5 ps;
    q(17) <= not a(17) after 5 ps;
    q(18) <= not a(18) after 5 ps;
    q(19) <= not a(19) after 5 ps;
    q(20) <= not a(20) after 5 ps;
    q(21) <= not a(21) after 5 ps;
    q(22) <= not a(22) after 5 ps;
    q(23) <= not a(23) after 5 ps;
    q(24) <= not a(24) after 5 ps;
    q(25) <= not a(25) after 5 ps;
    q(26) <= not a(26) after 5 ps;
    q(27) <= not a(27) after 5 ps;
    q(28) <= not a(28) after 5 ps;
    q(29) <= not a(29) after 5 ps;
    q(30) <= not a(30) after 5 ps;
    q(31) <= not a(31) after 5 ps;
end struct;
