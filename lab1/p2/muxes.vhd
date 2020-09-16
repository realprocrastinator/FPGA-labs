LIBRARY ieee;
USE ieee.std_logic_1164.all;

--simple multiplexers

ENTITY muxes IS
	--s <= sw9, y0-3 <= sw0-3, x0-3 <= sw4-7
	PORT(
			SW				:IN 	STD_LOGIC_VECTOR(9 DOWNTO 0);
			LEDG 			:OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0)
		  );
END muxes;

ARCHITECTURE LogicFunction OF muxes IS
BEGIN
	LEDG(0) <= ((NOT SW(9)) AND SW(4)) OR (SW(9) AND SW(0));
	LEDG(1) <= ((NOT SW(9)) AND SW(5)) OR (SW(9) AND SW(1));
	LEDG(2) <= ((NOT SW(9)) AND SW(6)) OR (SW(9) AND SW(2));
	LEDG(3) <= ((NOT SW(9)) AND SW(7)) OR (SW(9) AND SW(3));
END LogicFunction;

