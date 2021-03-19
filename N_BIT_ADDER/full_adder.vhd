library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
port(
a     : in std_logic;
b     : in std_logic;
c_i   : in std_logic;
sum   : out std_logic;
carry : out std_logic

);
end full_adder;

architecture arch of full_adder is
--COMPONENT DECLERATION
component half_adder is
port(
a     : in std_logic;
b     : in std_logic;
sum   : out std_logic;
carry : out std_logic

);
end component;

--sinyaller ara baglantýlar
signal c1_wire : std_logic := '0';
signal c2_wire : std_logic := '0';
signal s1_wire : std_logic := '0';

begin
--COMPONENT INSTANTIATION
first_half_adder : half_adder
port map(
a     => a,
b     => b,
sum   => s1_wire,
carry => c1_wire
);

second_half_adder : half_adder
port map(
a     => s1_wire,
b     => c_i,
sum   => sum,
carry => c2_wire
);

carry <= c1_wire or c2_wire;

end arch;








