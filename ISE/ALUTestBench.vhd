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
         alucontrol : IN  std_logic_vector(3 downto 0);
         result : INOUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal alucontrol : std_logic_vector(3 downto 0) := (others => '0');

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
		a <= X"00000002"; -- 010                    010
		b <= X"00000006"; -- 110   11111111111111111001 (not)
		
		-- test a and b
		alucontrol <= "0000"; wait for 10 ns;
		assert result = X"00000002" report "#1 and failed";
		
		-- test a or b
		alucontrol <= "0001"; wait for 10 ns;
		assert result = X"00000006" report "#1 or failed";	
		
		-- test a + b
		alucontrol <= "0010"; wait for 10 ns;
		assert result = X"00000008" report "#1 plus failed";
		
		-- test a nor b
		-- 111111111111001
		alucontrol <= "0100"; wait for 10 ns;
		assert result = X"FFFFFFF9" report "#1 nor failed";
		
		-- test a xor b
		-- 100
		alucontrol <= "0101"; wait for 10 ns;
		assert result = X"00000004" report "#1 xor failed";
		
		-- test a and not b
		alucontrol <= "1000"; wait for 10 ns;
		assert result = X"00000000" report "#1 and not failed";
		
		-- test a or not b
		alucontrol <= "1001"; wait for 10 ns;
		assert result = X"FFFFFFFB" report "#1 or not failed";	
		
		-- test a - b
		alucontrol <= "1010"; wait for 10 ns;
		assert result = X"FFFFFFFC" report "#1 subtract failed";		
		
		-- test slt
		alucontrol <= "1011"; wait for 10 ns;
		assert result = X"00000001" report "#1 slt failed";
		
		
      -- set a, b
		a <= X"0000000C"; -- 1100
		b <= X"00000001"; -- 0001 
		
		-- test a and b
		alucontrol <= "0000"; wait for 10 ns;
		assert result = X"00000000" report "#2 and failed";
		
		-- test a or b
		alucontrol <= "0001"; wait for 10 ns;
		assert result = X"0000000D" report "#2 or failed";	
		
		-- test a + b
		alucontrol <= "0010"; wait for 10 ns;
		assert result = X"0000000D" report "#2 plus failed";
		
		-- test a nor b
		-- 1111110010
		alucontrol <= "0100"; wait for 10 ns;
		assert result = X"FFFFFFF2" report "#2 nor failed";
		
		-- test a xor b
		-- 100
		alucontrol <= "0101"; wait for 10 ns;
		assert result = X"0000000D" report "#2 xor failed";		
		
		-- test a and not b
		alucontrol <= "1000"; wait for 10 ns;
		assert result = X"0000000C" report "#2 and not failed";
		
		-- test a or not b
		alucontrol <= "1001"; wait for 10 ns;
		assert result = X"FFFFFFFE" report "#2 or not failed";	
		
		-- test a - b
		alucontrol <= "1010"; wait for 10 ns;
		assert result = X"0000000B" report "#2 subtract failed";		
		
		-- test slt
		alucontrol <= "1011"; wait for 10 ns;
		assert result = X"00000000" report "#2 slt failed";
		
		
		
      -- set a, b
		a <= X"0000000C"; -- 01100 (12)      01100
		b <= X"0000000D"; -- 01101 (13)   111100
		
		-- test a and b
		alucontrol <= "0000"; wait for 10 ns;
		assert result = X"0000000C" report "#3 and failed"; -- 01100
		
		-- test a or b
		alucontrol <= "0001"; wait for 10 ns;
		assert result = X"0000000D" report "#3 or failed";	-- 01101
		
		-- test a + b
		alucontrol <= "0010"; wait for 10 ns;
		assert result = X"00000019" report "#3 plus failed"; -- (25)
		
		-- test a nor b
		-- 1110010
		alucontrol <= "0100"; wait for 10 ns;
		assert result = X"FFFFFFF2" report "#3 nor failed";
		
		-- test a xor b
		-- 001
		alucontrol <= "0101"; wait for 10 ns;
		assert result = X"00000001" report "#3 xor failed";	
		
		-- test a and not b
		alucontrol <= "1000"; wait for 10 ns;
		assert result = X"00000000" report "#3 and not failed"; 
		
		-- test a or not b
		alucontrol <= "1001"; wait for 10 ns;
		assert result = X"FFFFFFFE" report "#3 or not failed"; -- 11111110
		
		-- test a - b
		--   001
		--   110
		-- 11111
		alucontrol <= "1010"; wait for 10 ns;
		assert result = X"FFFFFFFF" report "#3 subtract failed";	-- FFFFFE
		
		-- test slt
		alucontrol <= "1011"; wait for 10 ns;
		assert result = X"00000001" report "#3 slt failed";
		

			
      -- set a, b
		a <= X"00000003"; -- 00011    00011
		b <= X"0000001B"; -- 11011    11111100111
		
		-- test a and b
		alucontrol <= "0000"; wait for 10 ns;
		assert result = X"00000003" report "#4 and failed";
		
		-- test a or b
		alucontrol <= "0001"; wait for 10 ns;
		assert result = X"0000001B" report "#4 or failed";	
		
		-- test a + b
		alucontrol <= "0010"; wait for 10 ns;
		assert result = X"0000001E" report "#4 plus failed";
		
		-- test a nor b
		-- 11100100
		alucontrol <= "0100"; wait for 10 ns;
		assert result = X"FFFFFFE4" report "#4 nor failed";
		
		-- test a xor b
		-- 11000
		alucontrol <= "0101"; wait for 10 ns;
		assert result = X"00000018" report "#4 xor failed";	
				
		-- test a and not b
		alucontrol <= "1000"; wait for 10 ns;
		assert result = X"00000000" report "#4 and not failed";
		
		-- test a or not b
		alucontrol <= "1001"; wait for 10 ns;
		assert result = X"FFFFFFE7" report "#4 or not failed";	
		
		-- test a - b
		--   011000
		-- 11101000
		alucontrol <= "1010"; wait for 10 ns;
		assert result = X"FFFFFFE8" report "#4 subtract failed";		
		
		-- test slt
		alucontrol <= "1011"; wait for 10 ns;
		assert result = X"00000001" report "#4 slt failed";
		
	
      wait;
   end process;

END;
