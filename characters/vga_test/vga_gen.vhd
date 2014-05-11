----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:15 01/28/2008 
-- Design Name: 
-- Module Name:    vga_gen - Behavioral 
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
library IEEE, unisim;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use unisim.vcomponents.all;
use work.ps2_kbd_pckg.all;
use work.font_rom_pckg.all;

entity vgatest is
  generic(
    FREQ     :     natural := 100_000   -- frequency of main clock (KHz)
    );
port(clk50_in : in std_logic;
	red_out : out std_logic_vector(2 downto 0);
	green_out : out std_logic_vector(2 downto 0);
	blue_out : out std_logic_vector(2 downto 0);
	ps2_clk  : in  std_logic;           -- keyboard clock
   ps2_data : in  std_logic;           -- keyboard data
	hs_out : out std_logic;
	vs_out : out std_logic);
end vgatest;

architecture behavioral of vgatest is

signal clk              : std_logic;
signal hcounter : integer range 0 to 800;
signal vcounter   : integer range 0 to 521;
signal hpcounter : integer range 0 to 8 := 8;
signal vpcounter : integer range 0 to 17;
signal color: std_logic_vector(8 downto 0);

  constant YES : std_logic := '1';
  constant NO  : std_logic := '0';

  signal scancode  : std_logic_vector(7 downto 0);  -- scancode from keyboard
  signal rdy       : std_logic;         -- indicates when scancode is available
  signal keyboard_map       : std_logic_vector(8 downto 0);  -- next state of LED segments
  signal kbd_error : std_logic;         -- error receiving scancode from keyboard
  
  -- signals for font ROM
  signal ascii_line   : std_logic_vector(10 downto 0);
  signal ascii_pixels : std_logic_vector(7 downto 0);
  signal white_out 	 : std_logic;
  
  signal number : std_logic_vector(11 downto 0);
  
  -- Color patterns for various numbers and letters
  constant DIG_1    : std_logic_vector(8 downto 0) := "111000000";
  constant DIG_2    : std_logic_vector(8 downto 0) := "111100000";
  constant DIG_3    : std_logic_vector(8 downto 0) := "111111000";
  constant DIG_4    : std_logic_vector(8 downto 0) := "000111000";
  constant DIG_5    : std_logic_vector(8 downto 0) := "000100110";
  constant DIG_6    : std_logic_vector(8 downto 0) := "000010110";
  constant DIG_7    : std_logic_vector(8 downto 0) := "000000111";
  constant DIG_8    : std_logic_vector(8 downto 0) := "100000110";
  constant DIG_9    : std_logic_vector(8 downto 0) := "100000011";
  constant DIG_0    : std_logic_vector(8 downto 0) := "111000000";
  constant LETTER_Q : std_logic_vector(8 downto 0) := "101000000";
  constant LETTER_W : std_logic_vector(8 downto 0) := "101011000";
  constant LETTER_E : std_logic_vector(8 downto 0) := "101101000";
  constant LETTER_R : std_logic_vector(8 downto 0) := "000101000";
  constant LETTER_T : std_logic_vector(8 downto 0) := "000011100";
  constant LETTER_Y : std_logic_vector(8 downto 0) := "000010100";
  constant LETTER_U : std_logic_vector(8 downto 0) := "000000101";
  constant LETTER_I : std_logic_vector(8 downto 0) := "011000100";
  constant LETTER_O : std_logic_vector(8 downto 0) := "100000010";
  constant LETTER_P : std_logic_vector(8 downto 0) := "101000000";
  constant LETTER_A : std_logic_vector(8 downto 0) := "011000000";
  constant LETTER_S : std_logic_vector(8 downto 0) := "011010000";
  constant LETTER_D : std_logic_vector(8 downto 0) := "011011000";
  constant LETTER_F : std_logic_vector(8 downto 0) := "000011000";
  constant LETTER_G : std_logic_vector(8 downto 0) := "000010010";
  constant LETTER_H : std_logic_vector(8 downto 0) := "000001010";
  constant LETTER_J : std_logic_vector(8 downto 0) := "000000011";
  constant LETTER_K : std_logic_vector(8 downto 0) := "010000010";
  constant LETTER_L : std_logic_vector(8 downto 0) := "010000001";
  constant SYMBOL_SEMI : std_logic_vector(8 downto 0) := "011000000";
  constant LETTER_Z : std_logic_vector(8 downto 0) := "001000000";
  constant LETTER_X : std_logic_vector(8 downto 0) := "001001000";
  constant LETTER_C : std_logic_vector(8 downto 0) := "001001000";
  constant LETTER_V : std_logic_vector(8 downto 0) := "000001000";
  constant LETTER_B : std_logic_vector(8 downto 0) := "000001000";
  constant LETTER_N : std_logic_vector(8 downto 0) := "000001001";
  constant LETTER_M : std_logic_vector(8 downto 0) := "000000001";
  constant SYMBOL_COMMA : std_logic_vector(8 downto 0) := "001000001";
  constant SYMBOL_PERIOD : std_logic_vector(8 downto 0) := "001000000";
  constant SYMBOL_SLASH : std_logic_vector(8 downto 0) := "001000000";
  constant OTHER_INPUT : std_logic_vector(8 downto 0) := "000000000";
  
  
