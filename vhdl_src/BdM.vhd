----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:45 05/14/2019 
-- Design Name: 
-- Module Name:    BdM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BdM is
    Port ( adr : in  STD_LOGIC_VECTOR (7 downto 0);
           INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
end BdM;

architecture Behavioral of BdM is

	type MEMTYPE is array(0 to 127) of STD_LOGIC_VECTOR(7 downto 0);
	signal memoire : MEMTYPE := 
	(
		0 => x"01",
		1 => x"02",
		2 => x"10",
		3 => x"AB",
		others => x"00"
	);

begin

PROCESS

BEGIN

	wait until CLK'EVENT and CLK = '1';
	if RST = '1' then
		memoire <= ( others => ( others => '0'));
	else
		if RW = '1' then --Mode lecture
			memoire(to_integer(unsigned(adr))) <= INPUT;
		else --Mode ecriture
			OUTPUT <= memoire(to_integer(unsigned(adr)));
		end if;
	end if;

END PROCESS;

end Behavioral;

