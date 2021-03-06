----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:26 05/17/2019 
-- Design Name: 
-- Module Name:    LC - Behavioral 
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

entity LC is
    Port ( CLK : in STD_LOGIC;
			  in_LC : in  STD_LOGIC_VECTOR (7 downto 0);
           out_LC : out  STD_LOGIC_VECTOR(5 downto 0));
end LC;

architecture Behavioral of LC is

begin
	--process
	--begin
	--	wait until CLK'EVENT and CLK='1'
	--	if in_LC = x"07" or in_LC = x"06" or in_LC = x"05" or in_LC = x"01" or in_LC = x"02" or in_LC = x"03" or in_LC = x"04" then
	--		out_LC <= ("11"& in_LC(3 downto 0));
	--	else
	--		if in_LC = x"08" then
	--			out_LC <= ("00"& in_LC(3 downto 0));
	--		else
	--			out_LC <= ("00" & x"0");
	--		end if;
	--	end if;
	--end process;

	out_LC <= ("11"& in_LC(3 downto 0)) when in_LC = x"07" or in_LC = x"06" or in_LC = x"05" or in_LC = x"01" or in_LC = x"02" or in_LC = x"03" or in_LC = x"04" else
				 ("00"& in_LC(3 downto 0)) when in_LC = x"08" else ("00" & x"0");

end Behavioral;

