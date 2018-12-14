library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity	ram  is
	port(
		RESET   : IN STD_LOGIC;
		MW      : IN STD_LOGIC;
		BTN_W   : IN STD_LOGIC;
		ADDRESS : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		DIPA    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		DIPB    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		DATA_IN : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		DATA_OUT: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		clk     : IN  STD_LOGIC
	);
end ram;

architecture table	of  ram  is
	type registerFile is array(2**8 - 1 DOWNTO 0) of std_logic_vector(15 DOWNTO 0);
	signal registers : registerFile:=(others => x"0000");
	signal data_write : std_logic_vector(15 DOWNTO 0);
	signal adress_write : std_logic_vector(15 DOWNTO 0);
	signal btn_write : std_logic;
	begin
	data_write <= "00000000" & DIPA;
	adress_write <= "00000000" & DIPB;
	btn_write <= not(BTN_W);
	regFile : PROCESS(clk) is
		begin
			if (clk 'event  AND  clk =  '1') then
				if RESET = '1' then
					registers <= (others => x"0000");
				else
					if MW = '1' THEN
						registers(to_integer(unsigned(ADDRESS))) <= DATA_IN;
					END IF;
					if btn_write = '1' THEN
						registers(to_integer(unsigned(adress_write))) <= data_write;
					END IF;
				end if;
			end if;
			--registers(0000000000000000) <= "0000000000000001";
			--registers(0000000000000001) <= "0000000000000100";
		end  process;
		DATA_OUT <= registers(to_integer(unsigned(ADDRESS)));
end table;