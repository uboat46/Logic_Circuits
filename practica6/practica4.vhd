LIBRARY  IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY  work;

ENTITY  practica4  IS
	PORT(
		clk      :   IN    STD_LOGIC;
		FS       :   IN    STD_LOGIC_VECTOR (3  DOWNTO  0);
		A        :   IN    STD_LOGIC_VECTOR (15 DOWNTO 0);
		B        :   IN    STD_LOGIC_VECTOR (15 DOWNTO 0);
		C_out    :   OUT   STD_LOGIC;
		N		   :	 OUT   STD_LOGIC;
		Z		   :	 OUT   STD_LOGIC;
		F        :   OUT   STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END  practica4;

ARCHITECTURE bdf_type OF practica4 IS
	
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
	
	SIGNAL   GA :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   GL :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   GS :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   O :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	SIGNAL   FO :   STD_LOGIC_VECTOR (15  DOWNTO  0);
	BEGIN
	
	F <= FO;
	N <= FO(15);
		
	b2v_instac_a : arithmetic_circuit
		PORT  MAP(
			C_in => FS(0),
			A => A ,
			B => B ,
			S => FS(2  DOWNTO 1),
			C_out => C_out ,
			G => GA
		);
		
	b2v_instac_l : logic_circuit
		PORT  MAP(
			S   	 => FS(1 DOWNTO 0),
			A      => A,
			B      => B,
			G      => GL
		);
		
	b2v_instac_s : shifter_circuit
		PORT  MAP(
			S   	 => FS(1 DOWNTO 0),
			B      => B,
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
			Y=>	FO
		);
		
	b2v_instac_zero : zero_detect
		PORT  MAP(
			I=> FO,
			Z=>	Z
		);
		
END  bdf_type;