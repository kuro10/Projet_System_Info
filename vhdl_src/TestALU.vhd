--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:13:28 04/18/2019
-- Design Name:   
-- Module Name:   /home/th_tran/4IR Projet SysInfo/Projet_System_Info/PartieVHDL/TestALU.vhd
-- Project Name:  PartieVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestALU IS
END TestALU;
 
ARCHITECTURE behavior OF TestALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Flag : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal Flag : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          S => S,
          Op => Op,
          Flag => Flag
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin

   --end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		A <= x"04";
		B <= x"02";
		Op <= x"1"; 
		wait for 100 ns;

		for i in 0 to 3 loop 
			Op <= Op + x"1";
			wait for 100 ns;
		end loop;

      wait;
   end process;

END;
