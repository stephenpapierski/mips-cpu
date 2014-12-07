library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter32 is
    port (
        a, b : in std_logic_vector(31 downto 0);
        direction : in std_logic; -- 0 = left, 1 = right
        q : out std_logic_vector(31 downto 0);
        overflow, carryout : out std_logic
    );
end shifter32;

architecture struct of shifter32 is
    signal r, l, overflow_check : std_logic_vector(31 downto 0);
    signal over0, over1, over2, over3, over4, over5, over6, over7, over8, over9, over10, over11, over12, over13, over14, over15, over16, over17, over18, over19, over20, over21, over22, over23, over24, over25, over26, over27, over28, over29, over30, over31: std_logic_vector(31 downto 0) := (others => '0');
    signal amount : std_logic_vector(4 downto 0);
    signal zero_bit, lcarryout, rcarryout, overflow_zero : std_logic;
    signal direction_vec : std_logic_vector(0 downto 0);
begin
    direction_vec(0) <= direction;
    zero_bit <= '0';
    amount(0) <= b(0);
    amount(1) <= b(1);
    amount(2) <= b(2);
    amount(3) <= b(3);
    amount(4) <= b(4);

    left_0: entity work.mux32to1_bit(struct) port map (a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(0));

    left_1: entity work.mux32to1_bit(struct) port map (a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(1));

    left_2: entity work.mux32to1_bit(struct) port map (a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(2));

    left_3: entity work.mux32to1_bit(struct) port map (a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(3));

    left_4: entity work.mux32to1_bit(struct) port map (a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(4));

    left_5: entity work.mux32to1_bit(struct) port map (a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(5));

    left_6: entity work.mux32to1_bit(struct) port map (a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(6));

    left_7: entity work.mux32to1_bit(struct) port map (a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(7));

    left_8: entity work.mux32to1_bit(struct) port map (a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(8));

    left_9: entity work.mux32to1_bit(struct) port map (a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(9));

    left_10: entity work.mux32to1_bit(struct) port map (a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(10));

    left_11: entity work.mux32to1_bit(struct) port map (a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(11));

    left_12: entity work.mux32to1_bit(struct) port map (a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(12));

    left_13: entity work.mux32to1_bit(struct) port map (a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(13));

    left_14: entity work.mux32to1_bit(struct) port map (a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(14));

    left_15: entity work.mux32to1_bit(struct) port map (a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(15));

    left_16: entity work.mux32to1_bit(struct) port map (a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(16));

    left_17: entity work.mux32to1_bit(struct) port map (a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(17));

    left_18: entity work.mux32to1_bit(struct) port map (a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(18));

    left_19: entity work.mux32to1_bit(struct) port map (a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(19));

    left_20: entity work.mux32to1_bit(struct) port map (a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(20));

    left_21: entity work.mux32to1_bit(struct) port map (a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(21));

    left_22: entity work.mux32to1_bit(struct) port map (a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(22));

    left_23: entity work.mux32to1_bit(struct) port map (a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(23));

    left_24: entity work.mux32to1_bit(struct) port map (a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(24));

    left_25: entity work.mux32to1_bit(struct) port map (a(25), a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(25));

    left_26: entity work.mux32to1_bit(struct) port map (a(26), a(25), a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, l(26));

    left_27: entity work.mux32to1_bit(struct) port map (a(27), a(26), a(25), a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, zero_bit, amount, l(27));

    left_28: entity work.mux32to1_bit(struct) port map (a(28), a(27), a(26), a(25), a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, zero_bit, amount, l(28));

    left_29: entity work.mux32to1_bit(struct) port map (a(29), a(28), a(27), a(26), a(25), a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, zero_bit, amount, l(29));

    left_30: entity work.mux32to1_bit(struct) port map (a(30), a(29), a(28), a(27), a(26), a(25), a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), zero_bit, amount, l(30));

    left_31: entity work.mux32to1_bit(struct) port map (a(31), a(30), a(29), a(28), a(27), a(26), a(25), a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), a(0), amount, l(31));


    right_0: entity work.mux32to1_bit(struct) port map (a(0), a(1), a(2), a(3), a(4), a(5), a(6), a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), amount, r(0));

    right_1: entity work.mux32to1_bit(struct) port map (a(1), a(2), a(3), a(4), a(5), a(6), a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, amount, r(1));

    right_2: entity work.mux32to1_bit(struct) port map (a(2), a(3), a(4), a(5), a(6), a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, amount, r(2));

    right_3: entity work.mux32to1_bit(struct) port map (a(3), a(4), a(5), a(6), a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, amount, r(3));

    right_4: entity work.mux32to1_bit(struct) port map (a(4), a(5), a(6), a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, amount, r(4));

    right_5: entity work.mux32to1_bit(struct) port map (a(5), a(6), a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(5));

    right_6: entity work.mux32to1_bit(struct) port map (a(6), a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(6));

    right_7: entity work.mux32to1_bit(struct) port map (a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(7));

    right_8: entity work.mux32to1_bit(struct) port map (a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(8));

    right_9: entity work.mux32to1_bit(struct) port map (a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(9));

    right_10: entity work.mux32to1_bit(struct) port map (a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(10));

    right_11: entity work.mux32to1_bit(struct) port map (a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(11));

    right_12: entity work.mux32to1_bit(struct) port map (a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(12));

    right_13: entity work.mux32to1_bit(struct) port map (a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(13));

    right_14: entity work.mux32to1_bit(struct) port map (a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(14));

    right_15: entity work.mux32to1_bit(struct) port map (a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(15));

    right_16: entity work.mux32to1_bit(struct) port map (a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(16));

    right_17: entity work.mux32to1_bit(struct) port map (a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(17));

    right_18: entity work.mux32to1_bit(struct) port map (a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(18));

    right_19: entity work.mux32to1_bit(struct) port map (a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(19));

    right_20: entity work.mux32to1_bit(struct) port map (a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(20));

    right_21: entity work.mux32to1_bit(struct) port map (a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(21));

    right_22: entity work.mux32to1_bit(struct) port map (a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(22));

    right_23: entity work.mux32to1_bit(struct) port map (a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(23));

    right_24: entity work.mux32to1_bit(struct) port map (a(24), a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(24));

    right_25: entity work.mux32to1_bit(struct) port map (a(25), a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(25));

    right_26: entity work.mux32to1_bit(struct) port map (a(26), a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(26));

    right_27: entity work.mux32to1_bit(struct) port map (a(27), a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(27));

    right_28: entity work.mux32to1_bit(struct) port map (a(28), a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(28));

    right_29: entity work.mux32to1_bit(struct) port map (a(29), a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(29));

    right_30: entity work.mux32to1_bit(struct) port map (a(30), a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(30));

    right_31: entity work.mux32to1_bit(struct) port map (a(31), zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, zero_bit, amount, r(31));


