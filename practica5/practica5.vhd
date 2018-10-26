LIBRARY  IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY  work;

ENTITY  practica5  IS
	PORT(
		clk      :   IN    STD_LOGIC;
		FS       :   IN    STD_LOGIC_VECTOR (3  DOWNTO  0);
		MD		   :   IN    STD_LOGIC;
		MB		   :   IN    STD_LOGIC;
		RW		   :   IN    STD_LOGIC;
		R        :   IN    STD_LOGIC;
		AA       :   IN    STD_LOGIC_VECTOR(2 DOWNTO 0);
		BA       :   IN    STD_LOGIC_VECTOR(2 DOWNTO 0);
		DA       :   IN    STD_LOGIC_VECTOR(2 DOWNTO 0);
		act_dis1 :   OUT   STD_LOGIC;
		act_dis2 :   OUT   STD_LOGIC;
		act_dis4 :   OUT   STD_LOGIC;
		act_dis3 :   OUT   STD_LOGIC;
		C_out    :   OUT   STD_LOGIC;
		N		   :	 OUT   STD_LOGIC;
		Z		   :	 OUT   STD_LOGIC;
		display  :   OUT   STD_LOGIC_VECTOR (6  DOWNTO  0)
	);
END  practica5;

ARCHITECTURE bdf_type OF practica5 IS
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
	
	COMPONENT  practica4
		port(
			clk      :   IN    STD_LOGIC;
			FS       :   IN    STD_LOGIC_VECTOR (3  DOWNTO  0);
			A        :   IN    STD_LOGIC_VECTOR (15 DOWNTO 0);
			B        :   IN    STD_LOGIC_VECTOR (15 DOWNTO 0);	
			C_out    :   OUT   STD_LOGIC;
			N		   :	 OUT   STD_LOGIC;
			Z		   :	 OUT   STD_LOGIC;
			F        :   OUT   STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT registry_file
		port(
			RW     : IN STD_LOGIC;
			R      : IN STD_LOGIC;
			DD     : IN  STD_LOGIC_VECTOR (15  DOWNTO  0);
			AD     : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			BD     : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			AA     : IN  STD_LOGIC_VECTOR (2  DOWNTO  0);
			BA     : IN  STD_LOGIC_VECTOR (2  DOWNTO  0);
			DA     : IN  STD_LOGIC_VECTOR (2  DOWNTO  0);
			clk    : IN  STD_LOGIC
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
	
	SIGNAL WORD : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL C_in : STD_LOGIC_VECTOR(15 DOWNTO 0) := x"ABCD";
	SIGNAL Data_in : STD_LOGIC_VECTOR(15 DOWNTO 0) := x"1123";
	SIGNAL FU : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL MBO : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL AD : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL BD : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL DD : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL RN : STD_LOGIC:= NOT(R);
	
	BEGIN
		WORD(0) <= Not(RW);
		WORD(1) <= MD;
		WORD(5 DOWNTO 2) <= FS;
		WORD(6) <= MB;
		WORD(9 DOWNTO 7) <= BA;
		WORD(12 DOWNTO 10) <= AA;
		WORD(15 DOWNTO 13) <= DA;
		
		
		b2v_inst_practica4 : practica4
		PORT  MAP(
			clk      =>   clk,
			FS       =>   FS,
			A        =>   AD,
			B        =>   MBO,
			C_out    =>   C_out,
			N		   =>	  N,
			Z		   =>	  Z,	
			F        =>   FU
		);
		
		b2v_instac_mux_d : mux_2_to_1
		PORT  MAP(
			S=> MD,
			A=> FU,
			B=> Data_in,
			Y=>	DD
		);
		
		b2v_inst_registry_file : registry_file
		PORT  MAP(
			RW     => WORD(0),
			R      => RN,
			DD     => DD,
			AD     => AD,
			BD     => BD,
			AA     => WORD(12 DOWNTO 10),
			BA     => WORD(9 DOWNTO 7),
			DA     => WORD(15 DOWNTO 13),
			clk    => clk
		);
		
		b2v_instac_mux_b : mux_2_to_1
		PORT  MAP(
			S=> MB,
			A=> BD,
			B=> C_in,
			Y=>	MBO
		);
		
		b2v_inst_practica2 : practica2
		PORT  MAP(
			clk => clk ,
			dip_1 => MBO(15 DOWNTO 12),
			dip_2 => MBO(11 DOWNTO 8),
			dip_3 => MBO(7 DOWNTO 4),
			dip_4 => MBO(3 DOWNTO 0),
			led_1 => act_dis1,
			led_2 => act_dis2,
			led_3 => act_dis3,
			led_4 => act_dis4,
			--D => D,
			bcd_to_7 => display
		);
	
END  bdf_type;