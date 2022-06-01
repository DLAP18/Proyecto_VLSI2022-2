library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(
		dispw: in std_logic_vector(3 downto 0); -- Se utilizaran 4 deep switch como controles
		input_clk: in std_logic;  -- reloj default de la FPGA
		changeit : IN STD_LOGIC; --- boton para cambiar entre pantalla de inicio y juego
		resetlol : IN STD_LOGIC; --- reinicia el nivel

		red      :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');  --color rojo informacion para el VGA
		green    :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');  --color verde ...
		blue     :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0'); --color azul ...
		h_sync    :  OUT  STD_LOGIC;  --horiztonal sync pulse
		v_sync    :  OUT  STD_LOGIC  --vertical sync pulse

		--clkprueba: out std_logic
		);
		
end entity top;

architecture arq_top of top is
	signal pix_clock: std_logic; -- Utilizado como el reloj para el dibujo de pixeles
	signal disp_ena: std_logic;  -- utilizado para habilitar el display
	signal column: integer;			-- utilizado para almacenar la coordenada horizontal del pixel
	signal row: integer;				-- utilizado para almacenar la coordenada vertical del pixel
	signal clklento: std_logic;

	begin
	
	u0: work.relojlento(arqrelojlento) port map (input_clk, clklento ); -- Divisor de frecuencia mayor

	u1: work.gen25mhz(arqgen25mhz) port map (input_clk,pix_clock); -- Divisor de frecuencia menor
	 
	u2: work.vga_controller(behavior) port map (pix_clock,'1',h_sync,v_sync,disp_ena,column,row); --controlador de la señal VGA (SYNC Vertizal y horizontal)
																
	u3: work.Dibuja(behavior) port map (dispw, disp_ena,changeit,resetlol,row, column, red, green, blue,clklento); -- Se encarga de cambiar los valores RGB a la vez que 
	--la señal vertical y horizontal forman el display, asi mismo responde se dibuja distintamente segun las señales de entrada

end arq_top;
	