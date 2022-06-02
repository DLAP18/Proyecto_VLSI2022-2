LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dibuja IS
  GENERIC(
   pixels_y :  INTEGER := 800;  
   pixels_x :  INTEGER := 600);  
	 
  PORT(
		dispw: in std_logic_vector(3 downto 0);
    disp_ena :  IN   STD_LOGIC;  --habilitacion del display
	 changeit :	 IN	STD_LOGIC;
	 reset : IN STD_LOGIC;
    row      :  IN   INTEGER;    --coordena del pixel de fila
    column   :  IN   INTEGER;    --coordena del pixel de columna
	-- 
    red      :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');  --Magnitud color rojo
    green    :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');  --Magnitud color verde
    blue     :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0'); --Magnitud color azul
	 clk : in std_logic);
END Dibuja;

ARCHITECTURE behavior OF Dibuja IS
		signal x: integer range 35 to 600;		-- coordenadas de la ubicacion del jugador
		signal y: integer range 440 to 800;
		signal nivel : INTEGER range 0 to 1;
		signal vidas	:	INTEGER	range 0 to 3 := 3; -- vidas , si llega a cero pierde
		---- Mientras sean 1 las bombas estaran activas
		signal bomb1	:	INTEGER range 0 to 1 := 1;
		signal bomb2	:	INTEGER range 0 to 1 := 1;
		signal bomb3	:	INTEGER range 0 to 1 := 1;
		signal bomb4	:	INTEGER range 0 to 1 := 1;
		signal bomb5	:	INTEGER range 0 to 1 := 1;
		signal bomb6	:	INTEGER range 0 to 1 := 1;
		signal bomb7	:	INTEGER range 0 to 1 := 1;
		signal ganador : INTEGER range 0 to 1 := 0;
