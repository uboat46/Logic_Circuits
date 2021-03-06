library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	logic_circuit  is
	port(
		S   	 : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		A      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
		B      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
		G      : OUT  STD_LOGIC_VECTOR (15  DOWNTO  0)
	);
end logic_circuit;

architecture table	of  logic_circuit  is
	BEGIN
		with S select 
				G <= (A AND B) when "00",
						  (A OR B) when "01",
						  (A XOR B) when "10",
						  (NOT(A)) when "11",
						  "XXXXXXXXXXXXXXXX" when others;
end table;