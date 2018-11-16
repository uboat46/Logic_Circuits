library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	extend  is
	port(
		IR: in std_logic_vector(5 DOWNTO 0);
		EX: out std_logic_vector(15 DOWNTO 0)
	);
end extend;

architecture  function_table  of  extend  is
		begin
			WITH IR(5) select
					EX <= "0000000000" & IR WHEN '0',
							"1111111111" & IR WHEN '1',
							"XXXXXXXXXXXXXXXX" WHEN OTHERS;
		
end  function_table;