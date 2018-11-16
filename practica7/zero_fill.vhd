library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	zero_fill  is
	port(
		IR: in std_logic_vector(2 DOWNTO 0);
		ZF: out std_logic_vector(15 DOWNTO 0)
	);
end zero_fill;

architecture  function_table  of  zero_fill  is
		begin
			ZF(2 DOWNTO 0) <= IR;
			ZF(15 DOWNTO 3) <= "0000000000000";
		
end  function_table;