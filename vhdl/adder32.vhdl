library ieee;
use ieee.std_logic_1164.all;

entity adder32 is
    port (
        a, b : in std_logic_vector(31 downto 0);
        subtract, signed_operation : in std_logic; --0 for add, 1 for subtract
        sum : out std_logic_vector(31 downto 0);
        overflow, carryout : out std_logic
    );
end adder32;

architecture struct of adder32 is
    signal b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20, b21, b22, b23, b24, b25, b26, b27, b28, b29, b30, b31, c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31, s31, zero0, zero1, zero2, zero3, signed_add_overflow, signed_subtract_overflow, unsigned_add_overflow : std_logic;
begin
    b0 <= b(0) xor subtract after 5 ps;
    b1 <= b(1) xor subtract after 5 ps;
    b2 <= b(2) xor subtract after 5 ps;
    b3 <= b(3) xor subtract after 5 ps;
    b4 <= b(4) xor subtract after 5 ps;
    b5 <= b(5) xor subtract after 5 ps;
    b6 <= b(6) xor subtract after 5 ps;
    b7 <= b(7) xor subtract after 5 ps;
    b8 <= b(8) xor subtract after 5 ps;
    b9 <= b(9) xor subtract after 5 ps;
    b10 <= b(10) xor subtract after 5 ps;
    b11 <= b(11) xor subtract after 5 ps;
    b12 <= b(12) xor subtract after 5 ps;
    b13 <= b(13) xor subtract after 5 ps;
    b14 <= b(14) xor subtract after 5 ps;
    b15 <= b(15) xor subtract after 5 ps;
    b16 <= b(16) xor subtract after 5 ps;
    b17 <= b(17) xor subtract after 5 ps;
    b18 <= b(18) xor subtract after 5 ps;
    b19 <= b(19) xor subtract after 5 ps;
    b20 <= b(20) xor subtract after 5 ps;
    b21 <= b(21) xor subtract after 5 ps;
    b22 <= b(22) xor subtract after 5 ps;
    b23 <= b(23) xor subtract after 5 ps;
    b24 <= b(24) xor subtract after 5 ps;
    b25 <= b(25) xor subtract after 5 ps;
    b26 <= b(26) xor subtract after 5 ps;
    b27 <= b(27) xor subtract after 5 ps;
    b28 <= b(28) xor subtract after 5 ps;
    b29 <= b(29) xor subtract after 5 ps;
    b30 <= b(30) xor subtract after 5 ps;
    b31 <= b(31) xor subtract after 5 ps;

    adder0: entity work.full_adder(struct) port map (a(0), b0, subtract, sum(0), c0);
    adder1: entity work.full_adder(struct) port map (a(1), b1, c0, sum(1), c1);
    adder2: entity work.full_adder(struct) port map (a(2), b2, c1, sum(2), c2);
    adder3: entity work.full_adder(struct) port map (a(3), b3, c2, sum(3), c3);
    adder4: entity work.full_adder(struct) port map (a(4), b4, c3, sum(4), c4);
    adder5: entity work.full_adder(struct) port map (a(5), b5, c4, sum(5), c5);
    adder6: entity work.full_adder(struct) port map (a(6), b6, c5, sum(6), c6);
    adder7: entity work.full_adder(struct) port map (a(7), b7, c6, sum(7), c7);
    adder8: entity work.full_adder(struct) port map (a(8), b8, c7, sum(8), c8);
    adder9: entity work.full_adder(struct) port map (a(9), b9, c8, sum(9), c9);
    adder10: entity work.full_adder(struct) port map (a(10), b10, c9, sum(10), c10);
    adder11: entity work.full_adder(struct) port map (a(11), b11, c10, sum(11), c11);
    adder12: entity work.full_adder(struct) port map (a(12), b12, c11, sum(12), c12);
    adder13: entity work.full_adder(struct) port map (a(13), b13, c12, sum(13), c13);
    adder14: entity work.full_adder(struct) port map (a(14), b14, c13, sum(14), c14);
    adder15: entity work.full_adder(struct) port map (a(15), b15, c14, sum(15), c15);
    adder16: entity work.full_adder(struct) port map (a(16), b16, c15, sum(16), c16);
    adder17: entity work.full_adder(struct) port map (a(17), b17, c16, sum(17), c17);
    adder18: entity work.full_adder(struct) port map (a(18), b18, c17, sum(18), c18);
    adder19: entity work.full_adder(struct) port map (a(19), b19, c18, sum(19), c19);
    adder20: entity work.full_adder(struct) port map (a(20), b20, c19, sum(20), c20);
    adder21: entity work.full_adder(struct) port map (a(21), b21, c20, sum(21), c21);
    adder22: entity work.full_adder(struct) port map (a(22), b22, c21, sum(22), c22);
    adder23: entity work.full_adder(struct) port map (a(23), b23, c22, sum(23), c23);
    adder24: entity work.full_adder(struct) port map (a(24), b24, c23, sum(24), c24);
    adder25: entity work.full_adder(struct) port map (a(25), b25, c24, sum(25), c25);
    adder26: entity work.full_adder(struct) port map (a(26), b26, c25, sum(26), c26);
    adder27: entity work.full_adder(struct) port map (a(27), b27, c26, sum(27), c27);
    adder28: entity work.full_adder(struct) port map (a(28), b28, c27, sum(28), c28);
    adder29: entity work.full_adder(struct) port map (a(29), b29, c28, sum(29), c29);
    adder30: entity work.full_adder(struct) port map (a(30), b30, c29, sum(30), c30);
    adder31: entity work.full_adder(struct) port map (a(31), b31, c30, s31, c31);

    sum(31) <= s31;


    --FLAG BITS

    --carryout
    carryout <= c31;

    --overflow
    signed_add_overflow <= (not a(31) and not b(31) and s31) or (a(31) and b(31) and not s31) after 15 ps;
    signed_subtract_overflow <= (not a(31) and b(31) and s31) or (a(31) and not b(31) and not s31) after 15 ps;
    unsigned_add_overflow <= c31;

    mux1: entity work.mux4to1_bit(struct) port map (unsigned_add_overflow, signed_add_overflow, signed_subtract_overflow, signed_subtract_overflow, subtract, signed_operation, overflow);


end struct;