BEGIN
	
  PROCESS(disp_ena, row, column)
  BEGIN
		IF (changeit = '0' and nivel <2) THEN   --- Cambio de nivel
			nivel <= nivel + 1;
		ELSIF (changeit = '0' and nivel >1) THEN
			nivel <= 0;
		ELSIF (changeit = '1' AND nivel < 2) THEN
			nivel <= nivel;
		END IF;
    IF((disp_ena = '1' and nivel = 1)) THEN        --tiempo display
		if 	((row > y and row <y+20) and (column>x-20 and column<x)) THEN
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>  '1');
				blue <=  (OTHERS =>	'1');
		-----------------------LOSE-------------------------------
		
		--- Usar figuras de bloque para escribir LOSE
					
		elsif((row >150 and row <350) and (column>220 and column<230)and vidas = 0 )THEN --L
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >340 and row <360) and (column>220 and column<280)and vidas = 0 )THEN --L
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		
		
		elsif ((row > 150 and row <301) and (column>259 and column<264)and vidas = 0 ) THEN --Letra O
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif ((row > 150 and row <301) and (column>299 and column<304)and vidas = 0 ) THEN 
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif ((row > 150 and row <155) and (column>263 and column<304)and vidas = 0 ) THEN 
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif ((row > 296 and row <301) and (column>263 and column<304)and vidas = 0 ) THEN 
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		
		elsif((row >150 and row <160) and (column>310 and column<370)and vidas = 0 )THEN --S
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >150 and row <180) and (column>360 and column<370)and vidas = 0 )THEN --S
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >150 and row <250) and (column>310 and column<320)and vidas = 0 )THEN --S
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >240 and row <250) and (column>310 and column<370)and vidas = 0 )THEN --S
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >249 and row <350) and (column>360 and column<370)and vidas = 0 )THEN --S
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >340 and row <350) and (column>310 and column<370)and vidas = 0 )THEN --S
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >320 and row <350) and (column>310 and column<320)and vidas = 0 )THEN --S
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		
		elsif((row >150 and row <350) and (column>375 and column<385)and vidas = 0 )THEN --E
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >150 and row <160) and (column>375 and column<440)and vidas = 0 )THEN --E
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >240 and row <250) and (column>375 and column<440)and vidas = 0 )THEN --E
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		elsif((row >340 and row <350) and (column>375 and column<440)and vidas = 0 )THEN --E
					red <= (OTHERS => '0'); 
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '1');
		-----------------------WIN------------------------------------------------------------------------------------------------------
		
		--- Usar figuras de bloque para escribir WIN
		
		elsif((row >150 and row <350) and (column>130 and column<145) and ganador = 1 )THEN --I
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');	
					
		elsif ((row > 310 and row <350) and (column>145 and column<155)and ganador = 1  )THEN --W
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');			
		elsif ((row > 290 and row <330) and (column>155 and column<165)and ganador = 1 )THEN --W
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');
					
		elsif ((row > 260 and row <310) and (column>165 and column<175)and ganador = 1  )THEN --W medio
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');
					
		elsif ((row > 290 and row <330) and (column>175 and column<185) and ganador = 1 )THEN --W
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');			
		elsif ((row > 310 and row <350) and (column>185 and column<195)and ganador = 1 )THEN --W
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');
					
					
		elsif ((row > 150 and row <350) and (column>195 and column<210) and ganador = 1 )THEN  --I
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');			
			
		
				
				
		elsif((row >150 and row <350) and (column>240 and column<250)and ganador = 1 )THEN --I
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');
					
		

		
		elsif((row >150 and row <350) and (column>280 and column<300) and ganador = 1  )THEN --N
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');
		elsif((row >150 and row <350) and (column>320 and column<340)and ganador = 1  )THEN --N
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');
		elsif((row >180 and row <250) and (column>289 and column<310) and ganador = 1  )THEN --N
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');
		elsif((row >250 and row <320) and (column>310 and column<331)and ganador = 1  )THEN --N
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '0');
		
		
		
		---------------- Limites de la pantalla
				
		
		elsif ((row > 0 and row <10) and (column>0 and column<799)) THEN --Columna de arriba1
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 90 and row <100) and (column>0 and column<799)) THEN --Columna de arriba2
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 5 and row <150) and (column>630 and column<640)) THEN --Columna de la derecha1
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 200 and row <599) and (column>630 and column<640)) THEN --Columna de la derecha2
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 0 and row <599) and (column>1 and column<10)) THEN -- Columna de la izquierda
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 470 and row <480) and (column>1 and column<799))THEN --Columna de abajo
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
				
		---------------------------------vidas-----------------------------
		
		elsif ((row > 20 and row <80) and (column>45 and column<55))THEN --Cruz V
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 45 and row <55) and (column>30 and column<75))THEN --Cruz H
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		
		
		
		----------------------Letra = ---------------------------------
		elsif ((row > 30 and row <40) and (column>90 and column<130))THEN --Cruz H
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 60 and row <70) and (column>90 and column<130))THEN --Cruz H
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
				
		-----------------------------Numeros a usar-----------------------------
		elsif((row >19 and row <75) and (column>145 and column<150)and vidas = 1 )THEN --1
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >70 and row <75) and (column>140 and column<155)and vidas = 1)THEN --1
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >20 and row <24) and (column>144 and column<149)and vidas = 1)THEN --1
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >21 and row <25) and (column>143 and column<148)and vidas = 1)THEN --1
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >22 and row <26) and (column>142 and column<147) and vidas = 1)THEN  --1 
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >19 and row <75) and (column>140 and column<145)and vidas = 0 )THEN --0
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '0');
		elsif((row >19 and row <75) and (column>160 and column<165)and vidas = 0)THEN --0
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '0');
		elsif((row >19 and row <24) and (column>140 and column<161)and vidas = 0 )THEN --0
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '0');
		elsif((row >70 and row <75) and (column>140 and column<161)and vidas = 0 )THEN --0
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'0');
					blue <= (OTHERS => '0');
		elsif((row >19 and row <24) and (column>140 and column<165) and vidas = 2 )THEN  --2 
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >70 and row <75) and (column>140 and column<165) and vidas = 2 )THEN  --2 
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >45 and row <50) and (column>140 and column<165) and vidas = 2)THEN  --2 
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >19 and row <46) and (column>160 and column<165)and vidas = 2)THEN  --2 
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >49 and row <71) and (column>140 and column<145) and vidas = 2)THEN  --2 
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >19 and row <75) and (column>160 and column<165) and vidas = 3)THEN  --3
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >19 and row <24) and (column>140 and column<161)and vidas = 3)THEN  --3
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >70 and row <75) and (column>140 and column<165) and vidas = 3 )THEN  --3 
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		elsif((row >45 and row <50) and (column>140 and column<165)and vidas = 3 )THEN  --3 
					red <= (OTHERS =>  '1');
					green <= (OTHERS =>'1');
					blue <= (OTHERS => '1');
		
		
		
		
		--------------------------Laberinto---------------------------------
		
		--------------------------Horizontal-------------------------------- Se hace la contruccion del laberinto
		elsif ((row > 144 and row <150) and (column>350 and column<640)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 144 and row <150) and (column>9 and column<150)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 199 and row <204) and (column>280 and column<450)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 199 and row <204) and (column>580 and column<640)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 199 and row <204) and (column>9 and column<80)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 255 and row <260) and (column>50 and column<150)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 255 and row <260) and (column>350 and column<500)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 309 and row <314) and (column>150 and column<450)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 309 and row <314) and (column>500 and column<580)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 359 and row <364) and (column>80 and column<280)) THEN 
			red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 359 and row <364) and (column>500 and column<580)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 409 and row <414) and (column>9 and column<80)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 409 and row <414) and (column>150 and column<400)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 409 and row <414) and (column>450 and column<500)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		---------------------------------Verticales----------------------------
		elsif ((row > 144 and row <257) and (column>145 and column<150)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 310 and row <414) and (column>77 and column<82)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 100 and row <200) and (column>280 and column<285)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 148 and row <364) and (column>496 and column<502)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 148 and row <314) and (column>220 and column<225)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 370 and row <471) and (column>450 and column<455)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 264 and row <314) and (column>575 and column<580)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 310 and row <410) and (column>395 and column<400)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		
	--------Bombas a activar
		--Bomba 1
		elsif ((row > 385 and row <400) and (column>25 and column<55)and bomb1 = 1) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');
		
				
		-------Bomba 2
		elsif ((row > 180 and row <195) and (column>25 and column<55)and bomb2 = 1) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');
				
		
		-------Bomba 3
		elsif ((row > 115 and row <130) and (column>25 and column<55)and bomb3 = 1) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');
		
				
		
		-------Bomba 4
		elsif ((row > 115 and row <130) and (column>591 and column<620)and bomb4 = 1) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');
		
		
		-------Bomba 5
		elsif ((row > 340 and row <355) and (column>510 and column<540)and bomb5 = 1) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');
		
				
		-------Bomba 6
		elsif ((row > 290 and row <305) and (column>510 and column<540)and bomb6 = 1) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');
		
		
	
		-------Bomba 7
		elsif ((row > 440 and row <455) and (column>460 and column<490)and bomb7 = 1) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');
		
				
				
		
				
		--------------------------------Fondos--------------------------------------		
				
		elsif ((row > 1 and row <99) and (column>1 and column<799)) THEN --Fodo2
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');		
		else
				red <= (OTHERS =>  '0');  --es el fondo1 default
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		end if;
	 ELSIF((disp_ena = '1' and nivel = 0) ) THEN        --Menu principal Simple
		 
		if ((row > 120 and row <130) and (column>250 and column<350)) THEN --Cuadro
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'1');
				blue <= (OTHERS => '1');
		elsif ((row > 120 and row <250) and (column>250 and column<260)) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'1');
				blue <= (OTHERS => '1');
		elsif ((row > 120 and row <250) and (column>340 and column<350)) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'1');
				blue <= (OTHERS => '1');
		elsif ((row > 240 and row <250) and (column>250 and column<350)) THEN 
				red <= (OTHERS =>  '0');
				green <= (OTHERS =>'1');
				blue <= (OTHERS => '1');
				
		elsif ((row > 160 and row <190) and (column>290 and column<310)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
				
--------------------------------------------------------------------------------------------------

		elsif((row >270 and row <370) and (column>20 and column<35))THEN --Letra L
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
				
		elsif((row >355 and row <370) and (column>20 and column<80))THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		
		
		elsif ((row > 270 and row <370) and (column>90 and column<105)) THEN --Letra A
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <370) and (column>125 and column<140)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <285) and (column>90 and column<140) ) THEN 
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 315 and row <330) and (column>90 and column<140) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
				
		
		elsif ((row > 270 and row <370) and (column>150 and column<165)) THEN --Letra B
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <370) and (column>185 and column<200)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <285) and (column>150 and column<200) ) THEN 
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 315 and row <330) and (column>150 and column<200) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 355 and row <370) and (column>150 and column<200) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
			
					
		elsif ((row > 270 and row <370) and (column>210 and column<225)) THEN --Letra E
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <285) and (column>210 and column<260) ) THEN 
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 315 and row <330) and (column>210 and column<260) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 355 and row <370) and (column>210 and column<260) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
					
					
		
		elsif ((row > 270 and row <370) and (column>270 and column<285)) THEN --Letra R
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <370) and (column>305 and column<320)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <285) and (column>270 and column<320) ) THEN 
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 315 and row <330) and (column>270 and column<320) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
				
				
		elsif ((row > 270 and row <285) and (column>330 and column<380) ) THEN --Letra I
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 355 and row <370) and (column>330 and column<380) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
		elsif ((row > 270 and row <370) and (column>350 and column<365) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
				
				
		elsif ((row > 270 and row <370) and (column>390 and column<405)) THEN --Letra N
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <370) and (column>425 and column<440)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <285) and (column>390 and column<440) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
				
				
				
		elsif ((row > 270 and row <285) and (column>450 and column<500) ) THEN --Letra T
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <370) and (column>470 and column<485) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
				
				
		elsif ((row > 270 and row <370) and (column>510 and column<525)) THEN --Letra O
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <370) and (column>545 and column<560)) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 270 and row <285) and (column>510 and column<560) ) THEN 
					red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');	
		elsif ((row > 355 and row <370) and (column>510 and column<560) ) THEN 
				red <= (OTHERS =>  '1');
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '0');
					
		---------end title
				
		
		else
				red <= (OTHERS =>  '0');  --es el fondo
				green <= (OTHERS =>'0');
				blue <= (OTHERS => '1');
		end if;
    ELSE                           --blanking time
      red <= (OTHERS =>  '0');
      green <= (OTHERS =>'0');
      blue <= (OTHERS => '0');
    END IF;
  
  END PROCESS;
  
  
  PROCESS (clk, dispw, reset)
  BEGIN
	IF(clk' event and clk='1') then -- variacion del reloj lento
		if(reset = '0')then       -- Cuando se activa el boton de reset
			vidas <= 3;				-- Se reinician las vidas
			x <= 35;
			y <= 440;
			bomb1 <= 1;
			bomb2 <= 1;
			bomb3 <= 1;			-- Se activan nuevamente las bombas
			bomb4 <= 1;
			bomb5 <= 1;
			bomb6 <= 1;
			bomb7 <= 1;
			ganador <= 0;
			x <= 35;
			y <= 440;
		end if;
		
		if(dispw(0)='1') then --Abajo
			if(y>100 and y<450) then  ---
				x<=x;                 --- Hay desplazamiento hacia abajo
				y<= y+1;
				if(vidas = 0) then
					x<=x;  -- No hay movimiento
					y<=y;  
				end if;
				if((x>10 and x<70))then   --- Si el jugador se encuentra por este rango mientras baja se activa la bomba 1
					if((y>380 and y<395) and bomb1 = 1)then
						vidas <= vidas-1; -- se resta vida
						bomb1 <= 0; -- desactiva bomba
						x<=35;
						y<=440; -- Se reinicia la localizacion 
					end if;
				end if;
				if((x>510 and x<570))then
					if((y>280 and y<305) and bomb6 = 1)then  --- Si el jugador se encuentra por este rango mientras baja se activa la bomba 6
						vidas <= vidas -1;
						bomb6 <= 0;
						x<=35;
						y<=440; -- Se reinicia la localizacion 
					end if;
				end if;
				--- Se checa por posible colisiones con las barras horizontales 
				-- en caso de que el rango coincida, se retrae el movimiento en y
				if(y>390 and y<410)then
					if(x>9 and x<90)then
						y<=y-1;
					elsif(x>155 and x<410)then
						y<=y-1;
					elsif(x>450 and x<510)then
						y<=y-1;
					end if;
				end if;
				
				if(y>340 and y<360)then
					if(x>70 and x<290)then
						y<=y-1;
					elsif(x>490 and x<590)then
						y<=y-1;
					end if;
				end if;
				
				if(y>290 and y<310)then
					if(x>140 and x<460)then
						y<=y-1;
					elsif(x>490 and x<590)then
						y<=y-1;
					end if;
				end if;
				--- Se checa por posible colisiones con las barras horizontales 
				-- en caso de que el rango coincida, se retrae el movimiento en y
				if(y>235 and y<257)then
					if(x>40 and x<160)then
						y<=y-1;
					elsif(x>345 and x<510)then
						y<=y-1;
					end if;
				end if;
				
				if(y>180 and y<200)then
					if(x>7 and x<90)then
						y<=y-1;
					elsif(x>270 and x<460)then
						y<=y-1;
					elsif(x>570 and x<640)then
						y<=y-1;
					end if;
				end if;
				
				if(y>125 and y<146)then
					if(x>7 and x<160)then
						y<=y-1;
					elsif(x>340 and x<650)then
						y<=y-1;
					end if;
				end if;
				
			else
				y<=y-1;
			end if;
		elsif(dispw(1)='1') then -- switch para mover Arriba
		
		--- Se checa por posible colisiones con las barras horizontales 
				-- en caso de que el rango coincida, se retrae el movimiento en y
				
			if(y>100 and y<450) then
				x<=x;
				y<= y-1;
				
				if(y>412 and y<414)then
					if(x>9 and x<90)then
						y<=y+1;
					elsif(x>155 and x<410)then
						y<=y+1;
					elsif(x>450 and x<510)then
						y<=y+1;
					end if;
				end if;
				
				if(y>359 and y<364)then
					if(x>70 and x<290)then
						y<=y+1;
					elsif(x>490 and x<590)then
						y<=y+1;
					end if;
				end if;
				
				if(y>309 and y<314)then
					if(x>140 and x<460)then
						y<=y+1;
					elsif(x>490 and x<590)then
						y<=y+1;
					end if;
				end if;
				
				
				if(y>255 and y<260)then
					if(x>40 and x<160)then
						y<=y+1;
					elsif(x>340 and x<510)then
						y<=y+1;
					end if;
				end if;
				
				if(y>199 and y<204)then
					if(x>7 and x<90)then
						y<=y+1;
					elsif(x>270 and x<460)then
						y<=y+1;
					elsif(x>570 and x<640)then
						y<=y+1;
					end if;
				end if;
				
				if(y>144 and y<150)then
					if(x>7 and x<160)then
						y<=y+1;
					elsif(x>340 and x<650)then
						y<=y+1;
					end if;
				end if;
				
				
				if(vidas = 0) then
					x<=x; -- No hay movimiento
					y<=y;
				end if;
			else
				y<=y+1;
			end if;
		elsif(dispw(2)='1') then -- switch para mover a Derecha
			if(y>10 and y<460) then
				x<=x+1;
				if(vidas = 0) then
					x<=x;
					y<=y;  -- No hay movimiento si no hay vidas
				end if;
				
				
				if(y>300 and y<420)then
					if(x>77 and x<82)then
						x<=x-1;
					end if;
				end if;	
				if(y>135 and y<260)then
					if(x>145 and x<150)then
						x<=x-1;
					end if;
				end if;	
				if(y>140 and y<310)then
					if(x>220 and x<225)then
						x<=x-1;
					end if;
				end if;	
				if(y>90 and y<210)then
					if(x>280 and x<285)then
						x<=x-1;
					end if;
				end if;	
				if(y>305 and y<415)then
					if(x>395 and x<400)then
						x<=x-1;
					end if;
				end if;	
				if(y>145 and y<360)then
					if(x>496 and x<502)then
						x<=x-1;
					end if;
				end if;	
				if(y>365 and y<471)then
					if(x>450 and x<455)then
						x<=x-1;
					end if;
				end if;	
				if(y>260 and y<317)then
					if(x>575 and x<580)then
						x<=x-1;
					end if;
				end if;
				
				
				
				
				
				if((x>590 and x<620))then---------colisión de bombas-----------------------
					if((y>80 and y<145) and bomb4 = 1)then
						vidas <= vidas-1;
						bomb4 <= 0;
						x<=35;
						y<=440;
					end if;
				end if;
				if(((x>625 and x<640) and (y>100 and y<200)))then --juego ganado
					ganador <= 1;
					x<=35;
						y<=440;
				end if;
				if(x>630) then x<=x-1; end if;
				y<=y;
			end if;
		elsif(dispw(3)='1') then --Izquierda
			if(y>10 and y<460) then
				x<= x-1;
				
				if(vidas = 0) then
					x<=x;
					y<=y;
				end if;
				
				
				if(y>300 and y<420)then
					if(x>70 and x<102)then
						x<=x+1;
					end if;
				end if;	
				if(y>135 and y<260)then
					if(x>145 and x<170)then
						x<=x+1;
					end if;
				end if;	
				if(y>140 and y<310)then
					if(x>220 and x<245)then
						x<=x+1;
					end if;
				end if;	
				if(y>90 and y<210)then
					if(x>280 and x<305)then
						x<=x+1;
					end if;
				end if;	
				if(y>305 and y<415)then
					if(x>345 and x<420)then
						x<=x+1;
					end if;
				end if;	
				if(y>145 and y<360)then
					if(x>496 and x<522)then
						x<=x+1;
					end if;
				end if;	
				if(y>365 and y<471)then
					if(x>450 and x<475)then
						x<=x+1;
					end if;
				end if;	
				if(y>260 and y<317)then
					if(x>575 and x<599)then
						x<=x+1;
					end if;
				end if;	
				
				
				
				
				
				if((x>459 and x<490))then
					if((y>390 and y<460) and bomb7 = 1)then---------colisión de bombas-----------------------
						vidas <= vidas-1;
						bomb7 <= 0;
						x <= 35;
						y <= 440;
					end if;
				end if;
				if(x>15 and x<60)then---------colisión de bombas-----------------------
					if((y>100 and y<145) and bomb3 = 1)then
						vidas <= vidas-1;
						bomb3 <= 0;
						x<=35;
						y<=440;
					elsif((y>145 and y<200) and bomb2 = 1)then---------colisión de bombas-----------------------
						y <= 450;
						vidas <= vidas -1;
						bomb2 <= 0;
						x<=35;
						y<=440;
					end if;
				end if;
				if(x>510 and x<536)then---------colisión de bombas-----------------------
					if((y>310 and y<360)and bomb5 = 1)then
						vidas <= vidas-1;
						bomb5 <=0;
						x<=35;
						y<=440;
					end if;
				end if;
				
				
				
				if (x<30) then x<=x+1; end if;
				y<=y;
			end if;
		else
			y<=y;
			x<=x;
		end if;
	end if;
	
	
end process;
  

END behavior;
