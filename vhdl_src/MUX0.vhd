----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:39 05/17/2019 
-- Design Name: 
-- Module Name:    Multiplexeur - Behavioral 
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

entity MUX0 is
    Port ( CLK : in STD_LOGIC;
			  q_MUX0 : in  STD_LOGIC_VECTOR (31 downto 0);
           alea_MUX0 : in  STD_LOGIC;
           out_MUX0 : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX0;

architecture Behavioral of MUX0 is

begin
	--process(CLK)
	--begin
	--	if alea_MUX0 = '0' then
	--		out_MUX0 <= q_MUX0;
	--	else
	--		out_MUX0 <= q_MUX0;--x"00000000";
		out_MUX0 <= q_MUX0 when alea_MUX0 = '0' else q_MUX0;--x"00000000";
	--	end if;
	--end process;
end Behavioral;

