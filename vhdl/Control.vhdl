library ieee;
use ieee.std_logic_1164.all;

entity Control is
    port (
        Operation: in std_logic_vector(31 downto 26);
        Func: in std_logic_vector(5 downto 0);
        Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1, MemToReg: out std_logic;
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
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "00";
                    MemToReg <= '0';
                    WriteRegDst <= "01";
                    PCSrc <= "00";
                    ALUOpType <= "00";
                elsif (Func = "001000") then
                    --jr
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '0';
                    SignExtend <= '0';
                    --ALUSrc1 <= '0';
                    --ALUSrc2 <= "00";
                    --MemToReg <= "00";
                    --WriteRegDst <= "00";
                    PCSrc <= "10";
                    --ALUOpType <= "00";
                elsif (Func = "100111") then
                    --nor
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "00";
                    MemToReg <= '0';
                    WriteRegDst <= "01";
                    PCSrc <= "00";
                    ALUOpType <= "10";
                elsif (Func = "101010") then
                    --slt
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "00";
                    MemToReg <= '0';
                    WriteRegDst <= "01";
                    PCSrc <= "00";
                    ALUOpType <= "10";
                elsif (Func = "000000") then
                    --sll
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "10";
                    MemToReg <= '0';
                    WriteRegDst <= "01";
                    PCSrc <= "00";
                    ALUOpType <= "10";
                elsif (Func = "000010") then
                    --srl
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "10";
                    MemToReg <= '0';
                    WriteRegDst <= "01";
                    PCSrc <= "00";
                    ALUOpType <= "10";
                elsif (Func = "100010") then
                    --sub
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "00";
                    MemToReg <= '0';
                    WriteRegDst <= "01";
                    PCSrc <= "00";
                    ALUOpType <= "01";
                elsif (Func = "100001") then
                    --addu
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "00";
                    MemToReg <= '0';
                    WriteRegDst <= "01";
                    PCSrc <= "00";
                    ALUOpType <= "10";
                elsif (Func = "100110") then
                    --xor
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "00";
                    MemToReg <= '0';
                    WriteRegDst <= "01";
                    PCSrc <= "00";
                    ALUOpType <= "10";
                elsif (Func = "001001") then
                    --addui
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '1';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "01";
                    MemToReg <= '0';
                    WriteRegDst <= "00";
                    PCSrc <= "00";
                    ALUOpType <= "10";
                end if;
            elsif (Operation = "000100") then
                --beq
                    Branch <= '1';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '0';
                    SignExtend <= '1';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "01";
                    --MemToReg <= "00";
                    --WriteRegDst <= "00";
                    PCSrc <= "00";
                    ALUOpType <= "01";
            elsif (Operation = "000010") then
                --j
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '0';
                    SignExtend <= '0';
                    --ALUSrc1 <= '0';
                    --ALUSrc2 <= "00";
                    --MemToReg <= "00";
                    --WriteRegDst <= "00";
                    PCSrc <= "01";
                    --ALUOpType <= "00";
            elsif (Operation = "000011") then
                --jal
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '1';
                    ALUSrc2 <= "11";
                    MemToReg <= '0';
                    WriteRegDst <= "10";
                    PCSrc <= "01";
                    ALUOpType <= "00";
            elsif (Operation = "100011") then
                --lw
                    Branch <= '0';
                    MemRead <= '1';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '1';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "01";
                    MemToReg <= '1';
                    WriteRegDst <= "00";
                    PCSrc <= "00";
                    ALUOpType <= "00";
            elsif (Operation = "001101") then
                --ori  --NEEDS SOME WORK
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '0';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "01";
                    MemToReg <= '0';
                    WriteRegDst <= "00";
                    PCSrc <= "00";
                    ALUOpType <= "11";
            elsif (Operation = "101011") then
                --sw
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '1';
                    RegWrite <= '0';
                    SignExtend <= '1';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "01";
                    --MemToReg <= "00";
                    --WriteRegDst <= "00";
                    PCSrc <= "00";
                    ALUOpType <= "00";
            elsif (Operation = "001000") then
                --addi
                    Branch <= '0';
                    MemRead <= '0';
                    MemWrite <= '0';
                    RegWrite <= '1';
                    SignExtend <= '1';
                    ALUSrc1 <= '0';
                    ALUSrc2 <= "01";
                    MemToReg <= '0';
                    WriteRegDst <= "00";
                    PCSrc <= "00";
                    ALUOpType <= "00";
            end if;
    end process;
end behav;
