library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;--matematiksel islemlerin aktif olamsýný saglar
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_top is   --entitiy de yalnýz sabitleri tanýmlayabilirim
generic(
N : integer := 8
);
end tb_top;


architecture arch of tb_top is

component top is
generic(
N : integer := 8
);
port(
anahtar   :  in std_logic_vector (15 downto 0);
buton     :  in std_logic; --c_i icin
led       :  out std_logic_vector(8 downto 0)
);
end component;

signal anahtar   :  std_logic_vector (15 downto 0) := (others => '0');
signal buton     :  std_logic := '0';
signal led       :  std_logic_vector (8 downto 0);

begin

TOP_TEST : top
generic map(
N => N
)
port map(
anahtar   => anahtar,
buton     => buton,
led       => led
);

simulasyon : process begin

for i in 0 to 255 loop
	anahtar(7 downto 0) <= anahtar(7 downto 0) + 1;
	anahtar(15 downto 8) <= anahtar(15 downto 8) + 2;
	buton <= not buton;	
	wait for 20 ns;
end loop;

for i in 0 to 255 loop
	anahtar(7 downto 0) <= anahtar(7 downto 0) - 1;
	anahtar(15 downto 8) <= anahtar(15 downto 8) - 2;
	buton <= not buton;	
	wait for 20 ns;
end loop;

end process;

--simülasyon sonsuza kadar sürdürmez
assert false
report "SIM DONE"
severity failure;

end arch;




















