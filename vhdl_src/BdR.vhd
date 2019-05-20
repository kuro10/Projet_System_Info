----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:19:53 05/10/2019 
-- Design Name: 
-- Module Name:    BdR - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BdR is
    Port ( adrA : in  STD_LOGIC_VECTOR (3 downto 0);
           adrB : in  STD_LOGIC_VECTOR (3 downto 0);
           adrW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end BdR;

architecture Behavioral of BdR is
	type REGTYPE is array(0 to 15) of STD_LOGIC_VECTOR (7 downto 0);
	signal registre : REGTYPE := 
	( 0 => x"CF", 1 => x"FC", others => x"00");
	
	signal index : INTEGER;
	signal outA : STD_LOGIC_VECTOR (7 downto 0);
	signal outB : STD_LOGIC_VECTOR (7 downto 0);
	
	
begin
	
	
	QA <= DATA when adrW = adrA and W = '1' else
			  registre(to_integer(unsigned(adrA)));
	
	QB <= DATA when adrW = adrB and W = '1' else
			  registre(to_integer(unsigned(adrB)));
	
PROCESS
		
BEGIN
		wait until CLK'EVENT and CLK = '1';
		if RST = '0' then 
			registre <= (others => ( others => '0'));
		else
			if W = '1' then 
				registre(to_integer(unsigned(adrW))) <= DATA; 
			end if;
		end if;
			
END PROCESS;
		

end Behavioral;

