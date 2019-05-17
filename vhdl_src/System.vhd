----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:42 05/14/2019 
-- Design Name: 
-- Module Name:    System - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use work.BdM.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity System is 
	Port ( 
	CLK : in STD_LOGIC;
	sel : IN STD_LOGIC_VECTOR(15 downto 0) );
end System;

architecture Structural of System is

	COMPONENT instr_memory
		generic(
			LEN_SEL: natural := 16;
			LEN_INSTR: natural := 32
		);
		port(
			sel: in std_logic_vector(LEN_SEL-1 downto 0);
			q: out std_logic_vector(LEN_INSTR-1 downto 0)
		);
	end COMPONENT;

	COMPONENT Decodeur
		Port ( Input : in STD_LOGIC_VECTOR (31 downto 0);
				 outA_DEC : out STD_LOGIC_VECTOR (15 downto 0);
				 outOP_DEC : out STD_LOGIC_VECTOR (7 downto 0);
				 outB_DEC : out STD_LOGIC_VECTOR (15 downto 0);
				 outC_DEC : out STD_LOGIC_VECTOR (15 downto 0)
		);
	end COMPONENT;

	COMPONENT Pipeline
		 Port ( inA : in  STD_LOGIC_VECTOR(15 downto 0);
				  inOP : in  STD_LOGIC_VECTOR(7 downto 0);
				  inB : in  STD_LOGIC_VECTOR(15 downto 0);
				  inC : in  STD_LOGIC_VECTOR(15 downto 0);
				  outA : out  STD_LOGIC_VECTOR(15 downto 0);
				  outOP : out  STD_LOGIC_VECTOR(7 downto 0);
				  outB : out  STD_LOGIC_VECTOR(15 downto 0);
				  outC : out  STD_LOGIC_VECTOR(15 downto 0));
	end COMPONENT;
	 

   COMPONENT BdM
    PORT(
         adr : IN  std_logic_vector(7 downto 0);
         INPUT : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         OUTPUT : OUT  std_logic_vector(7 downto 0)
        );
   END COMPONENT;
	
	COMPONENT Multiplexeur
	  Port ( A_MUX : in  STD_LOGIC_VECTOR (15 downto 0);
           B_MUX : in  STD_LOGIC_VECTOR (15 downto 0);
           Op_MUX : in  STD_LOGIC_VECTOR (7 downto 0);
           Z_MUX : out  STD_LOGIC_VECTOR (15 downto 0));
	end COMPONENT;
	 
   COMPONENT BdR
    PORT(
         adrA : IN  std_logic_vector(3 downto 0);
         adrB : IN  std_logic_vector(3 downto 0);
         adrW : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
   END COMPONENT; 	 
		 
   COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Flag : OUT  std_logic_vector(3 downto 0)
        );
   END COMPONENT;
	
	type stage_record is record 
		op : std_logic_vector(7 downto 0);
		a, b, c : std_logic_vector(15 downto 0);
	end record stage_record;
	
	COMPONENT LC
	 PORT (
			in_LC : in STD_LOGIC_VECTOR(7 downto 0);
			out_LC : out STD_LOGIC_VECTOR(4 downto 0)
			);
	END COMPONENT;

	--OUTPUT INSTR_MEMORY
	signal q : std_logic_vector(31 downto 0);	
	
	--PIPELINE--
	signal li, di, ex, mem, re : stage_record;
	
	--INPUT MUX DI--
	signal A_muxDI : STD_LOGIC_VECTOR(15 downto 0);
	signal B_muxDI : STD_LOGIC_VECTOR(15 downto 0);
	

	
   --INPUT BdR--
	signal auxB : STD_LOGIC_VECTOR(15 downto 0);
   
   signal DATA :  std_logic_vector(7 downto 0);
   signal RST : std_logic;
	--OUTPUT BdR--
   signal QA : std_logic_vector(7 downto 0);
   signal QB :  std_logic_vector(7 downto 0);
	
	--INPUT MUX EX-
	signal A_muxEX : STD_LOGIC_VECTOR(15 downto 0);
	signal B_muxEX : STD_LOGIC_VECTOR(15 downto 0);
	
	
	--INPUT ALU--
	signal A : std_logic_vector(15 downto 0);
   signal B : std_logic_vector(15 downto 0);
   signal Op : std_logic_vector(3 downto 0);
	--OUTPUT ALU--
	signal S : std_logic_vector(7 downto 0);
   signal Flag : std_logic_vector(3 downto 0);
	
	--output LC
	signal outLC : std_logic_vector(4 downto 0);
begin
	

	--Implementing AFC
	IP: instr_memory PORT MAP (
		sel => sel,
		q => q
	);
	
	Dec: decodeur PORT MAP (
		Input => q,
		outA_DEC => li.A,
		outOP_DEC => li.Op,
		outB_DEC => li.B,
		outC_DEC => li.C
	);
	
	LIDI: Pipeline PORT MAP (
          inA => li.A,
			 inOp => li.Op,
			 inB => li.B,
			 inC => li.C,
			 outA => di.A,
			 outOp => di.Op,
			 outB => A_muxDI,
			 outC => auxB
       );
		 
	BR: bdr PORT MAP (
			adrA => A_muxDI(3 downto 0),
         adrB => auxB(3 downto 0),
         --adrW => adrW,
         adrW => re.A(3 downto 0),
			W => outLC(4),
         DATA => re.B(7 downto 0), 
         RST => RST,
         CLK => CLK,
         QA => QA, 
         QB => QB
		);
	
	MUX_DI: Multiplexeur PORT MAP (
			A_MUX => A_muxDI,
         B_MUX => x"00" & QA,
         Op_MUX => di.Op,
         Z_MUX => di.B
	);
		 
	DIEX: Pipeline PORT MAP (
          inA => di.A,
			 inOp => di.Op,
			 inB => di.B,
			 inC => x"00" & QB,
			 outA => ex.A,
			 outOp => ex.Op,
			 outB => A,
			 outC => B
       );
		 
	LC_EX: LC PORT MAP (
			in_LC => ex.Op,
			out_LC => outLC
		);
		
	MUX_EX: Multiplexeur PORT MAP (
		A_MUX => A,
		B_MUX => x"00" & S,
		Op_MUX => ex.Op,
		Z_MUX => ex.B
	);

	UAL: ALU PORT MAP (
	      A => A(7 downto 0),
         B => B(7 downto 0),
         S => S,
         Op => outLC(3 downto 0),
         Flag => Flag
	);
			

	EXMem: Pipeline PORT MAP (
          inA => ex.A,
			 inOp => ex.Op,
			 inB => ex.B,
			 inC => ex.C,
			 outA => mem.A,
			 outOp => mem.Op,
			 outB => mem.B,
			 outC => mem.C
       );

	MemRE: Pipeline PORT MAP (
          inA => mem.A,
			 inOp => mem.Op,
			 inB => mem.B,
			 inC => mem.C,
			 outA => re.A,
			 outOp => re.Op,
			 outB => re.B,
			 outC => re.C
       );
		 
	LC_RE : LC PORT MAP (
			 in_LC => re.Op,
			 out_LC => outLC
		 );

	

end Structural;


