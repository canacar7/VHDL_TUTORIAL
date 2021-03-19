library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_adder is
generic(
N : integer := 4 --kaç tane adder kullnýrsak
);
port(
a     : in std_logic_vector  (N-1 downto 0);
b     : in std_logic_vector  (N-1 downto 0);
c_i   : in std_logic;
sum   : out std_logic_vector (N-1 downto 0);
carry : out std_logic
);
end n_bit_adder;

architecture arch of n_bit_adder is

--COMPOMENT DECLERATION
component full_adder is
port(
a       : in std_logic;
b       : in std_logic;
c_i     : in std_logic;
sum     : out std_logic;
carry   : out std_logic

);
end component;

-- Burada ara sinyaler anımlandı N+1 bit olamsının nedenide son bit bütün sistemden çıkan cout a eşit	
signal temp : std_logic_vector (N downto 0) := (others => '0');


begin

temp(0) <= c_i;
carry <= temp(n);

FULL_ADDER_GEN : for k in 0 to N-1 generate
	full_adder_k : full_adder
	port map(
		a     => a(k),
		b     => b(k),
		c_i   => temp(k),
		sum   => sum(k),
		carry => temp(k+1)
	);
end generate;

end arch;













