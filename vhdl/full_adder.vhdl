library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a, b, cin : in std_logic;
        sum, cout : out std_logic
    );
end full_adder;

architecture struct of full_adder is
begin
    sum <= (not a and not b and cin) or (not a and b and not cin) or (a and not b and not cin) or (a and b and cin) after 15 ps;
    cout <= (not a and b and cin) or (a and not b and cin) or (a and b and not cin) or (a and b and cin) after 15 ps;
end struct;
