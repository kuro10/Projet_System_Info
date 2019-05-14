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
		 

begin

	--Implementing AFC

end Behavioral;