begin

  u0 : ps2_kbd
    generic map(
      FREQ     => FREQ
      )
    port map(
      clk      => clk,                  -- clock for the keyboard interface
      rst      => kbd_error,            -- reset the keyboard intfc whenever there is an error receiving a scancode
      ps2_clk  => ps2_clk,              -- clock from the keyboard
      ps2_data => ps2_data,             -- serial data from the keyboard (valid on falling edge of ps2_clk)
      scancode => scancode,             -- the scancode received from the keyboard
      rdy      => rdy,                  -- indicates when a scancode from the keyboard is available
      error    => kbd_error             -- indicates an error in receiving a scancode from the keyboard
      );

	u1 : font_rom
   port map(
      clk		=> clk,
      addr		=> ascii_line, -- x200 - x200f for 0
      data     => ascii_pixels
   );

  -- this maps the scancode received from the keyboard into a pattern on the 7-segment display
 keyboard_map <= DIG_1 when scancode = "00010110" else
         DIG_2 when scancode = "00011110" else
         DIG_3 when scancode = "00100110" else
         DIG_4 when scancode = "00100101" else
         DIG_5 when scancode = "00101110" else
         DIG_6 when scancode = "00110110" else
         DIG_7 when scancode = "00111101" else
         DIG_8 when scancode = "00111110" else
         DIG_9 when scancode = "01000110" else
         DIG_0 when scancode = "01000101" else
			LETTER_Q when scancode = "00010101" else
			LETTER_W when scancode = "00011101" else
			LETTER_E when scancode = "00100100" else
			LETTER_R when scancode = "00101101" else
			LETTER_T when scancode = "00101100" else
			LETTER_Y when scancode = "00110101" else
			LETTER_U when scancode = "00111100" else
			LETTER_I when scancode = "01000011" else
			LETTER_O when scancode = "01000100" else
			LETTER_P when scancode = "01001101" else
			LETTER_A when scancode = "00011100" else
			LETTER_S when scancode = "00011011" else
			LETTER_D when scancode = "00100011" else
			LETTER_F when scancode = "00101011" else
			LETTER_G when scancode = "00110100" else
			LETTER_H when scancode = "00110011" else
			LETTER_J when scancode = "00111011" else
			LETTER_K when scancode = "01000010" else
			LETTER_L when scancode = "01001011" else
			SYMBOL_SEMI when scancode = "01001100" else
			LETTER_Z when scancode = "00011010" else
			LETTER_X when scancode = "00100010" else
			LETTER_C when scancode = "00100001" else
			LETTER_V when scancode = "00101010" else
			LETTER_B when scancode = "00110010" else
			LETTER_N when scancode = "00110001" else
			LETTER_M when scancode = "00111010" else
			SYMBOL_COMMA when scancode = "01000001" else
			SYMBOL_PERIOD when scancode = "01001001" else
			SYMBOL_SLASH when scancode = "01001010" else
         OTHER_INPUT;
			
			
-- generate a 25Mhz clock
process (clk50_in)
begin
  if clk50_in'event and clk50_in='1' then
    clk <= not clk;
  end if;
end process;


-- change color based off input
p1: process(clk)
  begin
    if rising_edge(clk) then
      if rdy = YES then
         -- update RAM each time a scancode is received (keyboard)
      end if;
    end if;
end process;

p2: process (clk, hcounter, vcounter)
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
  	if clk'event and clk = '1' then
 		-- To draw a pixel in (x0, y0), simply test if the ray trace to it
		-- and set its color to any value between 1 to 7. The following example simply sets 
		-- the whole display area to a single-color wash, which is changed every one 
		-- second. 	
	 	if ( (( x > 0) and (x < 639)) and ((y > 0) and (y < 479)) ) then
		
			-- get the character we are to draw
			-- for now let's draw all x02_ (smilie faces)
		   -- 0 is x30_
			
			-- fetch x02_
			number <= x"350";
			ascii_line <= number(10 downto 0) + vpcounter;
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

end behavioral;