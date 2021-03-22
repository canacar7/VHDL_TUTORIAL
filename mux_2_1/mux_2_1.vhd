library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity mux_2_1 is

 port (
 ---3 farkli yolla tasarim yappicam 
 --inputlar
 a_i  :in std_logic;	
 b_i  :in std_logic; 
 s1_i :in std_logic; 
 c_i  :in std_logic;	
 d_i  :in std_logic;
 s2_i :in std_logic;  
 e_i  :in std_logic;	
 f_i  :in std_logic;
 s3_i :in std_logic;  
 
 
 --outputlar
 
  q1_o : out std_logic;
  q2_o : out std_logic;
  q3_o : out std_logic
 
);
end mux_2_1;	

architecture arch of mux_2_1 is 

signal blok_1  : std_logic := '0';
signal blok_2  : std_logic := '0';


begin

--gate level combinational design 
blok_1 <= not ((a_i and s1_i));
blok_2 <= not (((not s1_i) and b_i));

q1_o <=  not( blok_1 and blok_2);

--concurrent assingment combinational design
-- c_i s2_i 1 ken d_i ise s2_i  ken aktif olur
q2_o <= c_i when s2_i = '1' else   
		d_i;  
	
--process combinational design
P_LABEL : process (s3_i, e_i , f_i) begin  --- sensivitiy list de asekron br tasarımda sinyalin durumu etkileyen sinyaller yazilir

	if(s3_i = '1') then 
		q3_o <= e_i;
	else
		q3_o <= f_i;
	end if;

end process P_LABEL;
	

end arch;





























