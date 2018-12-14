library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity	registry_file  is
	port(
		RW     : IN STD_LOGIC;
		R      : IN STD_LOGIC;
		DD     : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
		AD     : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		BD     : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		AA     : IN  STD_LOGIC_VECTOR (2  DOWNTO  0);
		BA     : IN  STD_LOGIC_VECTOR (2  DOWNTO  0);
		DA     : IN  STD_LOGIC_VECTOR (2  DOWNTO  0);
		DIPA   : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		DIPO   : OUT  STD_LOGIC_VECTOR (15 DOWNTO 0);
		clk    : IN  STD_LOGIC
	);
end registry_file;

architecture table	of  registry_file  is
	type registerFile is array(7 DOWNTO 0) of std_logic_vector(15 DOWNTO 0);
	signal registers : registerFile:=(others => x"0000");
	begin
	regFile : PROCESS(clk) is
		begin
			if (clk 'event  AND  clk =  '1') then
				if R = '1' then
					registers <= (others => x"0000");
					-- registers(to_integer(unsigned(DA))) <= x"0000";
				else
					if RW = '1' THEN
						registers(to_integer(unsigned(DA))) <= DD;
					END IF;
				end if;
			end if;
		end  process;
		AD <= registers(to_integer(unsigned(AA)));
		BD <= registers(to_integer(unsigned(BA)));
		DIPO <= registers(to_integer(unsigned(DIPA)));
end table;