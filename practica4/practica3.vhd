LIBRARY  IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY  work;

ENTITY  practica3  IS
	PORT(
		clk      :   IN    STD_LOGIC;
		I_0      :   IN    STD_LOGIC_VECTOR (0 TO 3);
		I_1      :   IN    STD_LOGIC_VECTOR (0 TO 3);
		I_2      :   IN    STD_LOGIC_VECTOR (0 TO 3);
		I_3      :   IN    STD_LOGIC_VECTOR (0 TO 3);
		Oper     :   IN    STD_LOGIC_VECTOR (2  DOWNTO  0);
		act_dis1 :   OUT   STD_LOGIC;
		act_dis2 :   OUT   STD_LOGIC;
		act_dis4 :   OUT   STD_LOGIC;
		act_dis3 :   OUT   STD_LOGIC;
		C_out    :   OUT   STD_LOGIC;
		display  :   OUT   STD_LOGIC_VECTOR (6  DOWNTO  0);
		oper_led :   OUT   STD_LOGIC_VECTOR (2  DOWNTO  0)
	);
END  practica3;

ARCHITECTURE bdf_type OF practica3 IS
	COMPONENT  practica2
		PORT(
			clk      	: IN  STD_LOGIC;
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
	
	COMPONENT  arithmetic_circuit
		port(
		C_in   : IN  STD_LOGIC;
		A      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
		B      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
		S      : IN  STD_LOGIC_VECTOR (1  DOWNTO  0);
		C_out  : OUT  STD_LOGIC;
		G      : OUT  STD_LOGIC_VECTOR (15  DOWNTO  0)
	);
	END COMPONENT;
	
	
	SIGNAL   A_in :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   B_in :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   BCD :   STD_LOGIC_VECTOR (0 TO 15);
	SIGNAL   G :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	BEGIN
						  
	oper_led <= Oper;

	b2v_inst_practica2 : practica2
		PORT  MAP(
			clk => clk ,
			dip_1 => G(15 DOWNTO 12),
			dip_2 => G(11 DOWNTO 8),
			dip_3 => G(7 DOWNTO 4),
			dip_4 => G(3 DOWNTO 0),
			led_1 => act_dis1 ,
			led_2 => act_dis2 ,
			led_3 => act_dis3 ,
			led_4 => act_dis4 ,
			--D => D,
			bcd_to_7 => display
		);
		
	b2v_instac : arithmetic_circuit
		PORT  MAP(
			C_in => Oper(2),
			A => A_in ,
			B => B_in ,
			S => Oper(1  DOWNTO 0),
			C_out => C_out ,
			G => G
		);
		
	
		
	A_in(7  DOWNTO  4)  <= I_0;
	A_in(3  DOWNTO  0)  <= I_1;
	B_in(7  DOWNTO  4)  <= I_2;
	B_in(3  DOWNTO  0)  <= I_3;
	A_in (8)   <=   '0';
	A_in (9)   <=   '0';
	A_in (10)  <=  '0';
	A_in (11)  <=  '0';
	A_in (12)  <=  '0';
	A_in (13)  <=  '0';
	A_in (14)  <=  '0';
	A_in (15)  <=  '0';
	B_in (8)   <=  '0';
	B_in (9)   <=  '0';
	B_in (10)  <=  '0';
	B_in (11)  <=  '0';
	B_in (12)  <=  '0';
	B_in (13)  <=  '0';
	B_in (14)  <=  '0';
	B_in (15)  <=  '0';
END  bdf_type;