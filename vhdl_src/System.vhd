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
use work.BdM.all;
use work.BdR.all;
use work.Pipeline.all;
use work.instr_memory.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity System is 
	Port ( instr : IN STD_LOGIC_VECTOR(31 downto 0) );
end System;

architecture Behavioral of System is

	Component instr_memory
		generic(
			LEN_SEL: natural := 16;
			LEN_INSTR: natural := 32
		);
		port(
			sel: in std_logic_vector(LEN_SEL-1 downto 0);
			q: out std_logic_vector(LEN_INSTR-1 downto 0)
		);
	end Component;

	Component Pipeline
		 Port ( inA : in  STD_LOGIC_VECTOR(15 downto 0);
				  inOP : in  STD_LOGIC_VECTOR(7 downto 0);
				  inB : in  STD_LOGIC_VECTOR(15 downto 0);
				  inC : in  STD_LOGIC_VECTOR(15 downto 0);
				  outA : out  STD_LOGIC_VECTOR(15 downto 0);
				  outOP : out  STD_LOGIC_VECTOR(7 downto 0);
				  outB : out  STD_LOGIC_VECTOR(15 downto 0);
				  outC : out  STD_LOGIC_VECTOR(15 downto 0));
	end Component;
	 

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

   --INPUT INSTR_MEMORY--
	signal sel : std_logic_vector(LEN_SEL-1 downto 0);
	--OUTPUT INSTR_MEMORY
	signal q : std_logic_vector(LEN_INSTR-1 downto 0);
	
	--PIPELINE--
	signal li, di, ex, mem, re : stage_record;
	
   --INPUT BdR--
   signal adrA : std_logic_vector(3 downto 0);
   signal adrB : std_logic_vector(3 downto 0);
   signal adrW : std_logic_vector(3 downto 0);
   signal W : std_logic;
   signal DATA :  std_logic_vector(7 downto 0);
   signal RST : std_logic;
   signal CLK :  std_logic;
	--OUTPUT BdR--
   signal QA : std_logic_vector(7 downto 0);
   signal QB :  std_logic_vector(7 downto 0);
	
	--INPUT ALU--
	signal A : std_logic_vector(7 downto 0);
   signal B : std_logic_vector(7 downto 0);
   signal Op : std_logic_vector(3 downto 0);
	--OUTPUT ALU--
	signal S : std_logic_vector(7 downto 0);
   signal Flag : std_logic_vector(3 downto 0);
	
begin

	--Implementing AFC
	uut: instr_memory PORT MAP (
		sel => sel,
		q => q
	);
	
	uut: LIDI PORT MAP (
          li.a => inA,
			 li.op => inOp,
			 li.b => inB,
			 li.c => inC,
			 di.a => outA,
			 di.op => outOp,
			 di.b => outB,
			 di.c => outC
       );
		 
	uut: DIEX PORT MAP (
          di.a => inA,
			 di.op => inOp,
			 di.b => inB,
			 di.c => inC,
			 ex.a => outA,
			 ex.op => outOp,
			 ex.b => outB,
			 ex.c => outC
       );

	uut: EXMem PORT MAP (
          ex.a => inA,
			 ex.op => inOp,
			 ex.b => inB,
			 ex.c => inC,
			 mem.a => outA,
			 mem.op => outOp,
			 mem.b => outB,
			 mem.c => outC
       );

	uut: MemRE PORT MAP (
          mem.a => inA,
			 mem.op => inOp,
			 mem.b => inB,
			 mem.c => inC,
			 re.a => outA,
			 re.op => outOp,
			 re.b => outB,
			 re.c => outC
       );


end Behavioral;


