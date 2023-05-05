-- Autor: Ciro Fabian Bermudez Marquez
library ieee;
use ieee.std_logic_1164.all;

entity mac2 is
	port(
		RST	:	in	std_logic;
		CLK	:	in	std_logic;
		STF	:	in	std_logic;
		X	:	in	std_logic_vector(17 downto 0);
		A	:	in	std_logic_vector(35 downto 0);
		N	:	in	std_logic_vector(5 downto 0);
		S	:	in	std_logic_vector(5 downto 0);
		EOF	:	out	std_logic;
		I	:	out	std_logic_vector(5 downto 0);
		Y	:	out	std_logic_vector(17 downto 0)					  --  (17 downto 0)		   (59 downto 0)
	);
end;  

architecture arch of mac2 is
	signal P,Q,U,R : std_logic_vector(59 downto 0);
	signal LDR,Z   : std_logic;  
	signal OPC,LDA   : std_logic_vector(1 downto 0);
begin 

	mult_mod : entity work.mult_generic generic map(n => 18, m =>36) port map(X,A,P);
	sum_mod  : entity work.sum_generic  generic map(n => 60) port map(Q,P,U);
	acum_mod : entity work.ff_gen_hab2   generic map(n => 60) port map(RST,CLK,LDA,U,Q);
	cont_mod : entity work.contador     generic map(m => 6)  port map(RST,CLK,OPC,N,Z,I);
	fsm_mod  : entity work.fsm_mac      				     port map(RST,CLK,STF,Z,LDA,LDR,EOF,OPC);
	res_mod  : entity work.ff_gen_hab   generic map(n => 60) port map(RST,CLK,LDR,Q,R);
	aju_mod  : entity work.ajuste		 			         port map(R,S,Y);	 					-- "011100" para R(45 downto 28)
	
	--Y <= R(45 downto 28); --   (45 downto 28)		  (59 downto 0)	  
			
end arch;