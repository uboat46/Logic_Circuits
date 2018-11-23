library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity	instruction_decoder  is
	port(
		OPCODE: IN std_logic_vector(6 DOWNTO 0);
		DR:     IN std_logic_vector(2 DOWNTO 0);
		SA:     IN std_logic_vector(2 DOWNTO 0);
		SB:     IN std_logic_vector(2 DOWNTO 0);
		DA:     OUT std_logic_vector(2 DOWNTO 0);
		AA:     OUT std_logic_vector(2 DOWNTO 0);
		BA:     OUT std_logic_vector(2 DOWNTO 0);
		MB:     OUT std_logic;
		FS:     OUT std_logic_vector(3 DOWNTO 0);
		MD:     OUT std_logic;
		RW:     OUT std_logic;
		MW:     OUT std_logic;
		PL:     OUT std_logic;
		JB:     OUT std_logic;
		BC:     OUT std_logic
	);
end instruction_decoder;

architecture  function_table  of  instruction_decoder  is
		begin
			DA <= DR;
			AA <= SA;
			BA <= SB;
			MB <= OPCODE(6);
			FS(3) <= OPCODE(3);
			FS(2) <= OPCODE(2);
			FS(1) <= OPCODE(1);
			FS(0) <= OPCODE(0) AND NOT(OPCODE(5) AND OPCODE(6));
			MD <= OPCODE(4);
			RW <= NOT(OPCODE(5));
			MW <= OPCODE(5) AND NOT(OPCODE(6));
			PL <= OPCODE(5) AND OPCODE(6);
			JB <= OPCODE(4);
			BC <= OPCODE(0);
		
end  function_table;