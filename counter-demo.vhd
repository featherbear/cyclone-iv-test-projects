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
		HEX0	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1	: OUT STD_LOGIC_VECTOR(0 TO 6);
		HEX2	: OUT STD_LOGIC_VECTOR(0 TO 6);
		HEX3	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END counter_demo;

ARCHITECTURE structure OF counter_demo IS
	SIGNAL a, b, c, d : std_logic_vector(3 DOWNTO 0);
BEGIN
	a <= "0101";
	
	--7-segment decoders
	h3: ENTITY work.bcd_to_hex PORT MAP (
		I => d,
		O => HEX3
	);
	h2: ENTITY work.bcd_to_hex PORT MAP (
		I => c,
		O => HEX2
	);
	h1: ENTITY work.bcd_to_hex PORT MAP (
		I => b,
		O => HEX1
	);
	h0: ENTITY work.bcd_to_hex PORT MAP (
		I => a,
		O => HEX0
	);
	
END structure;	