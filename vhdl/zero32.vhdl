library ieee;
use ieee.std_logic_1164.all;

entity zero32 is
    port(
        a : in std_logic_vector(31 downto 0);
        q : out std_logic
    );
end zero32;

architecture struct of zero32 is
    signal zero0, zero1, zero2, zero3 : std_logic;
begin
    zero0 <= (a(0) nor a(1)) and (a(2) nor a(3)) and (a(4) nor a(5)) and (a(6) nor a(7)) after 10 ps;
    zero1 <= (a(8) nor a(9)) and (a(10) nor a(11)) and (a(12) nor a(13)) and (a(14) nor a(15)) after 10 ps;
    zero2 <= (a(16) nor a(17)) and (a(18) nor a(19)) and (a(20) nor a(21)) and (a(22) nor a(23)) after 10 ps;
    zero3 <= (a(24) nor a(25)) and (a(26) nor a(27)) and (a(28) nor a(29)) and (a(30) nor a(31)) after 10 ps;

    q <= zero0 and zero1 and zero2 and zero3 after 5 ps;
end struct;
