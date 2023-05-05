-- Autor: Ciro Fabian Bermudez Marquez

library ieee;
use ieee.std_logic_1164.all;

entity ajuste is
	port(
		R		  :	in	std_logic_vector(59 downto 0);
		S		  :	in	std_logic_vector(5 downto 0);
		Y	 	  :	out	std_logic_vector(17 downto 0)
	);	
end;					 


architecture arch of ajuste is
begin	  
	with S select
		Y <= 
			 R(17 downto 0) when "000000",
			 R(18 downto 1) when "000001",
			 R(19 downto 2) when "000010",
			 R(20 downto 3) when "000011",
			 R(21 downto 4) when "000100",
			 R(22 downto 5) when "000101",
			 R(23 downto 6) when "000110",
			 R(24 downto 7) when "000111",
			 R(25 downto 8) when "001000",
			 R(26 downto 9) when "001001",
			 R(27 downto 10) when "001010",
			 R(28 downto 11) when "001011",
			 R(29 downto 12) when "001100",
			 R(30 downto 13) when "001101",
			 R(31 downto 14) when "001110",
			 R(32 downto 15) when "001111",
			 R(33 downto 16) when "010000",
			 R(34 downto 17) when "010001",
			 R(35 downto 18) when "010010",
			 R(36 downto 19) when "010011",
			 R(37 downto 20) when "010100",
			 R(38 downto 21) when "010101",
			 R(39 downto 22) when "010110",
			 R(40 downto 23) when "010111",
			 R(41 downto 24) when "011000",
			 R(42 downto 25) when "011001",
			 R(43 downto 26) when "011010",
			 R(44 downto 27) when "011011",
			 R(45 downto 28) when "011100",
			 R(46 downto 29) when "011101",
			 R(47 downto 30) when "011110",
			 R(48 downto 31) when "011111",
			 R(49 downto 32) when "100000",
			 R(50 downto 33) when "100001",
			 R(51 downto 34) when "100010",
			 R(52 downto 35) when "100011",
			 R(53 downto 36) when "100100",
			 R(54 downto 37) when "100101",
			 R(55 downto 38) when "100110",
			 R(56 downto 39) when "100111",
			 R(57 downto 40) when "101000",
			 R(58 downto 41) when "101001",
			 R(59 downto 42) when "101010",
			 (others => '0') when others;
end arch;