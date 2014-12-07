library ieee;
use ieee.std_logic_1164.all;

entity ALUControl is
    port(
        OpType: in std_logic_vector(1 downto 0);
        Func: in std_logic_vector(5 downto 0);
        Operation: out std_logic_vector(3 downto 0)
    );
end ALUControl;

architecture behav of ALUControl is
    --signals
begin
    process(OpType, Func)
    begin
        if (OpType = "00") then
            Operation <= "0000";
        elsif (OpType = "01") then
            Operation <= "0100";
        elsif (OpType = "10") then
            if (Func = "100111") then
                --nor
                Operation <= "1001";
            elsif (Func = "101010") then
                --slt
                Operation <= "0101";
            elsif (Func = "000000") then
                --sll
                Operation <= "0010";
            elsif (Func = "000010") then
                --srl
                Operation <= "0011";
            elsif (Func = "100001") then
                --addu
                Operation <= "0001";
            elsif (Func = "001001") then
                --addui
                Operation <= "0001";
            elsif (Func = "100110") then
                --xor
                Operation <= "1000";
            end if;
        elsif (OpType = "11") then
            Operation <= "1001";
        end if;
    end process;
end behav;
