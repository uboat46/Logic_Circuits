library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	zero_detect  is
	port(
		I: in  std_logic_vector (15 DOWNTO 0);
		Z:	out std_logic
	);
end zero_detect;

architecture  function_table  of  zero_detect  is
		begin
			with I select 
				Z <= '1' when "0000000000000000",
						  '0' when others;
		
end  function_table;