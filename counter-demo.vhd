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
	   CLK: IN STD_LOGIC;
		SEG: OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		KEY1: IN STD_LOGIC;
		KEY2: IN STD_LOGIC;
		KEY3: IN STD_LOGIC;
		KEY4: IN STD_LOGIC
	);
END counter_demo;

ARCHITECTURE structure OF counter_demo IS
	SIGNAL a, b, c, d : std_logic_vector(3 DOWNTO 0);
	
BEGIN
	disp: ENTITY work.PART_3461BS PORT MAP (
	   CLK => clk,
	   HEX0 =>"11" & KEY1 & KEY2 & KEY3 & KEY4,
		PIN => SEG
	);
	
	
END structure;	