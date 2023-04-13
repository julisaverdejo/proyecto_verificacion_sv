library ieee;
use ieee.std_logic_1164.all;

entity fsm_mac is
  port(
    RST		: in   std_logic;
    CLK 	: in   std_logic;
    STF     : in   std_logic;
	Z       : in   std_logic;
	LDA     : out  std_logic_vector(1 downto 0);
	LDR     : out  std_logic;
	EOF     : out  std_logic;
	OPC     : out  std_logic_vector(1 downto 0)
  );
end;

architecture fsm of fsm_mac is
signal Qp, Qn  : std_logic_vector(2 downto 0); -- porque son 4 estados
begin
  
  process(Qp,STF,Z) 
  begin
    case Qp is
	 when "000" => OPC <= "11"; LDA <= "00"; LDR <= '0'; EOF <= '1';		  -- Espera
		if STF = '1' then 
		  Qn <= "001";
		else 
		  Qn <= Qp;
		end if;
	 when "001" => OPC <= "01"; LDA <= "01"; LDR <= '0'; EOF <= '0'; 		   -- Acumula
		  Qn <= "010";
	 when "010" => OPC <= "01"; LDA <= "10"; LDR <= '0'; EOF <= '0'; 		   -- Comprueba
	 	if Z = '1' then 
		  Qn <= "100";
		else 
		  Qn <= "011";
		end if;	
	when "011" => OPC <= "10"; LDA <= "10"; LDR <= '0'; EOF <= '0'; 		   -- Aumenta
		Qn <= "001";  
	when "100" => OPC <= "00"; LDA <= "10"; LDR <= '1'; EOF <= '0'; 		   -- resultado
		Qn <= "000";
	 when others => OPC <= "00"; LDA <= "00"; LDR <= '0'; EOF <= '0'; 	   -- Default
		Qn <= "000";
    end case;
  end process;

  -- Registros para estados
  process(RST,CLK)
  begin
    if RST = '1' then
      Qp <= (others => '0');
    elsif rising_edge(CLK) then
      Qp <= Qn;
    end if;
  end process;

end fsm;