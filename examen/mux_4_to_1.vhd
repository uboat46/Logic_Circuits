library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	mux_4_to_1  is
	port(
		S: in  std_logic_vector (0 to 1);
		A: in std_logic_vector (0 to 3);
		B: in std_logic_vector (0 to 3);
		C: in std_logic_vector (0 to 3);
		D: in std_logic_vector (0 to 3);
		Y:	out std_logic_vector(0 to 3)
	);
end mux_4_to_1;

architecture  function_table  of  mux_4_to_1  is
		begin
			with S select 
				Y <= A when "00",
						  B when "01",
						  C when "10",
						  D when "11",
						  "XXXX" when others;
		
end  function_table;