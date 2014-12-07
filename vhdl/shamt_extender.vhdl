library ieee;
use ieee.std_logic_1164.all;

entity shamt_extender is
    port (
        shamt : in std_logic_vector(4 downto 0);
        extended : out std_logic_vector(31 downto 0) --zero extended shamt value
    );
end shamt_extender;

architecture struct of shamt_extender is
    --signals
    signal zeros: std_logic_vector(26 downto 0);
begin
    zeros <= "000000000000000000000000000";

    extended <= zeros & shamt;
end struct;
