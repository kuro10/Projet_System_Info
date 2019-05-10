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
	type REGTYPE is array(15 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
	signal registre : REGTYPE := 
	( 0 => x"01", 1 => x"10", others => x"00");
	
	signal index : INTEGER;
	signal outA : STD_LOGIC_VECTOR (7 downto 0);
	signal outB : STD_LOGIC_VECTOR (7 downto 0);
	
	--Fonction d'init reg table
	function Reg(i:integer) return REGTYPE is
	file fd : text open READ_MODE is "Registre.txt";
	variable reg : REGTYPE;
	variable NLine : natural := 0;
	variable Info : STD_LOGIC_VECTOR (7 downto 0);
	variable Line : line;
	begin
		while not endfile(fd) loop
			readline(fd,Line); 
			if Line'length>0 and Line(1) /= '-' then 
				read(Line,NLine);
				read(Line,Info);
				reg(NLine) := Info;
				NLine := NLine + 1;
			end if;
		end loop;
		return reg;
	end Reg; 
	
	--signal registre : REGTYPE := Reg(0);
	
begin
	
PROCESS
		
BEGIN
		wait until CLK'EVENT and CLK = '1';
		if RST = '0' then 
			outA <= x"00";
			outB <= x"00";
		else
			if W = '1' then 
				if adrW = adrA then
					outA <= DATA;
				else
					if adrW = adrB then 
						outB <= DATA;
					else
						index <= to_integer(unsigned(adrW));
						registre(index) <= DATA;
					end if;
				end if;
			else
				index <= to_integer(unsigned(adrA));
				outA <= registre(index); 
				index <= to_integer(unsigned(adrB));
				outB <= registre(index); 
			end if;
		end if;
		QA <= outA;
		QB <= outB;
END PROCESS;
		

end Behavioral;

