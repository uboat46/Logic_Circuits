LIBRARY  IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY  work;

ENTITY  practica6  IS
	PORT(
		clk      :   IN    STD_LOGIC;
		ADDRESS  :   IN    STD_LOGIC_VECTOR (7  DOWNTO  0);
		DATA_IN  :   IN    STD_LOGIC_VECTOR (7  DOWNTO  0);
		RESET    :   IN    STD_LOGIC;
		WR       :   IN    STD_LOGIC;
		act_dis1 :   OUT   STD_LOGIC;
		act_dis2 :   OUT   STD_LOGIC;
		act_dis4 :   OUT   STD_LOGIC;
		act_dis3 :   OUT   STD_LOGIC;
		LED_WRITE:   OUT   STD_LOGIC;
		LED_RESET:   OUT   STD_LOGIC;
		display  :   OUT   STD_LOGIC_VECTOR (6  DOWNTO  0)
	);
END  practica6;

ARCHITECTURE bdf_type OF practica6 IS
	COMPONENT  practica2
		PORT(
			clk      : IN  STD_LOGIC;
			dip_1    : IN  STD_LOGIC_VECTOR (0 TO 3);
			dip_2    : IN  STD_LOGIC_VECTOR (0 TO 3);
			dip_3    : IN  STD_LOGIC_VECTOR (0 TO 3);
			dip_4    : IN  STD_LOGIC_VECTOR (0 TO 3);
			led_1    : OUT  STD_LOGIC;
			led_2    : OUT  STD_LOGIC;
			led_3    : OUT  STD_LOGIC;
			led_4    : OUT  STD_LOGIC;
			--D       : OUT  STD_LOGIC_VECTOR (0 TO 1);
			bcd_to_7 : OUT  STD_LOGIC_VECTOR (6  DOWNTO  0)
		);
	END  COMPONENT;
	
	COMPONENT ram
		port(
			RESET   : IN STD_LOGIC;
			MW      : IN STD_LOGIC;
			ADDRESS : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			DATA_IN : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			DATA_OUT: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			clk     : IN  STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL WN : STD_LOGIC:= NOT(WR);
	SIGNAL RN : STD_LOGIC:= NOT(RESET);
	SIGNAL DO : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL AD : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL DI : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	BEGIN
		b2v_inst_ram : ram
			PORT  MAP(
				RESET    => RN,
				MW       => WN,
				ADDRESS  => AD,
				DATA_IN  => DI,
				DATA_OUT => DO,
				clk    => clk
			);
	
		b2v_inst_practica2 : practica2
			PORT  MAP(
				clk => clk ,
				dip_1 => DO(15 DOWNTO 12),
				dip_2 => DO(11 DOWNTO 8),
				dip_3 => DO(7 DOWNTO 4),
				dip_4 => DO(3 DOWNTO 0),
				led_1 => act_dis1,
				led_2 => act_dis2,
				led_3 => act_dis3,
				led_4 => act_dis4,
				--D => D,
				bcd_to_7 => display
			);
		AD(15 DOWNTO 8) <= "00000000";
		AD(7 DOWNTO 0) <= ADDRESS;
		DI(15 DOWNTO 8) <= "00000000";
		DI(7  DOWNTO 0) <= DATA_IN;
		
		LED_WRITE <= WN;
		LED_RESET <= RN;
END  bdf_type;