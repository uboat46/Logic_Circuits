LIBRARY  IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY  work;

ENTITY  practica_final  IS
	PORT(
		clk      :   IN    STD_LOGIC;
		BTN_W    :   IN    STD_LOGIC;
		BTN_R    :   IN    STD_LOGIC;
		DIPA     :   IN    STD_LOGIC_VECTOR (7  DOWNTO  0);
		DIPB     :   IN    STD_LOGIC_VECTOR (7  DOWNTO  0);
		DIPT     :   IN    STD_LOGIC_VECTOR (2  DOWNTO 0);
	);
END  practica_final;

ARCHITECTURE bdf_type OF practica_final IS
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
	
	
	COMPONENT branch_control
		port(
			PL: in  std_logic;
			JB: in  std_logic;
			BC: in  std_logic;
			N : in  std_logic;
			Z : in  std_logic;
			OP: out std_logic_vector(1 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT program_counter
		port(
			IR      : IN STD_LOGIC_VECTOR (15  DOWNTO  0);
			AD      : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			OP      : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			ADO     : OUT  STD_LOGIC_VECTOR (15  DOWNTO  0);
			R       : IN  STD_LOGIC;
			clk     : IN  STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT instruction_memory
		port(
			CLK, RESET: in std_logic;
			IE : in std_logic_vector(15 downto 0);
			I : out std_logic_Vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instruction_decoder
		port(
			OPCODE: IN std_logic_vector(6 DOWNTO 0);
			DR:     IN std_logic_vector(2 DOWNTO 0);
			SA:     IN std_logic_vector(2 DOWNTO 0);
			SB:     IN std_logic_vector(2 DOWNTO 0);
			DA:     OUT std_logic_vector(2 DOWNTO 0);
			AA:     OUT std_logic_vector(2 DOWNTO 0);
			BA:     OUT std_logic_vector(2 DOWNTO 0);
			MB:     OUT std_logic;
			FS:     OUT std_logic_vector(3 DOWNTO 0);
			MD:     OUT std_logic;
			RW:     OUT std_logic;
			MW:     OUT std_logic;
			PL:     OUT std_logic;
			JB:     OUT std_logic;
			BC:     OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT extend
		port(
			IR: in std_logic_vector(5 DOWNTO 0);
			EX: out std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT zero_fill
		port(
			IR: in std_logic_vector(2 DOWNTO 0);
			ZF: out std_logic_vector(15 DOWNTO 0)
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
			DIPA   : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
			DIPO   : OUT  STD_LOGIC_VECTOR (15 DOWNTO 0);
			clk    : IN  STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT mux_2_to_1
		port(
			S: in  std_logic;
			A: in std_logic_vector (15 DOWNTO 0);
			B: in std_logic_vector (15 DOWNTO 0);
			Y:	out std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT practica4
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
	
	COMPONENT ram
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
	END COMPONENT;
		
		
		
	SIGNAL BTW : STD_LOGIC:= NOT(BTN_W);
	SIGNAL BTR : STD_LOGIC:= NOT(BTN_R);
	
	
	SIGNAL OPO : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL DAO : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL AAO : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL BAO : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL FSO : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL IRO : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL ADO : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL ADOO: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL IO  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL ZFO : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL MUXDO : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL MBO : STD_LOGIC;
	SIGNAL MDO : STD_LOGIC;
	SIGNAL RWO : STD_LOGIC;
	SIGNAL MWO : STD_LOGIC;
	SIGNAL PLO : STD_LOGIC;
	SIGNAL JBO : STD_LOGIC;
	SIGNAL BCO : STD_LOGIC;
	SIGNAL NO : STD_LOGIC;
	SIGNAL ZO : STD_LOGIC;
	--SIGNAL DO : STD_LOGIC_VECTOR(15 DOWNTO 0);
	--SIGNAL AD : STD_LOGIC_VECTOR(15 DOWNTO 0);
	--SIGNAL DI : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	BEGIN
		
		b2v_inst_instruction_decoder : instruction_decoder
			PORT  MAP(
				OPCODE => IO(15 DOWNTO 9),
				DR     => IO(8 DOWNTO 6),
				SA     => IO(5 DOWNTO 3),
				SB     => IO(2 DOWNTO 0),
				DA     => DAO,
				AA     => AAO,
				BA     => BAO,
				MB     => MBO,
				FS     => FSO,
				MD     => MDO,
				RW     => RWO,
				MW     => MWO,
				PL     => PLO,
				JB     => JBO,
				BC     => BCO
			);
			
			b2v_inst_branch_control : branch_control
			PORT  MAP(
				PL => PLO,
				JB => JBO,
				BC => BCO,
				N  => NO,
				Z  => ZO,
				OP => OPO
			);
			
			b2v_inst_program_counter : program_counter
			PORT  MAP(
				IR      => IRO,
				AD      => ADO,
				OP      => OPO,
				ADO     => ADOO,
				R       => BTR,
				clk     => clk
			);
			
			b2v_inst_instruction_memory : instruction_memory
			PORT  MAP(
				CLK   => clk, 
				RESET => BTR, 
				IE    => ADOO,
				I     => IO
			);
			
			b2v_inst_zero_fill : zero_fill
			PORT  MAP(
				IR => IO(2 DOWNTO 0),
				ZF => ZF0
			);
			
			b2v_inst_extend : extend
			PORT  MAP(
				IR => IO(8 DOWNTO 6) & IO(2 DOWNTO 0),
				EX => IRO
			);
			
			b2v_inst_registry_file : registry_file
			PORT  MAP(
				RW     => RWO,
				R      => BTR,
				DD     => MUXDO,
				AD     => XXXXXXXXX,
				BD     => XXXXXXXXX,
				AA     => AAO,
				BA     => BAO,
				DA     => DAO,
				DIPA   => DIPA,
				DIPO   : OUT  STD_LOGIC_VECTOR (15 DOWNTO 0);
				clk    : IN  STD_LOGIC
			);
	
	
	
	
	
	
		b2v_inst_ram : ram
			PORT  MAP(
				RESET   => BTR,
				MW      => xxxx,
				BTN_W   : IN ,
				ADDRESS : IN STD_LOGIC_VECTOR (15 DOWNTO 0),
				DIPA    : IN STD_LOGIC_VECTOR (7 DOWNTO 0),
				DIPB    : IN STD_LOGIC_VECTOR (7 DOWNTO 0),
				DATA_IN : IN STD_LOGIC_VECTOR (15 DOWNTO 0),
				DATA_OUT: OUT STD_LOGIC_VECTOR (15 DOWNTO 0),
				clk     : IN  STD_LOGIC
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
		
		
END  bdf_type;