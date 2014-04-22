---------------------------------------------------
-- mips_fpga_interface.vhd
-- Test bench for MIPS processor
--------------------------------------------------

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity mips_fpga_interface is
 port(clk, rst_n: in  STD_LOGIC;
		led            : out STD_LOGIC_VECTOR(6 downto 0)
		);
end;

architecture test_fpga of mips_fpga_interface is
  
  component top
  port(clk, reset:         in     STD_LOGIC;
       writedata, dataadr: inout STD_LOGIC_VECTOR(31 downto 0);
       memwrite:           inout STD_LOGIC;
		 pc:                 inout STD_LOGIC_VECTOR(31 downto 0) );
  end component;
  
  signal mips_clk_input: STD_LOGIC;
  signal writedata, dataadr: STD_LOGIC_VECTOR(31 downto 0);
  signal reset, memwrite: STD_LOGIC;
  signal pc : STD_LOGIC_VECTOR(31 downto 0); 
  

begin

  -- logic for reseting the cpu to the start state
  reset <= not rst_n;

  -- Hardware for a very! slow clock, 0.5 sec low, 0.5 sec high
	p1: process (clk, reset)
		variable cnt: integer;
	begin
		if clk'event and clk='1' then
			cnt := cnt + 1;
			if reset = '1' then
			   -- reset state, start read
			   cnt := 0;
				mips_clk_input <= '0';
			elsif cnt < 12500000 then
			   mips_clk_input <= '0';
			elsif cnt < 25000000 then
			   mips_clk_input <= '1';				
			else
			   mips_clk_input <= '1';	
				cnt := 0;
			end if;
		end if;
	end process;

  -- instantiate the mips CPU
  mips_cpu: top port map( mips_clk_input, reset, writedata, dataadr, memwrite, pc);
  
  -- debug signals - this simply outputs the program counter address and the 
  -- signal for memory write.
  led(6) <= memwrite;
  led(5 downto 0) <= pc(5 downto 0);

end test_fpga;