------------------------------------------------------------------------------
-- Data Memory
------------------------------------------------------------------------------

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_UNSIGNED.all;  
use IEEE.NUMERIC_STD.all;

entity dmem is -- data memory
  port(clk, we:  in STD_LOGIC;
       a, wd:    in STD_LOGIC_VECTOR(31 downto 0);
       rd:       out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of dmem is
begin
  process ( clk, a ) is
    type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    variable mem: ramtype;
  begin
      if clk'event and clk = '1' then
          if (we = '1') then mem( to_integer(unsigned(a(7 downto 2))) ) := wd; -- write data value is stored to location 'a'. we do the typecast so we can index with an integer value
          end if;
      end if;
      rd <= mem( to_integer(unsigned(a(7 downto 2))) ); -- word aligned. -- read instruction is happening all the time. convert address to unsigned, to integer, to be indexed and driven to the read.
  end process;
end;

------------------------------------------------------------------------------
-- Instruction Memory
------------------------------------------------------------------------------

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_UNSIGNED.all;  
use IEEE.NUMERIC_STD.all;

entity imem is -- instruction memory
  port(a:  in  STD_LOGIC_VECTOR(5 downto 0);
       rd: out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of imem is
    type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);

    -- function to initialize the instruction memory from a data file
    impure function InitRamFromFile ( RamFileName : in string ) return RamType is -- this runs when your program is synthesized. this will read from a file, load it into RAM, and that RAM becomes a static value that can be synthesized to your hardware. reads from memfile.dat.
	      variable ch: character;
         variable index : integer; 
  			variable result: signed(31 downto 0);
			variable tmpResult: signed(63 downto 0);
	      file mem_file: TEXT is in RamFileName;
         variable L: line;
			variable RAM : ramtype;
			begin
				 -- initialize memory from a file
				 for i in 0 to 63 loop -- set all contents low
					RAM(i) := std_logic_vector(to_unsigned(0, 32));
				 end loop;
				 index := 0; 
				 while not endfile(mem_file) loop -- reads until it hits the end of mem file
				   -- read the next line from the file
					readline(mem_file, L);
				
  				   result := to_signed(0,32); -- converts 0 to a signed 32-bit value, stores it in result. result will be the final shifted added value.
					for i in 1 to 8 loop  -- this loop will read in each character in the line. 8 chars in 32-bit hex value.
					  -- read character from the line just read
					  read(L, ch);
					  --  convert character to a binary value from a hex value
					  if '0' <= ch and ch <= '9' then
							tmpResult := result*16 + character'pos(ch) - character'pos('0') ;
							result := tmpResult(31 downto 0); -- take 32 bits of temp result and store it in result.
					  elsif 'a' <= ch and ch <= 'f' then
							tmpResult := result*16 + character'pos(ch) - character'pos('a')+10 ;
							result := tmpResult(31 downto 0);
					  else report "Format error on line " & integer'image(index)
							 severity error;
					  end if;
					end loop;
					
					-- set the 32 bit binary value in ram
					RAM(index) := std_logic_vector(result);
					index := index + 1; -- increments the index for the next instruction to read in
				 end loop;
				 
				 -- return the array of instructions loaded in RAM
	          return RAM; 
	      end function;
begin
  process ( a ) is
    -- use the impure function to read RAM from a file and store in the FPGA's ram memory
  	 variable mem: ramtype := InitRamFromFile("adhoc.dat"); -- initializes 'mem' by reading from the data file memfile.dat
  begin
      rd <= mem( to_integer(unsigned(a)) ); -- constantly reading.
  end process;
end behave;
