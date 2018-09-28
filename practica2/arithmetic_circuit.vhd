library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	arithmetic_circuit  is
	port(
		C_in   : IN  STD_LOGIC;
		A      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
		B      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
		S      : IN  STD_LOGIC_VECTOR (1  DOWNTO  0);
		C_out  : OUT  STD_LOGIC;
		G      : OUT  STD_LOGIC_VECTOR (15  DOWNTO  0)
	);
end arithmetic_circuit;

architecture table	of  arithmetic_circuit  is
	SIGNAL INS : 	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL A_aux : 	STD_LOGIC_VECTOR (16 DOWNTO 0);
	SIGNAL B_aux : 	STD_LOGIC_VECTOR (16 DOWNTO 0);
	SIGNAL G_aux : 	STD_LOGIC_VECTOR (16 DOWNTO 0);
	BEGIN
		INS <= S & C_in;
		A_aux <= "0" & A;
		B_aux <= "0" & B;
		with INS select 
				G_aux <= A_aux when "000",
						  (A_aux + 1) when "001",
						  (A_aux + B_aux) when "010",
						  (A_aux + B_aux + 1) when "011",
						  (A_aux + NOT(B_aux)) when "100",
						  (A_aux - B_aux) when "101",
						  (A_aux - 1) when "110",
						  A_aux when "111",
						  "XXXXXXXXXXXXXXXXX" when others;
		G <= G_aux(15 DOWNTO 0);
		C_out <= G_aux(16);
		
end table;