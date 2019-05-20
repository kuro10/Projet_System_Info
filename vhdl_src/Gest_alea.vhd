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
    Port ( in_LiOP : in  STD_LOGIC_VECTOR(7 downto 0);
           in_LiB : in  STD_LOGIC_VECTOR(15 downto 0);
           in_LiC : in  STD_LOGIC_VECTOR(15 downto 0);
           in_DiOP : in  STD_LOGIC_VECTOR(7 downto 0);
			  in_DiA : in  STD_LOGIC_VECTOR(15 downto 0);
           in_ExOP : in  STD_LOGIC_VECTOR(7 downto 0);
           in_ExA : in  STD_LOGIC_VECTOR(15 downto 0);
           in_memOP : in  STD_LOGIC_VECTOR(7 downto 0);
			  in_memA : in  STD_LOGIC_VECTOR(15 downto 0);
			  alea : out STD_LOGIC
			  );
end Gest_alea;

architecture Behavioral of Gest_alea is

signal res : STD_LOGIC := '0';

begin
	process
	begin
	
	--Case ADD, MUL, SUB--
	if in_LiOP = x"01" or in_LiOP = x"02" or in_LiOP = x"03" then
		--DIEX Level--
		if in_DiOP = x"01" or in_DiOP = x"02" or in_DiOP = x"03" or in_DiOP = x"05" or in_DiOP = x"06" or in_DiOP = x"07" then
			if in_DiA = in_LiB or in_DiA = in_LiC then
				res <= 1;
			end if;
		end if;
		--ExMem level--
		if in_ExOP = x"01" or in_ExOP = x"02" or in_ExOP = x"03" or in_ExOP = x"05" or in_ExOP = x"06" or in_ExOP = x"07" then
			if in_ExA = in_LiB or in_ExA = in_LiC then
				res <= 1;
			end if;
		end if;
		--MemRE Level--
		if in_memOP = x"01" or in_memOP = x"02" or in_memOP = x"03" or in_memOP = x"05" or in_memOP = x"06" or in_memOP = x"07" then
			if in_memA = in_LiB or in_memA = in_LiC then
				res <= 1;
			end if;
		end if;
	end if;
	
	--Case COP--
	if in_LiOP = x"05" then
		--DIEX Level--
		if in_DiOP = x"01" or in_DiOP = x"02" or in_DiOP = x"03" or in_DiOP = x"05" or in_DiOP = x"06" or in_DiOP = x"07" then
			if in_DiA = in_LiB then
				res <= 1;
			end if;
		end if;
		--ExMem level--
		if in_ExOP = x"01" or in_ExOP = x"02" or in_ExOP = x"03" or in_ExOP = x"05" or in_ExOP = x"06" or in_ExOP = x"07" then
			if in_ExA = in_LiB then
				res <= 1;
			end if;
		end if;
		--MemRE Level--
		if in_memOP = x"01" or in_memOP = x"02" or in_memOP = x"03" or in_memOP = x"05" or in_memOP = x"06" or in_memOP = x"07" then
			if in_memA = in_LiB then
				res <= 1;
			end if;
		end if;
	end if;
	
	--Case STORE--
	if in_LiOP = x"08" then
		--DIEX Level--
		if in_DiOP = x"01" or in_DiOP = x"02" or in_DiOP = x"03" or in_DiOP = x"05" or in_DiOP = x"06" or in_DiOP = x"07" then
			if in_DiA = in_LiC then
				res <= 1;
			end if;
		end if;
		--ExMem level--
		if in_ExOP = x"01" or in_ExOP = x"02" or in_ExOP = x"03" or in_ExOP = x"05" or in_ExOP = x"06" or in_ExOP = x"07" then
			if in_ExA = in_LiC then
				res <= 1;
			end if;
		end if;
		--MemRE Level--
		if in_memOP = x"01" or in_memOP = x"02" or in_memOP = x"03" or in_memOP = x"05" or in_memOP = x"06" or in_memOP = x"07" then
			if in_memA = in_LiC then
				res <= 1;
			end if;
		end if;
	end if;	
	
	end process;
	
	alea <= res;
	
end Behavioral;

