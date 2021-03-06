library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity	ram  is
	port(
		RESET   : IN STD_LOGIC;
		MW      : IN STD_LOGIC;
		ADDRESS : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		DATA_IN : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		DATA_OUT: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		clk     : IN  STD_LOGIC
	);
end ram;

architecture table	of  ram  is
	type registerFile is array(2**8 - 1 DOWNTO 0) of std_logic_vector(15 DOWNTO 0);
	signal registers : registerFile:=(others => x"0000");
	begin
	regFile : PROCESS(clk) is
		begin
			if (clk 'event  AND  clk =  '1') then
				if RESET = '1' then
					registers <= (others => x"0000");
				else
					if MW = '1' THEN
						registers(to_integer(unsigned(ADDRESS))) <= DATA_IN;
					END IF;
				end if;
			end if;
			DATA_OUT <= registers(to_integer(unsigned(ADDRESS)));
		end  process;
end table;