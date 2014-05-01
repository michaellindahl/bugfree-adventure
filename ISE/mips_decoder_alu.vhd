library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity aludec is -- ALU control decoder
  port(funct:      in  STD_LOGIC_VECTOR(5 downto 0);
       aluop:      in  STD_LOGIC_VECTOR(1 downto 0);
       alucontrol: out STD_LOGIC_VECTOR(3 downto 0);
		 op:      in STD_LOGIC_VECTOR(5 downto 0));
end;

architecture behave of aludec is
begin
  process(aluop, funct) begin
    case aluop is
      when "00" => alucontrol <= "0010"; -- add (for lb/sb/addi)
      when "01" => alucontrol <= "1010"; -- sub (for beq)
      when "10" => case op is
								 when "001101" => alucontrol <= "0001"; -- ori
								 when "001100" => alucontrol <= "0000"; -- andi (made it like and)
								 when "000000" => case funct is         -- R-type instructions
													 when "100000" => alucontrol <= "0010"; -- add (for add)
													 when "100010" => alucontrol <= "1010"; -- subtract (for sub)
													 when "100100" => alucontrol <= "0000"; -- logical and (for and)
													 when "100101" => alucontrol <= "0001"; -- logical or (for or)
													 when "100110" => alucontrol <= "0101"; -- xor
													 when "100111" => alucontrol <= "0100"; -- nor
													 when "101010" => alucontrol <= "1011"; -- set on less (for slt)														                 												 	                
													 when others   => alucontrol <= "---0"; -- should never happen
												end case;
								when others   => alucontrol <= "-00-"; -- should never happen
							end case;
		when others   => alucontrol <= "0---"; -- should never happen			
    end case;
  end process;
end;

