library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;--matematiksel islemlerin aktif olamsını saglar
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity sequential is
generic (
c_clkfreq : integer := 100_000_000
);
port(
clk      : in std_logic;
sw       : in std_logic_vector (1 downto 0);
counter  : out std_logic_vector(7 downto 0)
);
end sequential;

architecture Behavioral of sequential is
--timer olusturmam gerekli
constant c_timer2sn    : integer := c_clkfreq*2;
constant c_timer1sn    : integer := c_clkfreq*1;
constant c_timer0_5sn  : integer := c_clkfreq/2;
constant c_timer0_25sn : integer := c_clkfreq/4;

signal timer       : integer range 0 to c_timer2sn := 0;
signal timer_durum : integer range 0 to c_timer2sn := 0;
signal counter_ic  : std_logic_vector(7 downto 0 ) := (others => '0');
 

begin
--sw nin durumuna göre timer_durum degisecek 
timer_durum <=  c_timer2sn   when sw = "00" else
				c_timer1sn   when sw = "01" else 
				c_timer0_5sn when sw = "10" else 
				c_timer0_25sn ;

process (clk) begin

	if(rising_edge(clk)) then
	if (timer >= timer_durum -1 ) then
		counter_ic <= counter_ic + 1;
		timer <= 0;
	else
		timer <= timer + 1;
	end if;
	end if;
	
	
end process;			

	counter <= counter_ic;

end Behavioral;












