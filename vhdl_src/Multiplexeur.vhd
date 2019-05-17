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

entity Multiplexeur is
    Port ( A_MUX : in  STD_LOGIC_VECTOR (15 downto 0);
           B_MUX : in  STD_LOGIC_VECTOR (15 downto 0);
           Op_MUX : in  STD_LOGIC_VECTOR (7 downto 0);
           Z_MUX : out  STD_LOGIC_VECTOR (15 downto 0));
end Multiplexeur;

architecture Behavioral of Multiplexeur is

begin

	Z_MUX <= A_MUX when Op_MUX = x"06" else 
				B_MUX when Op_MUX = x"05" or Op_MUX = x"04" or Op_MUX = x"03" or Op_MUX = x"02" or Op_MUX = x"01" else
				A_MUX;
	
end Behavioral;

