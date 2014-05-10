---------------------------------------------------
-- mips_fpga_interface.vhd
-- Test bench for MIPS processor
--------------------------------------------------

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;
use work.ps2_kbd_pckg.all;

entity mips_fpga_interface is
generic(
    FREQ     :     natural := 100_000   -- frequency of main clock (KHz)
    );
 port(clk, rst_n: in  STD_LOGIC;
		led            : out STD_LOGIC_VECTOR(6 downto 0);
		ps2_clk  : in  std_logic;           -- keyboard clock
		ps2_data : in  std_logic           -- keyboard data
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
  signal keyboard_clk              : std_logic;
  signal writedata, dataadr: STD_LOGIC_VECTOR(31 downto 0);
  signal reset, memwrite: STD_LOGIC;
  signal pc : STD_LOGIC_VECTOR(31 downto 0); 
  
  signal scancode  : std_logic_vector(7 downto 0);  -- scancode from keyboard
  signal rdy       : std_logic;         -- indicates when scancode is available
  signal input_value       : std_logic_vector(8 downto 0);  -- next state of LED segments
  signal kbd_error : std_logic;         -- error receiving scancode from keyboard
  
  constant YES : std_logic := '1';
  constant NO  : std_logic := '0';
  
begin


	u0 : ps2_kbd
    generic map(
      FREQ     => FREQ
      )
    port map(
      clk   => keyboard_clk,                  -- clock for the keyboard interface
      rst      => kbd_error,            -- reset the keyboard intfc whenever there is an error receiving a scancode
      ps2_clk  => ps2_clk,              -- clock from the keyboard
      ps2_data => ps2_data,             -- serial data from the keyboard (valid on falling edge of ps2_clk)
      scancode => scancode,             -- the scancode received from the keyboard
      rdy      => rdy,                  -- indicates when a scancode from the keyboard is available
      error    => kbd_error             -- indicates an error in receiving a scancode from the keyboard
      );

  -- this maps the scancode received from the keyboard into a pattern on the 7-segment display
 input_value <= "000000001" when scancode = "00010110" else
         "000000010" when scancode = "00011110" else
         "000000011" when scancode = "00100110" else
         "000000100" when scancode = "00100101" else
         "000000101" when scancode = "00101110" else
         "000000110" when scancode = "00110110" else
         "000000111" when scancode = "00111101" else
         "000001000" when scancode = "00111110" else
         "000001001" when scancode = "01000110" else
			"000000000";
			
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
	
	-- generate a 25Mhz clock
p2: process (clk)
begin
  if clk'event and clk='1' then
    keyboard_clk <= not keyboard_clk;
  end if;
end process;

-- change color based off input
p3: process(keyboard_clk)
  begin
    if rising_edge(keyboard_clk) then
      if rdy = YES then
        led <= input_value(6 downto 0);                       -- update the display each time a scancode is received
      end if;
    end if;
end process;

  -- instantiate the mips CPU
  mips_cpu: top port map( mips_clk_input, reset, writedata, dataadr, memwrite, pc);
  
  -- debug signals - this simply outputs the program counter address and the 
  -- signal for memory write.
  --led(6) <= memwrite;
  --led(5 downto 0) <= pc(5 downto 0);

end test_fpga;