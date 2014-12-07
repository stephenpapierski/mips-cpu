library ieee;
use ieee.std_logic_1164.all;

entity set_less_than is
    port (
        a, b : in std_logic_vector(31 downto 0);
        q : out std_logic_vector(31 downto 0)
    );
end set_less_than;

architecture struct of set_less_than is
    signal difference : std_logic_vector(31 downto 0);
begin
    subtract: entity work.adder32(struct) port map (a, b, '1', '1', difference);

    q(31) <= '0';
    q(30) <= '0';
    q(29) <= '0';
    q(28) <= '0';
    q(27) <= '0';
    q(26) <= '0';
    q(25) <= '0';
    q(24) <= '0';
    q(23) <= '0';
    q(22) <= '0';
    q(21) <= '0';
    q(20) <= '0';
    q(19) <= '0';
    q(18) <= '0';
    q(17) <= '0';
    q(16) <= '0';
    q(15) <= '0';
    q(14) <= '0';
    q(13) <= '0';
    q(12) <= '0';
    q(11) <= '0';
    q(10) <= '0';
    q(9) <= '0';
    q(8) <= '0';
    q(7) <= '0';
    q(6) <= '0';
    q(5) <= '0';
    q(4) <= '0';
    q(3) <= '0';
    q(2) <= '0';
    q(1) <= '0';
    q(0) <= difference(31);
end struct;
