library ieee;
use ieee.std_logic_1164.all;

entity Control is
    port (
        Operation: in std_logic_vector(31 downto 26);
        Func: in std_logic_vector(5 downto 0);
        Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1, MemToReg, Halt, addui: out std_logic;
        ALUSrc2, WriteRegDst, PCSrc, ALUOpType: out std_logic_vector(1 downto 0)
    );
end Control;

architecture behav of Control is
    --signals
begin
    process(Operation, Func)

    begin
            if (Operation = "000000") then
                if (Func = "100000") then
                    --add
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "00" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "01" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "00" after 20 ps;
                    addui <= '0' after 20 ps;
                elsif (Func = "001000") then
                    --jr
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '0' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    --ALUSrc1 <= '0' after 20 ps;
                    --ALUSrc2 <= "00" after 20 ps;
                    --MemToReg <= "00" after 20 ps;
                    --WriteRegDst <= "00" after 20 ps;
                    PCSrc <= "10" after 20 ps;
                    --ALUOpType <= "00" after 20 ps;
                    addui <= '0' after 20 ps;
                elsif (Func = "100111") then
                    --nor
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "00" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "01" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "10" after 20 ps;
                    addui <= '0' after 20 ps;
                elsif (Func = "101010") then
                    --slt
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "00" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "01" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "10" after 20 ps;
                    addui <= '0' after 20 ps;
                elsif (Func = "000000") then
                    --sll
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "10" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "01" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "10" after 20 ps;
                    addui <= '0' after 20 ps;
                elsif (Func = "000010") then
                    --srl
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "10" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "01" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "10" after 20 ps;
                    addui <= '0' after 20 ps;
                elsif (Func = "100010") then
                    --sub
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "00" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "01" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "01" after 20 ps;
                    addui <= '0' after 20 ps;
                elsif (Func = "100001") then
                    --addu
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "00" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "01" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "10" after 20 ps;
                    addui <= '0' after 20 ps;
                elsif (Func = "100110") then
                    --xor
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "00" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "01" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "10" after 20 ps;
                    addui <= '0' after 20 ps;
                end if;
            elsif (Operation = "000100") then
                --beq
                    Branch <= '1' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '0' after 20 ps;
                    SignExtend <= '1' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "00" after 20 ps;
                    --MemToReg <= "00" after 20 ps;
                    --WriteRegDst <= "00" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "01" after 20 ps;
                    addui <= '0' after 20 ps;
            elsif (Operation = "000010") then
                --j
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '0' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    --ALUSrc1 <= '0' after 20 ps;
                    --ALUSrc2 <= "00" after 20 ps;
                    --MemToReg <= "00" after 20 ps;
                    --WriteRegDst <= "00" after 20 ps;
                    PCSrc <= "01" after 20 ps;
                    --ALUOpType <= "00" after 20 ps;
                    addui <= '0' after 20 ps;
            elsif (Operation = "000011") then
                --jal
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '1' after 20 ps;
                    ALUSrc2 <= "11" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "10" after 20 ps;
                    PCSrc <= "01" after 20 ps;
                    ALUOpType <= "00" after 20 ps;
                    addui <= '0' after 20 ps;
            elsif (Operation = "100011") then
                --lw
                    Branch <= '0' after 20 ps;
                    MemRead <= '1' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '1' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "01" after 20 ps;
                    MemToReg <= '1' after 20 ps;
                    WriteRegDst <= "00" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "00" after 20 ps;
                    addui <= '0' after 20 ps;
            elsif (Operation = "001101") then
                --ori  
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '0' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "01" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "00" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "11" after 20 ps;
                    addui <= '0' after 20 ps;
            elsif (Operation = "101011") then
                --sw
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '1' after 20 ps;
                    RegWrite <= '0' after 20 ps;
                    SignExtend <= '1' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "01" after 20 ps;
                    --MemToReg <= "00" after 20 ps;
                    --WriteRegDst <= "00" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "00" after 20 ps;
                    addui <= '0' after 20 ps;
            elsif (Operation = "001000") then
                --addi
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '1' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "01" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "00" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "00" after 20 ps;
                    addui <= '0' after 20 ps;
            elsif (Operation = "001001") then
                --addui
                    Branch <= '0' after 20 ps;
                    MemRead <= '0' after 20 ps;
                    MemWrite <= '0' after 20 ps;
                    RegWrite <= '1' after 20 ps;
                    SignExtend <= '1' after 20 ps;
                    ALUSrc1 <= '0' after 20 ps;
                    ALUSrc2 <= "01" after 20 ps;
                    MemToReg <= '0' after 20 ps;
                    WriteRegDst <= "00" after 20 ps;
                    PCSrc <= "00" after 20 ps;
                    ALUOpType <= "10" after 20 ps;
                    addui <= '1' after 20 ps;
            elsif (Operation = "111111") then
                --halt
                    Halt <= '1' after 20 ps;
            end if;
    end process;
end behav;
