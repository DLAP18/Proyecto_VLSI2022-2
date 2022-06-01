library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity relojlento is
port(
clkl: in std_logic;
led: buffer std_logic:= '0');
end relojlento;

architecture arqrelojlento of relojlento is
signal conteo: integer range 0 to 100000;
begin
process(clkl)
	begin
		if(clkl' event and clkl='1') then -- Se utiliza un divisor de frecuencia mayor para
			conteo<=conteo+1;						--- El input de los controles del usuario
				if(conteo=100000) then
					conteo<=0;
					led<=not(led);
				end if;
		end if;
end process;
end arqrelojlento;