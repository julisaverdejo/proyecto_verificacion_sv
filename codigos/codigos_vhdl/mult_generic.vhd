-- Autor: Ciro Fabian Bermudez Marquez
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult_generic is
	generic( 
		n	:	integer := 18;
		m	:	integer	:= 36
	);
	port(
		X	: in	std_logic_vector(n-1 downto 0);
		A	: in	std_logic_vector(m-1 downto 0);
		M1  : out	std_logic_vector(59 downto 0) 		--  18 + 36 = 54
	);													-- Dejamos 6 bits de guarda porque se ingresaran 6 coeficientes							  	
end;	

architecture aritmetica of mult_generic is	
signal temp 	: std_logic_vector(m+n-1 downto 0);
signal sign_ext : std_logic_vector(5 downto 0);	
begin													  
	temp <= std_logic_vector(signed(X)*signed(A));
	sign_ext <= ( others => temp(m+n-1) );
	M1 <= sign_ext & temp;
end aritmetica;						
-- NOTA	 Hay que hacer extension de signo