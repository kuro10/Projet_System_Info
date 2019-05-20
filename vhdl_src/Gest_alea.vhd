----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:56 05/14/2019 
-- Design Name: 
-- Module Name:    Pipeline - Behavioral 
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

entity Gest_alea is
    Port ( inA : in  STD_LOGIC_VECTOR(15 downto 0);
           inOP : in  STD_LOGIC_VECTOR(7 downto 0);
           inB : in  STD_LOGIC_VECTOR(15 downto 0);
           inC : in  STD_LOGIC_VECTOR(15 downto 0);
           outA : out  STD_LOGIC_VECTOR(15 downto 0);
           outOP : out  STD_LOGIC_VECTOR(7 downto 0);
           outB : out  STD_LOGIC_VECTOR(15 downto 0);
           outC : out  STD_LOGIC_VECTOR(15 downto 0));
end Gest_alea;

architecture Behavioral of Gest_alea is

begin

	outA <= inA;
	outOP <= inOP;
	outB <= inB;
	outC <= inC;

end Behavioral;

