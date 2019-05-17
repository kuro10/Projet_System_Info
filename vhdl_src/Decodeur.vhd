----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:35 05/17/2019 
-- Design Name: 
-- Module Name:    Decodeur - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decodeur is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           outA_DEC : out  STD_LOGIC_VECTOR (15 downto 0);
           outOP_DEC : out  STD_LOGIC_VECTOR (7 downto 0);
           outB_DEC : out  STD_LOGIC_VECTOR (15 downto 0);
           outC_DEC : out  STD_LOGIC_VECTOR (15 downto 0));
end Decodeur;

architecture Behavioral of Decodeur is

	signal tmpA : STD_LOGIC_VECTOR(15 downto 0);
	signal tmpB : STD_LOGIC_VECTOR(15 downto 0);
	signal tmpC : STD_LOGIC_VECTOR(15 downto 0);
	signal tmpOP : STD_LOGIC_VECTOR(7 downto 0);
	begin
		
	
		tmpA <= x"00" & Input(23 downto 16);
		tmpOP <= Input(31 downto 24);
		tmpB <= Input(15 downto 0) when tmpOP = x"06" else
				  x"00" & Input(15 downto 8);
		tmpC <= x"00" when tmpOP = x"06" else
				  x"00" & Input(7 downto 0);
		 
		 outOP_DEC <= tmpOP;
		 outA_DEC <= tmpA;
		 outB_DEC <= tmpB;
		 outC_DEC <= tmpC;


end Behavioral;


    	
