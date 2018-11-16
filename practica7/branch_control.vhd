library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	branch_control  is
	port(
		PL: in  std_logic;
		JB: in  std_logic;
		BC: in  std_logic;
		N : in  std_logic;
		Z : in  std_logic;
		OP: out std_logic_vector(1 DOWNTO 0)
	);
end branch_control;

architecture  function_table  of  branch_control  is
	signal OPA : std_logic_vector(1 DOWNTO 0) := "00";
		begin
			OPA(1) <= PL AND ((BC AND N) OR Z);
			OPA(0) <= PL AND JB;
			OP <= OPA;
		
end  function_table;