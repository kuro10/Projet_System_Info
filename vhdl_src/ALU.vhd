----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:43:00 04/18/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Flag : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is
	signal Sadd :  STD_LOGIC_VECTOR (8 downto 0);
	signal Ssou :  STD_LOGIC_VECTOR (8 downto 0);
	signal Smul :  STD_LOGIC_VECTOR (15 downto 0);
	signal Sdiv :  STD_LOGIC_VECTOR (8 downto 0);
	signal Stmp :  STD_LOGIC_VECTOR (8 downto 0);
	signal C 	: 	STD_LOGIC;   	--Carry out
	signal N 	: 	STD_LOGIC;		--Negative
	signal Z 	: 	STD_LOGIC;		--Zero
	signal V 	: 	STD_LOGIC;		--Overflow
begin
 
	Sadd 	<= 	('0'&A) + ('0'&B);
	Ssou 	<= 	('0'&A) - ('0'&B);
	Smul 	<= 	A * B; 
	--Sdiv 	<= 	A / B; --('0' & A) / ('0' & B);
	
	Stmp 	<= 	Sadd when Op=x"1" else
					Smul(8 downto 0) when Op=x"2" else	
					Ssou when Op=x"3" else
					(others => '0');
					--Sdiv when Op=x"04" ;
					
	S 		<= 	Stmp(7 downto 0);
	C 		<= 	Stmp(8);
	N 		<= 	Stmp(7);
	Z 		<=		'1' when Stmp=x"00" else '0';
	V 		<= 	'1' when ((Stmp(7)='1' and A(7)='0' and B(7)='0') or (Stmp(7)='0' and A(7)='1' and B(7)='1'))  
					else '0';
	
	Flag <= 		V & Z & N & C;

		
end Behavioral;


