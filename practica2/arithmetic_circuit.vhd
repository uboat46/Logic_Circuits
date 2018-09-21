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
	SIGNAL INS : 	STD_LOGIC_VECTOR (2 DOWNTO 0) := S & C_in;
	BEGIN
		with INS select 
				G <= A when "000",
						  (A + 1) when "001",
						  (A + B) when "010",
						  (A + B + 1) when "011",
						  (A + NOT(B)) when "100",
						  (A - B) when "101",
						  (A - 1) when "110",
						  A when "111",
						  "XXXXXXXXXXXXXXXX" when others;
		
end table;