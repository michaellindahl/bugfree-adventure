---------------------------------------------------
-- mips_fpga_interface.vhd
-- Test bench for MIPS processor
--------------------------------------------------

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.all;
use work.ps2_kbd_pckg.all;
use work.vga_gen_pckg.all;

entity mips_fpga_interface is
generic(
    FREQ     :     natural := 100_000   -- frequency of main clock (KHz)
    );
 port(clk, rst_n: in  STD_LOGIC;
		clk50_in : in std_logic;
		led            : out STD_LOGIC_VECTOR(6 downto 0);
		ps2_clk  : in  std_logic;           -- keyboard clock
		ps2_data : in  std_logic;           -- keyboard data
		red_out : out std_logic_vector(2 downto 0);
		green_out : out std_logic_vector(2 downto 0);
		blue_out: out std_logic_vector(2 downto 0);
		hs_out : out std_logic;
		vs_out  : out std_logic
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
  
  signal clk25              : std_logic;
  signal hcounter : integer range 0 to 800;
  signal vcounter   : integer range 0 to 521;
  signal color: std_logic_vector(2 downto 0);
  
  constant YES : std_logic := '1';
  constant NO  : std_logic := '0';
  
begin


	u0 : ps2_kbd
    generic map(
      FREQ     => FREQ
      )
    port map(
      clk   => keyboard_clk,            -- clock for the keyboard interface
      rst      => kbd_error,            -- reset the keyboard intfc whenever there is an error receiving a scancode
      ps2_clk  => ps2_clk,              -- clock from the keyboard
      ps2_data => ps2_data,             -- serial data from the keyboard (valid on falling edge of ps2_clk)
      scancode => scancode,             -- the scancode received from the keyboard
      rdy      => rdy,                  -- indicates when a scancode from the keyboard is available
      error    => kbd_error            -- indicates an error in receiving a scancode from the keyboard
      );
	
--	u1: vga_gen
--	generic map(
--      FREQ     => FREQ
--      )
--		port map (
--			clk50_in => clk50_in,
--			red_out => red_out,
--			green_out => green_out,
--			blue_out => blue_out,
--			hs_out => hs_out,
--			vs_out => vs_out
--		);

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

p6: process (clk50_in)
begin
  if clk50_in'event and clk50_in='1' then
    clk25 <= not clk25;
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

p4: process (clk25)
	variable cnt: integer;
begin
	if clk25'event and clk25='1' then
		cnt := cnt + 1;
		if cnt = 25000000 then
			color <= color + "001";
			cnt := 0;
		end if;
	end if;
end process;

p5: process (clk25, hcounter, vcounter)
	variable x: integer range 0 to 639;
	variable y: integer range 0 to 479;
begin
	-- hcounter counts from 0 to 799
	-- vcounter counts from 0 to 520
	-- x coordinate: 0 - 639 (x = hcounter - 144, i.e., hcounter -Tpw-Tbp)
	-- y coordinate: 0 - 479 (y = vcounter - 31, i.e., vcounter-Tpw-Tbp)
	x := hcounter - 144;
	y := vcounter - 31;
  	if clk25'event and clk25 = '1' then
 		-- To draw a pixel in (x0, y0), simply test if the ray trace to it
		-- and set its color to any value between 1 to 7. The following example simply sets 
		-- the whole display area to a single-color wash, which is changed every one 
		-- second. 	
	 	if ( (( x > 50) and (x < 200)) and ((y > 200) and (y < 300)) ) then
      	red_out <= color;
      	green_out <= color; 
      	blue_out <= "000";
    	else
			-- if not traced, set it to "black" color
      	red_out <= "000";
      	green_out <= "000";
      	blue_out <= "000";
    	end if;
		-- Here is the timing for horizontal synchronization.
		-- (Refer to p. 24, Xilinx, Spartan-3 Starter Kit Board User Guide)
	 	-- Pulse width: Tpw = 96 cycles @ 25 MHz
	 	-- Back porch: Tbp = 48 cycles
		-- Display time: Tdisp = 640 cycles
	 	-- Front porch: Tfp = 16 cycles
		-- Sync pulse time (total cycles) Ts = 800 cycles

    	if hcounter > 0 and hcounter < 97 then
      	hs_out <= '0';
    	else
      	hs_out <= '1';
    	end if;
		-- Here is the timing for vertical synchronization.
		-- (Refer to p. 24, Xilinx, Spartan-3 Starter Kit Board User Guide)
	 	-- Pulse width: Tpw = 1600 cycles (2 lines) @ 25 MHz
	 	-- Back porch: Tbp = 23200 cycles (29 lines)
		-- Display time: Tdisp = 38400 cycles (480 lines)
	 	-- Front porch: Tfp = 8000 cycles (10 lines)
		-- Sync pulse time (total cycles) Ts = 416800 cycles (521 lines)
    	if vcounter > 0 and vcounter < 3 then
      	vs_out <= '0';
    	else
      	vs_out <= '1';
    	end if;
	 	-- horizontal counts from 0 to 799
    	hcounter <= hcounter+1;
    	if hcounter = 800 then
      	vcounter <= vcounter+1;
      	hcounter <= 0;
    	end if;
	 	-- vertical counts from 0 to 519
    	if vcounter = 521 then		    
      	vcounter <= 0;
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