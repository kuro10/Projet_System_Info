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

entity MUX3 is
    Port ( A_MUX3 : in  STD_LOGIC_VECTOR (15 downto 0);
           B_MUX3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Op_MUX3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Z_MUX3 : out  STD_LOGIC_VECTOR (15 downto 0));
end MUX3;

architecture Behavioral of MUX3 is

begin

	Z_MUX3 <= A_MUX3 when Op_MUX3 = x"08" else 
				B_MUX3 when Op_MUX3 = x"07" or Op_MUX3 = x"06" or Op_MUX3 = x"05" or Op_MUX3 = x"04" or Op_MUX3 = x"03" or Op_MUX3 = x"02" or Op_MUX3 = x"01";
	
end Behavioral;

