LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bcd_to_hex IS
	PORT (
		I	: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		O	: OUT STD_LOGIC_VECTOR(0 TO 6)
	);
END bcd_to_hex;

ARCHITECTURE func of bcd_to_hex IS
BEGIN
	PROCESS (I) BEGIN
		CASE I IS
			WHEN "0000" => O <= "0000001"; -- 0
			WHEN "0001" => O <= "1001111"; -- 1
			WHEN "0010" => O <= "0010010"; -- 2
			WHEN "0011" => O <= "0000110"; -- 3
			WHEN "0100" => O <= "1001100"; -- 4
			WHEN "0101" => O <= "0100100"; -- 5
			WHEN "0110" => O <= "0100000"; -- 6
			WHEN "0111" => O <= "0001111"; -- 7
			WHEN "1000" => O <= "0000000"; -- 8
			WHEN "1001" => O <= "0000100"; -- 9
			WHEN "1010" => O <= "0000010"; -- a
			WHEN "1011" => O <= "1100000"; -- b
			WHEN "1100" => O <= "0110001"; -- C
			WHEN "1101" => O <= "1000010"; -- d
			WHEN "1110" => O <= "0110000"; -- E
			WHEN "1111" => O <= "0111000"; -- F
		END CASE;
	END PROCESS;
END func;
	