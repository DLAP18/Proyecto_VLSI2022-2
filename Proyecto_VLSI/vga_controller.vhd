LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY vga_controller IS
  GENERIC(
	 h_pulse  :  INTEGER   := 96;   --ancho pulso horizontal en pixeles
    h_bp     :  INTEGER   := 48;   
    h_pixels :  INTEGER   := 640;  --ancho horizontal display en pixels
    h_fp     :  INTEGER   := 16;   
    h_pol    :  STD_LOGIC := '0';  --polaridad pulso sincronizacion horizontal (1 = positivo, 0 = negativo)
    v_pulse  :  INTEGER   := 2;    --ancho pulso vertical en filas
    v_bp     :  INTEGER   := 33;    
    v_pixels :  INTEGER   := 480;  --ancho vertical display en filas
    v_fp     :  INTEGER   := 10;     
    v_pol    :  STD_LOGIC := '0'); --polaridad pulso sincronizacion vertical (1 = positivo, 0 = negativo)
  PORT(
    pixel_clk :  IN   STD_LOGIC;  --frecuencia de reloj utilizada
    reset_n   :  IN   STD_LOGIC;  --reset
    h_sync    :  OUT  STD_LOGIC;  
    v_sync    :  OUT  STD_LOGIC;  
    disp_ena  :  OUT  STD_LOGIC;  --display enable
    column    :  OUT  INTEGER;    --coordenada horizontal pixel
    row       :  OUT  INTEGER);   --coordenada vertical pixel

END vga_controller;

ARCHITECTURE behavior OF vga_controller IS
  CONSTANT  h_period  :  INTEGER := h_pulse + h_bp + h_pixels + h_fp;  --Periodo total de la señal para los pixeles horizontales en una fila
  CONSTANT  v_period  :  INTEGER := v_pulse + v_bp + v_pixels + v_fp;  --Periodo total de la señal para las filas del display
BEGIN


  PROCESS(pixel_clk, reset_n)
    VARIABLE h_count  :  INTEGER RANGE 0 TO h_period - 1 := 0;  --contador horizontal
    VARIABLE v_count  :  INTEGER RANGE 0 TO v_period - 1 := 0;  --contador vertical
  BEGIN
  
    IF(reset_n = '0') THEN  
      h_count := 0;         --reset contador horizontal
      v_count := 0;         --reset contador vertical
      h_sync <= h_pol;		 
      v_sync <= v_pol;	  	 
      disp_ena <= '0';      --desactivar display
      column <= 0;          
      row <= 0;             
      
    ELSIF(pixel_clk'EVENT AND pixel_clk = '1') THEN

      --contadores
      IF(h_count < h_period - 1) THEN    --contador horizontal
        h_count := h_count + 1;
      ELSE
        h_count := 0;
        IF(v_count < v_period - 1) THEN  --contador vertical
          v_count := v_count + 1;
        ELSE
          v_count := 0;
        END IF;
      END IF;
		--- Recorrido de la pantalla
      --horizontal sync signal
      IF(h_count < h_pixels + h_fp OR h_count > h_pixels + h_fp + h_pulse) THEN --- Tiempo en el que se recorre horizontalmente
        h_sync <= NOT h_pol;  -- h_sync sera un pico 										--- el display	
      ELSE
        h_sync <= h_pol;      -- h_sync sera cero se regresara al inicio horizontal
      END IF;
      
      --vertical sync signal
      IF(v_count < v_pixels + v_fp OR v_count > v_pixels + v_fp + v_pulse) THEN  --- Tiempo en el que se recorre verticalmente
        v_sync <= NOT v_pol;    -- v_sync sera un pico 										--- el display	
      ELSE
        v_sync <= v_pol;         -- h_sync sera cero se regresara al inicio vertical
      END IF;
      
      --set pixel coordinates
      IF(h_count < h_pixels) THEN  --horiztonal display time (recorrido por pixel)
        column <= h_count;         --set  coordenada horizontal del pixel deacuerdo al conteo
      END IF;
      IF(v_count < v_pixels) THEN  --vertical display time (recorrido por pixel)
        row <= v_count;            --set  coordenada vertical del pixel deacuerdo al conteo
      END IF;

      --set display enable output
      IF(h_count < h_pixels AND v_count < v_pixels) THEN  --display time    (mientras sea cierto se estara dibujando en el display)
        disp_ena <= '1';                                  --enable display  (señal de display activo)
      ELSE                                                --blanking time   (Cuando Finaliza un frame)
        disp_ena <= '0';                                  --disable display (señal de display desactivo)
      END IF;
		--- En el tiempo que disp_ena sera 
    END IF;
  END PROCESS;

END behavior;