from __future__ import print_function
# addiu is being treated as R type so that it has a function code, but it is really an I-type instruction
R = {
"add"   : "100000",
"addu"  : "100001",
"addiu" : "001001",
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
        if instr != "":
            shamt = "00000"
            parts = instr.split()
            if len(parts) == 1:
                parts.append("0")
            if parts[0] in R.keys():
                opcode = "000000"
                funct = R[parts[0]]
                bin_instruction += opcode
                parts2 = parts[1].split(",")
                count = 0
                registers = "" 
                for item in parts2:
                    if item[0] == "$":
                        count += 1
                        registers += str((bin(int(item[1:]))[2:].zfill(5)))
                    else:
                        shamt = bin(int(item,16))[2:].zfill(5)
                if len(registers) == 10: # shift instructions: only use rs and rd
                    bin_instruction += registers[0:5] + "00000" + registers[5:]
                elif len(registers) == 5: # jr instruction: only uses rs
                    bin_instruction += registers[:] + "0000000000"
                else:
                    bin_instruction += registers[:]  # "normal" r-type instructions that use rd,rs,rt
                bin_instruction += str(shamt) + funct
            else:
                if parts[0] in I.keys():
                    opcode = I[parts[0]]
                    parts2 = parts[1].split(",")
                    bin_instruction += opcode
                    for item in parts2:
                        if item[0] == "$":
                            bin_instruction += bin(int(item[1:]))[2:].zfill(5)
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



#main("brandon_micah.txt", "foo.dat")
main("test_1.txt")
