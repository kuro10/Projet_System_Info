library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common.all;


entity instr_memory is
	generic(
		LEN_SEL: natural := 16;
		LEN_INSTR: natural := 32
	);
	port(
		sel: in std_logic_vector(LEN_SEL-1 downto 0);
		q: out std_logic_vector(LEN_INSTR-1 downto 0)
	);
end entity;


architecture beh of instr_memory is

--	signal instr_memory: instrArray := init_rom(filename => "<path_to_your_code>");

	signal instr_memory: instrArray := (
		0 => x"0600FF0A",
		1 => x"0601FF02", 
		2 => x"01020001", 
		3 => x"02030001",
		4 => x"03040001", 
		5 => x"05050001",
		6 => x"07060003",
		7 => x"08000000",
		others => x"FFFFFFFF"
	);

begin

	q <= instr_memory(to_integer(unsigned(sel)));

end architecture;

