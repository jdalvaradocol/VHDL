-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity principal is
	port 
	(
		audio_i	:  in std_logic_vector(7 downto 0); 
		audio_o	: out std_logic_vector(7 downto 0) 
	);
end principal;


architecture Behavioral of principal is

signal COE00 :	integer range 0 to 100000:= 1000; 
signal COE01 :	integer range 0 to 100000:= 2000; 
signal COE02 : integer range 0 to 100000:= 3000; 
signal COE03 :	integer range 0 to 100000:= 4000; 
signal COE04 :	integer range 0 to 100000:= 5000; 
signal COE05 :	integer range 0 to 100000:= 6000; 
signal COE06 :	integer range 0 to 100000:= 7000; 
signal COE07 :	integer range 0 to 100000:= 8000; 
signal COE08 :	integer range 0 to 100000:= 9000; 
signal COE09 :	integer range 0 to 100000:= 10000; 
signal COE10 :	integer range 0 to 100000:= 11000; 
signal COE11 :	integer range 0 to 100000:= 12000; 
signal COE12 :	integer range 0 to 100000:= 13000; 
signal COE13 :	integer range 0 to 100000:= 14000; 
signal COE14 :	integer range 0 to 100000:= 15000; 
signal COE15 :	integer range 0 to 100000:= 16000; 
signal COE16 :	integer range 0 to 100000:= 17000; 
signal COE17 :	integer range 0 to 100000:= 18000; 
signal COE18 :	integer range 0 to 100000:= 19000; 
signal COE19 :	integer range 0 to 100000:= 20000; 
signal COE20 :	integer range 0 to 100000:= 21000; 

signal filtro : integer range 0 to 255:= 100; 

signal audio00 : integer range 0 to 255:= 0; 
signal audio01 : integer range 0 to 255:= 0; 
signal audio02 : integer range 0 to 255:= 0; 
signal audio03 : integer range 0 to 255:= 0; 
signal audio04 : integer range 0 to 255:= 0; 
signal audio05 : integer range 0 to 255:= 0; 
signal audio06 : integer range 0 to 255:= 0; 
signal audio07 : integer range 0 to 255:= 0; 
signal audio08 : integer range 0 to 255:= 0; 
signal audio09 : integer range 0 to 255:= 0; 
signal audio10 : integer range 0 to 255:= 0; 
signal audio11 : integer range 0 to 255:= 0; 
signal audio12 : integer range 0 to 255:= 0; 
signal audio13 : integer range 0 to 255:= 0; 
signal audio14 : integer range 0 to 255:= 0; 
signal audio15 : integer range 0 to 255:= 0; 
signal audio16 : integer range 0 to 255:= 0; 
signal audio17 : integer range 0 to 255:= 0; 
signal audio18 : integer range 0 to 255:= 0; 
signal audio19 : integer range 0 to 255:= 0; 
signal audio20 : integer range 0 to 255:= 0; 

begin

	audio00 <= to_integer(unsigned(audio_i));

	filtro <= 	audio00 * COE00 + audio01 * COE01 +
					audio02 * COE02 +	audio03 * COE03 +
					audio04 * COE04 + audio05 * COE05 +
					audio06 * COE06 + audio07 * COE07 +
					audio08 * COE08 + audio09 * COE09 +
					audio10 * COE10 + audio11 * COE11 +
					audio12 * COE12 + audio13 * COE13 +
					audio14 * COE14 + audio15 * COE15 +
					audio16 * COE16 + audio17 * COE17 +
					audio18 * COE18 + audio19 * COE19 ;
					
	audio_o <= std_logic_vector(to_unsigned(filtro, audio_o'length));

	audio20 <= 	audio19;
	audio19 <= 	audio18;
	audio18 <= 	audio17;
	audio17 <= 	audio16;
	audio16 <= 	audio15;
	audio15 <= 	audio14;
	audio14 <= 	audio13;
	audio13 <= 	audio12;
	audio12 <= 	audio11;
	audio11 <= 	audio10;
	audio10 <= 	audio09;
	audio09 <= 	audio08;
	audio08 <= 	audio07;
	audio07 <= 	audio06;
	audio06 <= 	audio05;
	audio05 <= 	audio04;
	audio04 <= 	audio03;
	audio03 <= 	audio02;
	audio02 <= 	audio01;
	audio01 <= 	audio00;
	
end Behavioral;



