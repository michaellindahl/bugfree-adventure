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
--use work.vga_gen_pckg.all;
use work.font_rom_pckg.all;
use work.char_mem_pckg.all;

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
       io_fib_num: 			in STD_LOGIC_VECTOR(31 downto 0);
       io_fib_result: 		out STD_LOGIC_VECTOR(31 downto 0);
		 io_fib_result_2: out STD_LOGIC_VECTOR(31 downto 0);
       memwrite:           inout STD_LOGIC;
		 pc:                 inout STD_LOGIC_VECTOR(31 downto 0) );
  end component;
  
  signal io_fib_num: 	 STD_LOGIC_VECTOR(31 downto 0);
  signal io_fib_result: 	 STD_LOGIC_VECTOR(31 downto 0);
  signal io_fib_result_2:  STD_LOGIC_VECTOR(31 downto 0);
  
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
  signal hpcounter : integer range 0 to 8 := 8;
  signal vpcounter : integer range 0 to 17;
  signal color: std_logic_vector(2 downto 0);
  
  constant YES : std_logic := '1';
  constant NO  : std_logic := '0';
  
    -- signals for font ROM
  signal ascii_line   : std_logic_vector(10 downto 0);
  signal ascii_pixels : std_logic_vector(7 downto 0);
  signal white_out 	 : std_logic;
  
  signal char_read_addr    : std_logic_vector(11 downto 0);
  signal char_write_addr   : std_logic_vector(11 downto 0);
  signal char_enable_write : std_logic;
  signal char_write_value  : std_logic_vector(7 downto 0);
  signal char_read_value   : std_logic_vector(7 downto 0);
  
  signal number : std_logic_vector(11 downto 0);
  signal column : std_logic_vector(11 downto 0);
  signal row : std_logic_vector(11 downto 0);
  signal xsignal : std_logic_vector(11 downto 0);
  signal ysignal : std_logic_vector(11 downto 0);
  
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


	u1 : font_rom
   port map(
      clk		=> clk,
      addr		=> ascii_line, -- x200 - x200f for 0
      data     => ascii_pixels
   );
	
	u2 : char_mem
    port map(
      clk					=> clk,
      char_read_addr    => char_read_addr,
      char_write_addr   => char_write_addr,
      char_we           => char_enable_write,
      char_write_value  => char_write_value,
      char_read_value   => char_read_value
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
			elsif cnt < 125 then
			   mips_clk_input <= '0';
			elsif cnt < 250 then
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
        led <= io_fib_num(6 downto 0);                       -- update the display each time a scancode is received
		  io_fib_num <= "00000000000000000000000" & input_value; 
		end if;
    end if;
end process;

p4: process (clk)
	variable cnt: integer;
begin
	if clk'event and clk='1' then				
		if cnt = 1 then
			char_enable_write <= YES;
			char_write_value <= input_value + x"30";
			char_write_addr <= X"0A4"; -- first line input
		end if;
		if cnt = 2 then
			char_enable_write <= YES;
			char_write_value <= io_fib_num + x"30";
			char_write_addr <= X"185"; -- second line input
		end if;
		if cnt = 3 then
			char_enable_write <= YES;
			char_write_value <= io_fib_result_2 + x"30";
			char_write_addr <= X"198"; -- output on second line
		end if;
		if cnt = 4 then
			char_enable_write <= YES;
			char_write_value <= io_fib_result + x"30";
			char_write_addr <= X"197"; -- output on second line
		end if;
		cnt := cnt + 1;		
		if cnt = 5 then
			cnt := 0;
		end if;
	end if;
end process;

p5: process (clk25, hcounter, vcounter)
	variable x: integer range 0 to 639;
	variable y: integer range 0 to 479;
	variable horizontal_pixel: integer range 0 to 7;
	variable vertical_pixel: integer range 0 to 16;
begin
	-- hcounter counts from 0 to 799
	-- vcounter counts from 0 to 520
	-- x coordinate: 0 - 639 (x = hcounter - 144, i.e., hcounter -Tpw-Tbp)
	-- y coordinate: 0 - 479 (y = vcounter - 31, i.e., vcounter-Tpw-Tbp)
	x := hcounter - 144;
	y := vcounter - 31;
	horizontal_pixel := hpcounter - 1;
	vertical_pixel := vpcounter;
  	if clk25'event and clk25 = '1' then
 		-- To draw a pixel in (x0, y0), simply test if the ray trace to it
		-- and set its color to any value between 1 to 7. The following example simply sets 
		-- the whole display area to a single-color wash, which is changed every one 
		-- second. 	
	 	if ( (( x > 0) and (x < 639)) and ((y > 0) and (y < 479)) ) then
		
			-- get the character we are to draw
			-- for now let's draw all x02_ (smilie faces)
			xsignal <= conv_std_logic_vector(x, 11);
			ysignal <= conv_std_logic_vector(y, 11);

		   number <= char_read_value & "0000";
 		   -- char_read_addr <= "000000000011";	
			
 			-- column <= x / 8;
 			-- column <= (x >> 3);    parse error, unexpected GT
    		column <= "000" & xsignal(11 downto 3);
			
			-- row <= y / 16
 			-- row <= (y >> 4)
 			row <= "0000" & ysignal(11 downto 4);
 			
 			-- char_read_addr <= row * 128 + column
 			-- char_read_addr <= (row << 7) + column
 			char_read_addr <= (row(4 downto 0) & "0000000") + column;
			
			-- char_read_addr <= (("0000" & ysignal(11 downto 4))(4 downto 0) & "0000000") + ("000" & xsignal(11 downto 3));
			
			-- old
			-- char_read_addr <= ((("0000" & ysignal(11 downto 4))(3 downto 0) & "00000000") + ("000" & xsignal(11 downto 3)));

			-- 0 is x30_
			-- fetch x02_
			-- number <= x"450";
			ascii_line <= number + vpcounter;
			white_out <= ascii_pixels(horizontal_pixel);
						
      	red_out(2)   <= white_out;
      	red_out(1)   <= white_out;
      	red_out(0)   <= white_out;
      	green_out(2) <= white_out; 
      	green_out(1) <= white_out; 
      	green_out(0) <= white_out; 
      	blue_out(2)  <= white_out;
      	blue_out(1)  <= white_out;
      	blue_out(0)  <= white_out;
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
		hpcounter <= hpcounter-1;
		
    	if hcounter = 800 then
      	vcounter <= vcounter+1;
			vpcounter <= vpcounter+1;
      	hcounter <= 0;
			hpcounter <= 8;
    	end if;
	 	-- vertical counts from 0 to 519
    	if vcounter = 521 then		    
      	vcounter <= 0;
			vpcounter <= 0;
    	end if;
		if hpcounter = 0 then
			hpcounter <= 8;
		end if;
		if vpcounter = 17 then
			vpcounter <= 0;
		end if;
  end if;
end process;

  -- instantiate the mips CPU
  mips_cpu: top port map( mips_clk_input, reset, writedata, dataadr, io_fib_num, io_fib_result, io_fib_result_2, memwrite, pc);
    
  -- debug signals - this simply outputs the program counter address and the 
  -- signal for memory write.
  --led(6) <= memwrite;
  --led(5 downto 0) <= pc(5 downto 0);

end test_fpga;