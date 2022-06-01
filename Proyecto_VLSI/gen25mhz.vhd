library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity gen25mhz is
port(
clk50mhz: in std_logic;
clk25mhz: inout std_logic:= '0' );
end gen25mhz;

architecture arqgen25mhz of gen25mhz is
begin
process(clk50mhz)
 begin
  if(clk50mhz' event and clk50mhz='1') then -- Un divisor que reduce el reloj de 
     clk25mhz<= not clk25mhz;					-- la fpga a la mitad de su frecuencia 
  end if;
 end process;
end arqgen25mhz;