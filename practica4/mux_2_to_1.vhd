library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	mux_2_to_1  is
	port(
		S: in  std_logic;
		A: in std_logic_vector (15 DOWNTO 0);
		B: in std_logic_vector (15 DOWNTO 0);
		Y:	out std_logic_vector(15 DOWNTO 0)
	);
end mux_2_to_1;

architecture  function_table  of  mux_2_to_1  is
		begin
			with S select 
				Y <= A when '0',
						  B when '1',
						  "XXXXXXXXXXXXXXXX" when others;
		
end  function_table;