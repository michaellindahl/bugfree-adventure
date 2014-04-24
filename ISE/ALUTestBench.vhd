--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:48:49 04/22/2014
-- Design Name:   
-- Module Name:   C:/Users/tglasser15/Documents/GitHub/bugfree-adventure/ISE/ALUTestBench.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALUTestBench IS
END ALUTestBench;
 
ARCHITECTURE behavior OF ALUTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         alucontrol : IN  std_logic_vector(2 downto 0);
         result : INOUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal alucontrol : std_logic_vector(2 downto 0) := (others => '0');

	--BiDirs
   signal result : std_logic_vector(31 downto 0);

 	--Outputs
   signal zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          a => a,
          b => b,
          alucontrol => alucontrol,
          result => result,
          zero => zero
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- wait for <clock>_period*10;

      -- set a, b
		a <= X"010"; 
		b <= X"110";
		
		-- test a and b
		alucontrol <= "000"; wait for 10 ns;
		assert result = X"010" report "#1 and failed";
		
		-- test a or b
		alucontrol <= "001"; wait for 10 ns;
		assert result = X"110" report "#1 or failed";	
		
		-- test a + b
		alucontrol <= "010"; wait for 10 ns;
		assert result = X"1000" report "#1 plus failed";
		
		-- test a and not b
		alucontrol <= "100"; wait for 10 ns;
		assert result = X"000" report "#1 and not failed";
		
		-- test a or not b
		alucontrol <= "101"; wait for 10 ns;
		assert result = X"011" report "#1 or not failed";	
		
		-- test a - b
		alucontrol <= "110"; wait for 10 ns;
		assert result = "11111111111111111111111111111100" report "#1 subtract failed";		
		
		-- test slt
		alucontrol <= "111"; wait for 10 ns;
		assert result = X"001" report "#1 slt failed";
		
		
      -- set a, b
		a <= X"1100"; b <= X"0001";
		
		-- test a and b
		alucontrol <= "000"; wait for 10 ns;
		assert result = X"0000" report "#2 and failed";
		
		-- test a or b
		alucontrol <= "001"; wait for 10 ns;
		assert result = X"1101" report "#2 or failed";	
		
		-- test a + b
		alucontrol <= "010"; wait for 10 ns;
		assert result = X"1101" report "#2 plus failed";
		
		-- test a and not b
		alucontrol <= "100"; wait for 10 ns;
		assert result = X"1100" report "#2 and not failed";
		
		-- test a or not b
		alucontrol <= "101"; wait for 10 ns;
		assert result = X"1110" report "#2 or not failed";	
		
		-- test a - b
		alucontrol <= "110"; wait for 10 ns;
		assert result = X"1011" report "#2 subtract failed";		
		
		-- test slt
		alucontrol <= "111"; wait for 10 ns;
		assert result = X"0000" report "#2 slt failed";
		
		
		
      -- set a, b
		a <= X"10101"; b <= X"01101";
		
		-- test a and b
		alucontrol <= "000"; wait for 10 ns;
		assert result = X"00101" report "#3 and failed";
		
		-- test a or b
		alucontrol <= "001"; wait for 10 ns;
		assert result = X"11101" report "#3 or failed";	
		
		-- test a + b
		alucontrol <= "010"; wait for 10 ns;
		assert result = X"100010" report "#3 plus failed";
		
		-- test a and not b
		alucontrol <= "100"; wait for 10 ns;
		assert result = X"10000" report "#3 and not failed";
		
		-- test a or not b
		alucontrol <= "101"; wait for 10 ns;
		assert result = X"10111" report "#3 or not failed";	
		
		-- test a - b
		alucontrol <= "110"; wait for 10 ns;
		assert result = X"01000" report "#3 subtract failed";		
		
		-- test slt
		alucontrol <= "111"; wait for 10 ns;
		assert result = X"0000" report "#3 slt failed";
		

			
      -- set a, b
		a <= X"00011"; b <= X"11011";
		
		-- test a and b
		alucontrol <= "000"; wait for 10 ns;
		assert result = X"00011" report "#4 and failed";
		
		-- test a or b
		alucontrol <= "001"; wait for 10 ns;
		assert result = X"11011" report "#4 or failed";	
		
		-- test a + b
		alucontrol <= "010"; wait for 10 ns;
		assert result = X"11110" report "#4 plus failed";
		
		-- test a and not b
		alucontrol <= "100"; wait for 10 ns;
		assert result = X"00000" report "#4 and not failed";
		
		-- test a or not b
		alucontrol <= "101"; wait for 10 ns;
		assert result = X"00111" report "#4 or not failed";	
		
		-- test a - b
		alucontrol <= "110"; wait for 10 ns;
		assert result = X"11111111111111111111111111111000" report "#4 subtract failed";		
		
		-- test slt
		alucontrol <= "111"; wait for 10 ns;
		assert result = X"0001" report "#4 slt failed";
		
	
      wait;
   end process;

END;
