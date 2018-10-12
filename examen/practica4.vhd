LIBRARY  IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY  work;

ENTITY  practica4  IS
	PORT(
		clk      :   IN    STD_LOGIC;
		FS       :   IN    STD_LOGIC_VECTOR (3  DOWNTO  0);
		A        :   IN    STD_LOGIC_VECTOR (7 DOWNTO 0);
		B        :   IN    STD_LOGIC_VECTOR (7 DOWNTO 0);
		act_dis1 :   OUT   STD_LOGIC;
		act_dis2 :   OUT   STD_LOGIC;
		act_dis4 :   OUT   STD_LOGIC;
		act_dis3 :   OUT   STD_LOGIC;
		C_out    :   OUT   STD_LOGIC;
		N		   :	 OUT   STD_LOGIC;
		Z		   :	 OUT   STD_LOGIC;
		display  :   OUT   STD_LOGIC_VECTOR (6  DOWNTO  0)
	);
END  practica4;

ARCHITECTURE bdf_type OF practica4 IS
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
	
	COMPONENT  logic_circuit
		port(
			S   	 : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			A      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
			B      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
			G      : OUT  STD_LOGIC_VECTOR (15  DOWNTO  0)
		);
	END COMPONENT;
	
	COMPONENT  shifter_circuit
		port(
			S   	 : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			B      : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
			G      : OUT  STD_LOGIC_VECTOR (15  DOWNTO  0)
		);
	END COMPONENT;
	
	COMPONENT  mux_2_to_1
		port(
			S: in  std_logic;
			A: in std_logic_vector (15 DOWNTO 0);
			B: in std_logic_vector (15 DOWNTO 0);
			Y:	out std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT  zero_detect
		port(
			I: in  std_logic_vector (15 DOWNTO 0);
			Z:	out std_logic
		);
	END COMPONENT;
	
	
	SIGNAL   A_in :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   B_in :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   GA :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   GL :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   GS :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   O :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   OM :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	BEGIN
	
	N <= OM(15);
	
	b2v_inst_practica2 : practica2
		PORT  MAP(
			clk => clk ,
			dip_1 => OM(15 DOWNTO 12),
			dip_2 => OM(11 DOWNTO 8),
			dip_3 => OM(7 DOWNTO 4),
			dip_4 => OM(3 DOWNTO 0),
			led_1 => act_dis1 ,
			led_2 => act_dis2 ,
			led_3 => act_dis3 ,
			led_4 => act_dis4 ,
			--D => D,
			bcd_to_7 => display
		);
		
	b2v_instac_a : arithmetic_circuit
		PORT  MAP(
			C_in => FS(0),
			A => A_in ,
			B => B_in ,
			S => FS(2  DOWNTO 1),
			C_out => C_out ,
			G => GA
		);
		
	b2v_instac_l : logic_circuit
		PORT  MAP(
			S   	 => FS(1 DOWNTO 0),
			A      => A_in,
			B      => B_in,
			G      => GL
		);
		
	b2v_instac_s : shifter_circuit
		PORT  MAP(
			S   	 => FS(1 DOWNTO 0),
			B      => B_IN,
			G      => GS
		);
		
	b2v_instac_mux_1 : mux_2_to_1
		PORT  MAP(
			S=> FS(3),
			A=> GA,
			B=> GL,
			Y=>	O
		);
		
	b2v_instac_mux_2 : mux_2_to_1
		PORT  MAP(
			S=> (FS(3) AND FS(2)),
			A=> O,
			B=> GS,
			Y=>	OM
		);
		
	b2v_instac_zero : zero_detect
		PORT  MAP(
			I=> OM,
			Z=>	Z
		);
		
		
	A_in(7  DOWNTO  0)  <= A;
	B_in(7  DOWNTO  0)  <= B;
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