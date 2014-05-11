----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:03 05/07/2008 
-- Design Name: 
-- Module Name:    test1 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test1 is
PORT( Clock 				: IN std_logic;
      Red,Green,Blue 	    : out  STD_LOGIC_VECTOR(2 downto 0);
      Horiz_sync,Vert_sync	: OUT std_logic;
      reset1                 : IN std_logic
     );

end test1;

architecture Behavioral of test1 is
	signal pixel_row : STD_LOGIC_VECTOR (11 downto 0);
	signal pixel_column : STD_LOGIC_VECTOR (11 downto 0);
	signal red_data, green_data, blue_data : std_logic;
	signal clk_25 : STD_LOGIC := '0';

COMPONENT vga_gen is
    Port ( clk : in STD_LOGIC;
	        red, green, blue : IN STD_LOGIC := '0';
           red_out : out  STD_LOGIC_VECTOR(2 downto 0);
           green_out : out  STD_LOGIC_VECTOR(2 downto 0);
           blue_out : out  STD_LOGIC_VECTOR(2 downto 0);
	        hsync : out STD_LOGIC;
	        vsync : out STD_LOGIC;
	        pixel_row : out  STD_LOGIC_VECTOR (11 downto 0);
	        pixel_column : out  STD_LOGIC_VECTOR (11 downto 0));
END COMPONENT;


	
begin

	SYNC: vga_gen
 		PORT MAP(clk => clock, 
				red => red_data, green => green_data, blue => blue_data,	
    	     	red_out => red, green_out => green, blue_out => blue,
			 	hsync => horiz_sync, vsync => vert_sync,
			 	pixel_row => pixel_row, pixel_column => pixel_column);
				-- Display PC in seven-segment displays
				
	process ( pixel_row, pixel_column )
	begin
--		if pixel_row > 200 AND pixel_row < 300 then
--			if pixel_column > 100 AND pixel_column < 540 then
--				red_data <= '1';
--			else
--				red_data <= '0';
--				blue_data <= '0';
--				green_data <= '0';
--			end if;
--		end if;
	red_data <= '1';
	blue_data <= '0';
	green_data <= '0';
	end process;
	
--clk_div : process ( clock )
--	variable cnt : integer := 0;
--	begin
--		if rising_edge ( clock ) then
--			if cnt = 1 then
--				cnt := 0;
--				clk_25 <= not clk_25;
--			else
--				cnt := cnt + 1;
--			end if;
--		end if;
--end process;
--		

end Behavioral;

