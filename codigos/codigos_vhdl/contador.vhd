library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	 

entity contador is
	generic(m : integer := 6);
	port(
		RST	:	in	std_logic;
		CLK	:	in	std_logic;
		OPC	:	in	std_logic_vector(1 downto 0);
		N	:	in	std_logic_vector(m-1 downto 0);
		Z	:	out	std_logic;
		I	:	out	std_logic_vector(m-1 downto 0)
	);	
end contador;

architecture arch of contador is  
signal Qp, Qn : std_logic_vector(m-1 downto 0);
begin
	
	
	
	with OPC select
	Qn <=  	                 (others => '0') when "00",
			std_logic_vector(unsigned(Qp)-1) when "10",
										   N when "11",
										  Qp when others;
	
	Z <= '1' when Qp = "000000" else '0';
											
	process(RST, CLK)
	begin
		if RST = '1' then		  
			Qp <= (others => '0');
		elsif rising_edge(CLK) then
			Qp	<= Qn;
		end if;
	end process;	
	I <= Qp;
	
end arch;