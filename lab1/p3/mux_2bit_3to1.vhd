LIBRARY ieee;
USE ieee.std_logic_1164.all;

--component definition

ENTITY part3 IS
	--s <= sw9, sw8, u,v,w <= sw5-0
	PORT(
			SW				:IN 	STD_LOGIC_VECTOR(9 DOWNTO 0);
			LEDG 			:OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0)
		  );
END part3;

ARCHITECTURE Behaviour OF part3 IS
	COMPONENT mux_2bit_3to1
		PORT(	s,u,v,w 	:IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
				m 			:OUT		STD_LOGIC_VECTOR(1 DOWNTO 0)
		);
	END COMPONENT;
	SIGNAL m		: 		STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	M0: mux_2bit_3to1 PORT MAP (SW(9 DOWNTO 8),
			SW(5 DOWNTO 4),SW(3 DOWNTO 2),SW(1 DOWNTO 0),LEDG(1 DOWNTO 0));
END Behaviour;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

--implement 2-bit 3to1 mutiplexer

ENTITY mux_2bit_3to1 IS
	PORT(	s,u,v,w 	:IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
			m			:OUT		STD_LOGIC_VECTOR(1 DOWNTO 0));
END mux_2bit_3to1;

ARCHITECTURE Behaviour OF mux_2bit_3to1 IS
SIGNAL first_signal	: 		STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	first_signal(0) <= (NOT s(0) AND u(0)) OR (s(0) AND v(0));
	first_signal(1) <= (NOT s(0) AND u(1)) OR (s(0) AND v(1));
	m(0) <= (NOT s(1) AND first_signal(0)) OR (s(1) AND w(0));
	m(1) <= (NOT s(1) AND first_signal(1)) OR (s(1) AND w(1));
END Behaviour;