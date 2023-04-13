library ieee;
use ieee.std_logic_1164.all;

entity ff_gen_hab2 is
	generic(n : integer := 60);
	port(
		RST	:	in	std_logic;
		CLK	:	in	std_logic; 
		HAB	:	in	std_logic_vector(1 downto 0);
		D	:	in	std_logic_vector(n-1 downto 0);
		Q	:	out	std_logic_vector(n-1 downto 0)
	);	
end;

architecture ff of ff_gen_hab2 is
	signal Qn, Qp : std_logic_vector(n-1 downto 0);
begin		 
--Qn <= Qp when HAB = '0' else D;	 
	with HAB select
	Qn <=  	                 (others => '0') when "00",
										   D when "01",
										  Qp when others;	
	process(RST, CLK)
	begin
		if RST = '1' then
			Qp <= (others => '0');
		elsif rising_edge(CLK) then
			Qp <= Qn;
		end if;
	end process; 
	Q <= Qp;
end ff;