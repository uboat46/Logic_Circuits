library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	par_impar_ex3  is
	port(
		A: in std_logic_vector (3 downto 0);
		B: in std_logic_vector (3 downto 0);
		R: out std_logic_vector (3 downto 0);
		C:	out std_logic
	);
end par_impar_ex3;

architecture  function_table  of  par_impar_ex3  is
		signal r_aux: std_logic_vector (3 downto 0);
		begin
			r_aux <= ((A + B) - 3);
			C <= r_aux(0);
			R <= r_aux;
		
end  function_table;