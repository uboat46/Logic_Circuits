library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity	program_counter  is
	port(
		IR      : IN STD_LOGIC_VECTOR (15  DOWNTO  0);
		AD      : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		OP      : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		ADO     : OUT  STD_LOGIC_VECTOR (15  DOWNTO  0);
		R       : IN  STD_LOGIC;
		clk     : IN  STD_LOGIC
	);
end program_counter;

architecture table	of  program_counter  is
	signal count : STD_LOGIC_VECTOR (15  DOWNTO  0) := "0000000000000000";
	begin
	counter : PROCESS(clk) is
		begin
			if (clk 'event  AND  clk =  '1') then
				if R = '1' then
					count <= "0000000000000000";
				else
					if OP = "00" THEN
						count <= count + 1;
					END IF;
					if OP = "01" THEN
						count <= AD;
					END IF;
					if OP = "10" THEN
						count <= count + IR;
					END IF;
					if OP = "11" THEN
						count <= count + 1;
					END IF;
				end if;
			end if;
		end  process;
		ADO <= count; 
end table;