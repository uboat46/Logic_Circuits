library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity	shifter_circuit  is
	port(
		S   	 : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		B      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
		G      : OUT  STD_LOGIC_VECTOR (15  DOWNTO  0)
	);
end shifter_circuit;

architecture table	of  shifter_circuit  is
SIGNAL G_AUX: STD_LOGIC_VECTOR (16 DOWNTO 0);
	BEGIN
		with S select 
				G_AUX <= "0" & B when "00",
							"0" & B  when "01",
						    B & "0" when "10",
						   "XXXXXXXXXXXXXXXXX" when others;
		with S select
				G <= G_AUX(15 DOWNTO 0) WHEN "00",
						G_AUX(16 DOWNTO 1) WHEN "01",
						G_AUX(15 DOWNTO 0) WHEN "10",
						"XXXXXXXXXXXXXXXX" when others;
end table;