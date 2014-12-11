from __future__ import print_function
"""assembler.py: Assembler for the mips-cpu project."""

__author__ = "Brandon Hoeksema"
__credits__ = ["Micah Russell", "Stephen Papierski"]
__version__ = "0.4"
__status__  = "Development"
__notes__ = "assembler.py must be run with python3"

#*************************************************************************************#
#--------------------------------------NOTES------------------------------------------
#    assembler.py must be run with python3
#    version 0.4) it supports single line comments using //


#--|------------------------|------------------|--------------------------------------|
#--|DESCRIPTION             |SYNTAX            |OPERATION                             |
#--|------------------------|------------------|--------------------------------------|
#--|add signed              |add $d $s $t      |$d <= $s + $t                         | 
#--|add unsigned            |addu $d $s $t     |$d <= $s + $t                         | 
#--|add unsigned immediate  |addiu $s $t imm   |$t <= $s + imm                        |     
#--|jump register           |jr $s             |PC <= $s                              | 
#--|nor                     |nor $d $s $t      |$d <= $s NOR $t                       |             
#--|set less than signed    |slt $d $s $t      |$d <= ($s < $t)?                      |     
#--|shift left logical      |sll $d $s shamt   |$d <= $s << shamt                     |         
#--|shfit right logical     |srl $d $s shamt   |                                      | 
#--|subtract                |sub $d $s $t      |$d <= $s - $t                         | 
#--|exclusive or            |xor $d $s $t      |$d <= $s XOR $t                       |             
#  |                        |                  |                                      | 
#--|add immediate           |addi $s $t imm    |$t <= $s + imm                        | 
#--|branch if equal         |beq $s $t offset  |if ($s == $t) PC <= branch address*   |         
#--|load word               |lw $t offset($s)  |$t <= MEM[$s + offset]                |     
#--|or immediate            |ori $s $t imm     |$t <= $s OR imm                       |     
#--|store word              |sw $t offset($s)  |MEM[$s + offset] <= $t                |             
#  |                        |                  |                                      |     
#--|stop processor          |halt              |                                      |     
#--|jump                    |j target          |PC <= jump address*                   |                     
#--|jump and link           |jal target        |$31 <= PC + 8; PC <= jump address*    |         
#--|------------------------|------------------|--------------------------------------|

# addiu is being treated as R type so that it has a function code, but it is really an I-type instruction
R = {
"add"   : "100000",
"addu"  : "100001",
"jr"    : "001000",
"nor"   : "100111",
"slt"   : "101010",
"sll"   : "000000",
"srl"   : "000010",
"sub"   : "100010",
"xor"   : "100110"
}

# moving addiu to R type instruction.  If this breaks it, will move it back
I = {
"addi"  : "001000",
"addiu" : "001001",
"beq"   : "000100",
"lw"    : "100011",
"ori"   : "001101",
"sw"    : "101011"
}

J = {
"halt" : "111111",
"j"    : "000010",
"jal"  : "000011"
}


def main(assemblyfile = "assembly.txt", executablefile = "sram64kx8.dat"):
    bin_instruction = ""
    instructions = []
    addresses = []
    address = 0
    assembly = open(assemblyfile, "r")
    for instr in assembly:
        instr = instr.replace("\n","")
        try:
            comment_idx = instr.index("//")
            instr = instr[:comment_idx]
        except:
            pass
        if instr != "":
            shamt = "00000"
            parts = instr.split()
            if len(parts) == 1: #halt?
                parts.append("0")
            if parts[0] in R.keys(): #R types
                opcode = "000000"
                funct = R[parts[0]]
                bin_instruction += opcode
                parts2 = parts[1:]
                count = 0
                imm = ""
                registers = "" 
                for item in parts2:
                    if item[0] == "$":
                        count += 1
                        registers += str((bin(int(item[1:]))[2:].zfill(5)))
                    else:
                        if funct != "001001":
                            shamt = bin(int(item,16))[2:].zfill(5)
                        else:
                            shamt = ""
                            imm = bin(int(item,16))[2:].zfill(16)
                if len(registers) == 10: # shift instructions: only use rs and rd
                    if imm:
                        bin_instruction += registers[5:] + registers[:5]
                    else:
                        bin_instruction += registers[5:] + "00000" + registers[:5]
                elif len(registers) == 5: # jr instruction: only uses rs
                    bin_instruction += registers[:] + "0000000000"
                else:
                    bin_instruction += registers[5:] + registers[:5]  # "normal" r-type instructions that use rd,rs,rt
                if imm:
                    shamt = ""
                    bin_instruction += imm
                bin_instruction += str(shamt) + funct
            else:
                if parts[0] in I.keys():
                    opcode = I[parts[0]]
                    parts2 = parts[1:]
                    bin_instruction += opcode
                    for item in parts2:
                        if item[0] == "$":
                            bin_instruction += bin(int(item[1:]))[2:].zfill(5)
                        else:
                            if opcode == "100011" or opcode == "101011":
                                offset = bin(int(item[:item.index("(")],16))[2:].zfill(16)
                                reg =    bin(int(item[item.index("(")+2:item.index(")")]))[2:].zfill(5)
                                bin_instruction = bin_instruction[:len(bin_instruction)-5] + reg + bin_instruction[len(bin_instruction)-5:] + offset
                            else:
                                bin_instruction += bin(int(item,16))[2:].zfill(16)
                    bin_instruction += ""
                else:
                    opcode = J[parts[0]]
                    bin_instruction += opcode + str(bin(int(parts[1],16))[2:].zfill(26))
            instruction = str(hex(int(bin_instruction,2)))[2:].zfill(8) #removes 0x prefix and pads to 8 characters
            instructions.append(instruction)
            addresses.append(hex(int(str(address)))[2:].zfill(8))
            address +=4
            bin_instruction=""
    executable = open(executablefile, "w")
    for i in range(len(addresses)):
        executable.write(addresses[i])
        executable.write(" ")
        executable.write(instructions[i])
        executable.write("\n")
    executable.close()



main("test_1.txt")
