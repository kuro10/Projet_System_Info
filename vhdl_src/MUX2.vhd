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

entity MUX2 is
    Port ( A_MUX2 : in  STD_LOGIC_VECTOR (15 downto 0);
           B_MUX2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Op_MUX2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Z_MUX2 : out  STD_LOGIC_VECTOR (15 downto 0));
end MUX2;

architecture Behavioral of MUX2 is

begin

	Z_MUX2 <= A_MUX2 when Op_MUX2 = x"08" or Op_MUX2 = x"07" or Op_MUX2 = x"06" else 
				B_MUX2 when Op_MUX2 = x"05" or Op_MUX2 = x"04" or Op_MUX2 = x"03" or Op_MUX2 = x"02" or Op_MUX2 = x"01";
	
end Behavioral;

