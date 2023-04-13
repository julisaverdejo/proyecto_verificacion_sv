library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum_generic is
	generic( n	:	integer := 60 );
	port(
		Q	: in	std_logic_vector(n-1 downto 0);
		P	: in	std_logic_vector(n-1 downto 0);
		S  : out	std_logic_vector(n-1 downto 0) 		
	);														  	
end;	


architecture aritmetica of sum_generic is
signal temp : std_logic_vector(n downto 0);
begin
	temp <=  std_logic_vector( signed('0' & P) + signed('0' &Q) );
	--S <= std_logic_vector(signed(P)+signed(Q));
	S <= temp(n-1 downto 0);
end aritmetica;