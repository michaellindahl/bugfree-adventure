--------------------------------------------------
-- mipstest.vhd
-- Sarah_Harris@hmc.edu 27 May 2007
-- Test bench for MIPS processor
--------------------------------------------------


library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;
entity testbench is
end;

architecture test_simulation of testbench is
  component top
  port(clk, reset:         in     STD_LOGIC;
       writedata, dataadr: inout STD_LOGIC_VECTOR(31 downto 0);
       memwrite:           inout STD_LOGIC;
		 pc:                 inout STD_LOGIC_VECTOR(31 downto 0) );
  end component;
  signal writedata, dataadr, pc: STD_LOGIC_VECTOR(31 downto 0);
  signal clk, reset, memwrite: STD_LOGIC;
begin

  -- instantiate device to be tested
  dut: top port map(clk, reset, writedata, dataadr, memwrite, pc);

  -- Generate clock with 10 ns period
  process begin
    clk <= '1';
    wait for 5 ns; 
    clk <= '0';
    wait for 5 ns;
  end process;

  -- Generate reset for first two clock cycles
  process begin
    reset <= '1';
    wait for 22 ns;
    reset <= '0';
    wait;
  end process;

  -- check that 7 gets written to address 84 at end of program
  process (clk) begin
    if (clk'event and clk = '0' and memwrite = '1') then
      if ( to_integer(unsigned(dataadr)) = 84 and to_integer(unsigned(writedata)) = 7) then 
        report "Simulation succeeded";
	  elsif (dataadr /= 80) then 
        report "Simulation failed";
      end if;
    end if;
  end process;
  
end test_simulation;