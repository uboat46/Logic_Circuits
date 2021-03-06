library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity  bcd_to_7_segment  is
	port(
		BTS: in  std_logic_vector (3 downto 0);
		A: out  std_logic;
		B: out  std_logic;
		C: out  std_logic;
		D: out  std_logic;
		E: out  std_logic;
		F: out  std_logic;
		G: out  std_logic		
	);
end  bcd_to_7_segment;

architecture  led_table  of  bcd_to_7_segment  is
	begin
		A  <= (NOT BTS(2) and  not BTS(0)) or (BTS(1) and BTS (2)) or (not BTS(3) and BTS(1)) or (not BTS(3) and BTS(2) and BTS(0)) or (BTS(3) and not BTS(1) and not BTS(0)) or (BTS(3) and not BTS(2) and not BTS(1)) ;
		B  <= (not BTS(3) and not BTS(2)) or (not BTS(2) and not BTS(0)) or (BTS(3) and not BTS(1) and BTS(0)) or (not BTS(3) and not BTS(1) and not BTS(0)) or (not BTS(3) and BTS(1) and BTS(0));
		C  <= (not BTS(1) and BTS(0)) or (BTS(3) and not BTS(2)) or (not BTS(3) and BTS(2)) or (not BTS(3) and not BTS(1)) or (not BTS(3) and BTS(0));
		D  <= (BTS(3) and not BTS(1) and not BTS(0)) or (BTS(2) and not BTS(1) and BTS(0)) or (BTS(2) and BTS(1) and not BTS(0)) or (not BTS(2) and BTS(1) and BTS(0)) or (not BTS(3) and not BTS(2) and not BTS(0));
		E  <= (BTS(3) and BTS(2)) or (BTS(1) and not BTS(0)) or (BTS(3) and BTS(1) and BTS(0)) or (not BTS(2) and not BTS(1) and not BTS(0));
		F  <= (not BTS(1) and not BTS(0)) or (BTS(3) and not BTS(2)) or (BTS(3) and BTS(1)) or (not BTS(3) and BTS(2) and not BTS(1)) or (BTS(2) and BTS(1) and not BTS(0));	
		G  <= (BTS(3) and not BTS(2)) or (BTS(1) and not BTS(0)) or (BTS(3) and BTS(0)) or (not BTS(2) and BTS(1)) or (not BTS(3) and BTS(2) and not BTS(1));	
end  led_table;