--CARRYOUT
    mux2to1_0: entity work.mux2to1(struct) port map (l, r, direction_vec, q);

    lcarryout_mux : entity work.mux32to1_bit(struct) port map (zero_bit, a(31), a(30), a(29), a(28), a(27), a(26), a(25), a(24), a(23), a(22), a(21), a(20), a(19), a(18), a(17), a(16), a(15), a(14), a(13), a(12), a(11), a(10), a(9), a(8), a(7), a(6), a(5), a(4), a(3), a(2), a(1), amount, lcarryout);

    rcarryout_mux : entity work.mux32to1_bit(struct) port map (zero_bit, a(0), a(1), a(2), a(3), a(4), a(5), a(6), a(7), a(8), a(9), a(10), a(11), a(12), a(13), a(14), a(15), a(16), a(17), a(18), a(19), a(20), a(21), a(22), a(23), a(24), a(25), a(26), a(27), a(28), a(29), a(30), amount, rcarryout);

    carryout_mux : entity work.mux2to1_bit(struct) port map (lcarryout, rcarryout, direction, carryout);


--OVERFLOW
    --overflow1 : entity work.zero32(struct) port map (a,overflow);

    over1(0) <= a(31);

    over2(0) <= a(31);
    over2(1) <= a(30);

    over3(0) <= a(31);
    over3(1) <= a(30);
    over3(2) <= a(29);

    over4(0) <= a(31);
    over4(1) <= a(30);
    over4(2) <= a(29);
    over4(3) <= a(28);

    over5(0) <= a(31);
    over5(1) <= a(30);
    over5(2) <= a(29);
    over5(3) <= a(28);
    over5(4) <= a(27);

    over6(0) <= a(31);
    over6(1) <= a(30);
    over6(2) <= a(29);
    over6(3) <= a(28);
    over6(4) <= a(27);
    over6(5) <= a(26);

    over7(0) <= a(31);
    over7(1) <= a(30);
    over7(2) <= a(29);
    over7(3) <= a(28);
    over7(4) <= a(27);
    over7(5) <= a(26);
    over7(6) <= a(25);

    over8(0) <= a(31);
    over8(1) <= a(30);
    over8(2) <= a(29);
    over8(3) <= a(28);
    over8(4) <= a(27);
    over8(5) <= a(26);
    over8(6) <= a(25);
    over8(7) <= a(24);

    over9(0) <= a(31);
    over9(1) <= a(30);
    over9(2) <= a(29);
    over9(3) <= a(28);
    over9(4) <= a(27);
    over9(5) <= a(26);
    over9(6) <= a(25);
    over9(7) <= a(24);
    over9(8) <= a(23);

    over10(0) <= a(31);
    over10(1) <= a(30);
    over10(2) <= a(29);
    over10(3) <= a(28);
    over10(4) <= a(27);
    over10(5) <= a(26);
    over10(6) <= a(25);
    over10(7) <= a(24);
    over10(8) <= a(23);
    over10(9) <= a(22);

    over11(0) <= a(31);
    over11(1) <= a(30);
    over11(2) <= a(29);
    over11(3) <= a(28);
    over11(4) <= a(27);
    over11(5) <= a(26);
    over11(6) <= a(25);
    over11(7) <= a(24);
    over11(8) <= a(23);
    over11(9) <= a(22);
    over11(10) <= a(21);

    over12(0) <= a(31);
    over12(1) <= a(30);
    over12(2) <= a(29);
    over12(3) <= a(28);
    over12(4) <= a(27);
    over12(5) <= a(26);
    over12(6) <= a(25);
    over12(7) <= a(24);
    over12(8) <= a(23);
    over12(9) <= a(22);
    over12(10) <= a(21);
    over12(11) <= a(20);

    over13(0) <= a(31);
    over13(1) <= a(30);
    over13(2) <= a(29);
    over13(3) <= a(28);
    over13(4) <= a(27);
    over13(5) <= a(26);
    over13(6) <= a(25);
    over13(7) <= a(24);
    over13(8) <= a(23);
    over13(9) <= a(22);
    over13(10) <= a(21);
    over13(11) <= a(20);
    over13(12) <= a(19);

    over14(0) <= a(31);
    over14(1) <= a(30);
    over14(2) <= a(29);
    over14(3) <= a(28);
    over14(4) <= a(27);
    over14(5) <= a(26);
    over14(6) <= a(25);
    over14(7) <= a(24);
    over14(8) <= a(23);
    over14(9) <= a(22);
    over14(10) <= a(21);
    over14(11) <= a(20);
    over14(12) <= a(19);
    over14(13) <= a(18);

    over15(0) <= a(31);
    over15(1) <= a(30);
    over15(2) <= a(29);
    over15(3) <= a(28);
    over15(4) <= a(27);
    over15(5) <= a(26);
    over15(6) <= a(25);
    over15(7) <= a(24);
    over15(8) <= a(23);
    over15(9) <= a(22);
    over15(10) <= a(21);
    over15(11) <= a(20);
    over15(12) <= a(19);
    over15(13) <= a(18);
    over15(14) <= a(17);

    over16(0) <= a(31);
    over16(1) <= a(30);
    over16(2) <= a(29);
    over16(3) <= a(28);
    over16(4) <= a(27);
    over16(5) <= a(26);
    over16(6) <= a(25);
    over16(7) <= a(24);
    over16(8) <= a(23);
    over16(9) <= a(22);
    over16(10) <= a(21);
    over16(11) <= a(20);
    over16(12) <= a(19);
    over16(13) <= a(18);
    over16(14) <= a(17);
    over16(15) <= a(16);

    over17(0) <= a(31);
    over17(1) <= a(30);
    over17(2) <= a(29);
    over17(3) <= a(28);
    over17(4) <= a(27);
    over17(5) <= a(26);
    over17(6) <= a(25);
    over17(7) <= a(24);
    over17(8) <= a(23);
    over17(9) <= a(22);
    over17(10) <= a(21);
    over17(11) <= a(20);
    over17(12) <= a(19);
    over17(13) <= a(18);
    over17(14) <= a(17);
    over17(15) <= a(16);
    over17(16) <= a(15);

    over18(0) <= a(31);
    over18(1) <= a(30);
    over18(2) <= a(29);
    over18(3) <= a(28);
    over18(4) <= a(27);
    over18(5) <= a(26);
    over18(6) <= a(25);
    over18(7) <= a(24);
    over18(8) <= a(23);
    over18(9) <= a(22);
    over18(10) <= a(21);
    over18(11) <= a(20);
    over18(12) <= a(19);
    over18(13) <= a(18);
    over18(14) <= a(17);
    over18(15) <= a(16);
    over18(16) <= a(15);
    over18(17) <= a(14);

    over19(0) <= a(31);
    over19(1) <= a(30);
    over19(2) <= a(29);
    over19(3) <= a(28);
    over19(4) <= a(27);
    over19(5) <= a(26);
    over19(6) <= a(25);
    over19(7) <= a(24);
    over19(8) <= a(23);
    over19(9) <= a(22);
    over19(10) <= a(21);
    over19(11) <= a(20);
    over19(12) <= a(19);
    over19(13) <= a(18);
    over19(14) <= a(17);
    over19(15) <= a(16);
    over19(16) <= a(15);
    over19(17) <= a(14);
    over19(18) <= a(13);

    over20(0) <= a(31);
    over20(1) <= a(30);
    over20(2) <= a(29);
    over20(3) <= a(28);
    over20(4) <= a(27);
    over20(5) <= a(26);
    over20(6) <= a(25);
    over20(7) <= a(24);
    over20(8) <= a(23);
    over20(9) <= a(22);
    over20(10) <= a(21);
    over20(11) <= a(20);
    over20(12) <= a(19);
    over20(13) <= a(18);
    over20(14) <= a(17);
    over20(15) <= a(16);
    over20(16) <= a(15);
    over20(17) <= a(14);
    over20(18) <= a(13);
    over20(19) <= a(12);

    over21(0) <= a(31);
    over21(1) <= a(30);
    over21(2) <= a(29);
    over21(3) <= a(28);
    over21(4) <= a(27);
    over21(5) <= a(26);
    over21(6) <= a(25);
    over21(7) <= a(24);
    over21(8) <= a(23);
    over21(9) <= a(22);
    over21(10) <= a(21);
    over21(11) <= a(20);
    over21(12) <= a(19);
    over21(13) <= a(18);
    over21(14) <= a(17);
    over21(15) <= a(16);
    over21(16) <= a(15);
    over21(17) <= a(14);
    over21(18) <= a(13);
    over21(19) <= a(12);
    over21(20) <= a(11);

    over22(0) <= a(31);
    over22(1) <= a(30);
    over22(2) <= a(29);
    over22(3) <= a(28);
    over22(4) <= a(27);
    over22(5) <= a(26);
    over22(6) <= a(25);
    over22(7) <= a(24);
    over22(8) <= a(23);
    over22(9) <= a(22);
    over22(10) <= a(21);
    over22(11) <= a(20);
    over22(12) <= a(19);
    over22(13) <= a(18);
    over22(14) <= a(17);
    over22(15) <= a(16);
    over22(16) <= a(15);
    over22(17) <= a(14);
    over22(18) <= a(13);
    over22(19) <= a(12);
    over22(20) <= a(11);
    over22(21) <= a(10);

    over23(0) <= a(31);
    over23(1) <= a(30);
    over23(2) <= a(29);
    over23(3) <= a(28);
    over23(4) <= a(27);
    over23(5) <= a(26);
    over23(6) <= a(25);
    over23(7) <= a(24);
    over23(8) <= a(23);
    over23(9) <= a(22);
    over23(10) <= a(21);
    over23(11) <= a(20);
    over23(12) <= a(19);
    over23(13) <= a(18);
    over23(14) <= a(17);
    over23(15) <= a(16);
    over23(16) <= a(15);
    over23(17) <= a(14);
    over23(18) <= a(13);
    over23(19) <= a(12);
    over23(20) <= a(11);
    over23(21) <= a(10);
    over23(22) <= a(9);

    over24(0) <= a(31);
    over24(1) <= a(30);
    over24(2) <= a(29);
    over24(3) <= a(28);
    over24(4) <= a(27);
    over24(5) <= a(26);
    over24(6) <= a(25);
    over24(7) <= a(24);
    over24(8) <= a(23);
    over24(9) <= a(22);
    over24(10) <= a(21);
    over24(11) <= a(20);
    over24(12) <= a(19);
    over24(13) <= a(18);
    over24(14) <= a(17);
    over24(15) <= a(16);
    over24(16) <= a(15);
    over24(17) <= a(14);
    over24(18) <= a(13);
    over24(19) <= a(12);
    over24(20) <= a(11);
    over24(21) <= a(10);
    over24(22) <= a(9);
    over24(23) <= a(8);

    over25(0) <= a(31);
    over25(1) <= a(30);
    over25(2) <= a(29);
    over25(3) <= a(28);
    over25(4) <= a(27);
    over25(5) <= a(26);
    over25(6) <= a(25);
    over25(7) <= a(24);
    over25(8) <= a(23);
    over25(9) <= a(22);
    over25(10) <= a(21);
    over25(11) <= a(20);
    over25(12) <= a(19);
    over25(13) <= a(18);
    over25(14) <= a(17);
    over25(15) <= a(16);
    over25(16) <= a(15);
    over25(17) <= a(14);
    over25(18) <= a(13);
    over25(19) <= a(12);
    over25(20) <= a(11);
    over25(21) <= a(10);
    over25(22) <= a(9);
    over25(23) <= a(8);
    over25(24) <= a(7);

    over26(0) <= a(31);
    over26(1) <= a(30);
    over26(2) <= a(29);
    over26(3) <= a(28);
    over26(4) <= a(27);
    over26(5) <= a(26);
    over26(6) <= a(25);
    over26(7) <= a(24);
    over26(8) <= a(23);
    over26(9) <= a(22);
    over26(10) <= a(21);
    over26(11) <= a(20);
    over26(12) <= a(19);
    over26(13) <= a(18);
    over26(14) <= a(17);
    over26(15) <= a(16);
    over26(16) <= a(15);
    over26(17) <= a(14);
    over26(18) <= a(13);
    over26(19) <= a(12);
    over26(20) <= a(11);
    over26(21) <= a(10);
    over26(22) <= a(9);
    over26(23) <= a(8);
    over26(24) <= a(7);
    over26(25) <= a(6);

    over27(0) <= a(31);
    over27(1) <= a(30);
    over27(2) <= a(29);
    over27(3) <= a(28);
    over27(4) <= a(27);
    over27(5) <= a(26);
    over27(6) <= a(25);
    over27(7) <= a(24);
    over27(8) <= a(23);
    over27(9) <= a(22);
    over27(10) <= a(21);
    over27(11) <= a(20);
    over27(12) <= a(19);
    over27(13) <= a(18);
    over27(14) <= a(17);
    over27(15) <= a(16);
    over27(16) <= a(15);
    over27(17) <= a(14);
    over27(18) <= a(13);
    over27(19) <= a(12);
    over27(20) <= a(11);
    over27(21) <= a(10);
    over27(22) <= a(9);
    over27(23) <= a(8);
    over27(24) <= a(7);
    over27(25) <= a(6);
    over27(26) <= a(5);

    over28(0) <= a(31);
    over28(1) <= a(30);
    over28(2) <= a(29);
    over28(3) <= a(28);
    over28(4) <= a(27);
    over28(5) <= a(26);
    over28(6) <= a(25);
    over28(7) <= a(24);
    over28(8) <= a(23);
    over28(9) <= a(22);
    over28(10) <= a(21);
    over28(11) <= a(20);
    over28(12) <= a(19);
    over28(13) <= a(18);
    over28(14) <= a(17);
    over28(15) <= a(16);
    over28(16) <= a(15);
    over28(17) <= a(14);
    over28(18) <= a(13);
    over28(19) <= a(12);
    over28(20) <= a(11);
    over28(21) <= a(10);
    over28(22) <= a(9);
    over28(23) <= a(8);
    over28(24) <= a(7);
    over28(25) <= a(6);
    over28(26) <= a(5);
    over28(27) <= a(4);

    over29(0) <= a(31);
    over29(1) <= a(30);
    over29(2) <= a(29);
    over29(3) <= a(28);
    over29(4) <= a(27);
    over29(5) <= a(26);
    over29(6) <= a(25);
    over29(7) <= a(24);
    over29(8) <= a(23);
    over29(9) <= a(22);
    over29(10) <= a(21);
    over29(11) <= a(20);
    over29(12) <= a(19);
    over29(13) <= a(18);
    over29(14) <= a(17);
    over29(15) <= a(16);
    over29(16) <= a(15);
    over29(17) <= a(14);
    over29(18) <= a(13);
    over29(19) <= a(12);
    over29(20) <= a(11);
    over29(21) <= a(10);
    over29(22) <= a(9);
    over29(23) <= a(8);
    over29(24) <= a(7);
    over29(25) <= a(6);
    over29(26) <= a(5);
    over29(27) <= a(4);
    over29(28) <= a(3);

    over30(0) <= a(31);
    over30(1) <= a(30);
    over30(2) <= a(29);
    over30(3) <= a(28);
    over30(4) <= a(27);
    over30(5) <= a(26);
    over30(6) <= a(25);
    over30(7) <= a(24);
    over30(8) <= a(23);
    over30(9) <= a(22);
    over30(10) <= a(21);
    over30(11) <= a(20);
    over30(12) <= a(19);
    over30(13) <= a(18);
    over30(14) <= a(17);
    over30(15) <= a(16);
    over30(16) <= a(15);
    over30(17) <= a(14);
    over30(18) <= a(13);
    over30(19) <= a(12);
    over30(20) <= a(11);
    over30(21) <= a(10);
    over30(22) <= a(9);
    over30(23) <= a(8);
    over30(24) <= a(7);
    over30(25) <= a(6);
    over30(26) <= a(5);
    over30(27) <= a(4);
    over30(28) <= a(3);
    over30(29) <= a(2);

    over31(0) <= a(31);
    over31(1) <= a(30);
    over31(2) <= a(29);
    over31(3) <= a(28);
    over31(4) <= a(27);
    over31(5) <= a(26);
    over31(6) <= a(25);
    over31(7) <= a(24);
    over31(8) <= a(23);
    over31(9) <= a(22);
    over31(10) <= a(21);
    over31(11) <= a(20);
    over31(12) <= a(19);
    over31(13) <= a(18);
    over31(14) <= a(17);
    over31(15) <= a(16);
    over31(16) <= a(15);
    over31(17) <= a(14);
    over31(18) <= a(13);
    over31(19) <= a(12);
    over31(20) <= a(11);
    over31(21) <= a(10);
    over31(22) <= a(9);
    over31(23) <= a(8);
    over31(24) <= a(7);
    over31(25) <= a(6);
    over31(26) <= a(5);
    over31(27) <= a(4);
    over31(28) <= a(3);
    over31(29) <= a(2);
    over31(30) <= a(1);

    overflow_check0: entity work.mux32to1(struct) port map (over0, over1, over2, over3, over4, over5, over6, over7, over8, over9, over10, over11, over12, over13, over14, over15, over16, over17, over18, over19, over20, over21, over22, over23, over24, over25, over26, over27, over28, over29, over30, over31, amount, overflow_check);

    overflow_zero0: entity work.zero32(struct) port map (overflow_check, overflow_zero);

    overflow <= not overflow_zero and not direction after 10 ps;




end struct;
