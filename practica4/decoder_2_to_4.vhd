library  IEEE;
use  IEEE.STD_LOGIC_1164.ALL;
use  IEEE.STD_LOGIC_ARITH.ALL;
use  IEEE.STD_LOGIC_UNSIGNED.ALL;

entity  decoder_2_to_4  is
	port(
		S: in  std_logic_vector (0 to 1);
		D0: out  std_logic;
		D1: out  std_logic;
		D2: out  std_logic;
		D3: out  std_logic
	);
end  decoder_2_to_4;

architecture  function_table  of  decoder_2_to_4  is
	begin
		D0  <= NOT(S(0))  AND  NOT(S(1)) ;
		D1  <= NOT(S(0))  AND S(1);
		D2  <= S(0)  AND  NOT(S(1));
		D3  <= S(0)  AND S(1);
end  function_table;