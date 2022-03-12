LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

use IEEE.STD_LOGIC_1164.ALL; 

use IEEE.STD_LOGIC_ARITH.ALL; 

use IEEE.NUMERIC_STD.ALL; 

use IEEE.STD_LOGIC_UNSIGNED.ALL; 

ENTITY counter_demo IS
	PORT (
		SEG: OUT STD_LOGIC_VECTOR(0 TO 11)
	);
END counter_demo;

ARCHITECTURE structure OF counter_demo IS
	SIGNAL a, b, c, d : std_logic_vector(3 DOWNTO 0);
BEGIN
	a <= "1111";
	
	h: ENTITY work.part_3461BS PORT MAP (
		HEX0 => '1' & '1' & a,
		PIN => SEG
	);
	
END structure;	