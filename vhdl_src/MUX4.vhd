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

entity MUX4 is
    Port ( A_MUX4 : in  STD_LOGIC_VECTOR (15 downto 0);
           B_MUX4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Op_MUX4 : in  STD_LOGIC_VECTOR (7 downto 0);
           Z_MUX4 : out  STD_LOGIC_VECTOR (15 downto 0));
end MUX4;

architecture Behavioral of MUX4 is

begin

	Z_MUX4 <= A_MUX4 when Op_MUX4 = x"08" or Op_MUX4 = x"07" else 
				B_MUX4 when Op_MUX4 = x"06" or Op_MUX4 = x"05" or Op_MUX4 = x"04" or Op_MUX4 = x"03" or Op_MUX4 = x"02" or Op_MUX4 = x"01";
	
end Behavioral;

