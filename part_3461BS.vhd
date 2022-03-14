LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY PART_3461BS IS
    PORT (
	     CLK  : IN STD_LOGIC;
        HEX0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
        HEX1 : IN STD_LOGIC_VECTOR(5 DOWNTO 0) := "100001"; --(OTHERS => '0');
        HEX2 : IN STD_LOGIC_VECTOR(5 DOWNTO 0) := "000010"; --(OTHERS => '0');
        HEX3 : IN STD_LOGIC_VECTOR(5 DOWNTO 0) := "100011"; --(OTHERS => '0');
        PIN : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
END PART_3461BS;

ARCHITECTURE func OF PART_3461BS IS
    SIGNAL SEG_DISPLAY : STD_LOGIC_VECTOR(6 DOWNTO 0); -- Set to 0 to show segment
    SIGNAL SEG_DOT : STD_LOGIC; -- Set to 0 to show dot
	 
    SIGNAL SEG_N : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
	 
	 SIGNAL tick : STD_LOGIC := '0';
	 
	 constant holdTime : integer := 80000;
BEGIN
    PIN(0) <= SEG_DISPLAY(2);
    PIN(1) <= SEG_DISPLAY(3);
    PIN(2) <= SEG_DOT;
    PIN(3) <= SEG_DISPLAY(4);
    PIN(4) <= SEG_DISPLAY(0);
    PIN(5) <= SEG_N(0);
    PIN(6) <= SEG_DISPLAY(5);
    PIN(7) <= SEG_N(1);
    PIN(8) <= SEG_N(2);
    PIN(9) <= SEG_DISPLAY(1);
    PIN(10) <= SEG_DISPLAY(6);
    PIN(11) <= SEG_N(3);

	 PROCESS
		  VARIABLE counter : natural range 0 to holdTime := 0;
	 BEGIN
	     WAIT UNTIL rising_edge(clk);
		  counter := counter + 1;
		  IF counter = holdTime THEN
		      tick <= NOT(tick);
		  END IF;
	 END PROCESS;
	 
    PROCESS IS
        VARIABLE NEXT_VALUE : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
		  VARIABLE NEXT_VALUE_BUFFER : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
    BEGIN
	     WAIT UNTIL rising_edge(tick);
		  
        SEG_N <= SEG_N(0) & SEG_N(3 DOWNTO 1);


        CASE SEG_N IS
            WHEN "1000" => NEXT_VALUE_BUFFER := HEX0;
            WHEN "0100" => NEXT_VALUE_BUFFER := HEX1;
            WHEN "0010" => NEXT_VALUE_BUFFER := HEX2;
            WHEN "0001" => NEXT_VALUE_BUFFER := HEX3;
				WHEN OTHERS => NEXT_VALUE_BUFFER := (OTHERS => '0');
        END CASE;
		  
		  
        -- Clockwise from top, then horizontal bar
        IF NEXT_VALUE(5) = '1' THEN
			  SEG_DOT <= NOT(NEXT_VALUE(4)); -- Set input(4) to 1 to show
			  CASE NEXT_VALUE(3 DOWNTO 0) IS
					WHEN "0000" => SEG_DISPLAY <= "0000001"; -- 0
					WHEN "0001" => SEG_DISPLAY <= "1001111"; -- 1
					WHEN "0010" => SEG_DISPLAY <= "0010010"; -- 2
					WHEN "0011" => SEG_DISPLAY <= "0000110"; -- 3
					WHEN "0100" => SEG_DISPLAY <= "1001100"; -- 4
					WHEN "0101" => SEG_DISPLAY <= "0100100"; -- 5
					WHEN "0110" => SEG_DISPLAY <= "0100000"; -- 6
					WHEN "0111" => SEG_DISPLAY <= "0001111"; -- 7
					WHEN "1000" => SEG_DISPLAY <= "0000000"; -- 8
					WHEN "1001" => SEG_DISPLAY <= "0000100"; -- 9
					WHEN "1010" => SEG_DISPLAY <= "0000010"; -- a
					WHEN "1011" => SEG_DISPLAY <= "1100000"; -- b
					WHEN "1100" => SEG_DISPLAY <= "0110001"; -- C
					WHEN "1101" => SEG_DISPLAY <= "1000010"; -- d
					WHEN "1110" => SEG_DISPLAY <= "0110000"; -- E
					WHEN "1111" => SEG_DISPLAY <= "0111000"; -- F
			  END CASE;
		  ELSE
			  SEG_DISPLAY <= (OTHERS => '1');
			  SEG_DOT <= '1';
		  END IF;
		  
		  NEXT_VALUE := NEXT_VALUE_BUFFER;
    END PROCESS;
END func;