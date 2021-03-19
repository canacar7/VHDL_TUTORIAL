library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
generic(
N : integer := 8
);
port(
anahtar   : in std_logic_vector (15 downto 0);
buton     : in std_logic; --c_i icin
led       :  out std_logic_vector(8 downto 0)

);
end top;

architecture arch of top is

--COMPONENT DECLERATION
component n_bit_adder is
generic(
N : integer := 8 --kaç tane adder kullnýrsak
);

port(
a     : in std_logic_vector  (N-1 downto 0);
b     : in std_logic_vector  (N-1 downto 0);
c_i   : in std_logic;
sum   : out std_logic_vector (N-1 downto 0);
carry : out std_logic
);
end component;

begin
--COMPONENT INSTANTIATION
n_bit_adder_i : n_bit_adder
generic map(
N => N
)
port map(
a     => anahtar(7 downto 0),
b     => anahtar(15 downto 8),
c_i   => buton,
sum   => led(7 downto 0),
carry => led(8)
);

end arch;
















