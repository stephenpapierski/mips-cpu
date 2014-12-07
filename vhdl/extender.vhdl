library ieee;
use ieee.std_logic_1164.all;

entity extender is
    port (
        imm : in std_logic_vector(15 downto 0); --immediate
        SignExt : in std_logic; --if operation is sign or unsigned extend
        extended : out std_logic_vector(31 downto 0)
    );
end extender;

architecture struct of extender is
    --signals
    signal extend_bit : std_logic;
    signal extension : std_logic_vector(15 downto 0); --extended msb
begin
    --do stuff
    extend_bit <= imm(15) and SignExt after 5 ps;
    process(extend_bit)
    begin
        for i in 0 to 15 loop
            extension(i) <= extend_bit;
        end loop;
    end process;

    extended <= extension & imm; --concatenate extended_msb with immediate


end struct;
