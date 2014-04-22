library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity aludec is -- ALU control decoder
  port(funct:      in  STD_LOGIC_VECTOR(5 downto 0);
       aluop:      in  STD_LOGIC_VECTOR(1 downto 0);
       alucontrol: out STD_LOGIC_VECTOR(2 downto 0);
		 op:      in STD_LOGIC_VECTOR(5 downto 0));
end;

architecture behave of aludec is
begin
  process(aluop, funct) begin
    case aluop is
      when "00" => alucontrol <= "010"; -- add (for lb/sb/addi)
      when "01" => alucontrol <= "110"; -- sub (for beq)
      when "10" => case op is
								 when "001101" => alucontrol <= "010"; -- ori
								 when "000000" => case funct is         -- R-type instructions
													 when "100000" => alucontrol <= "010"; -- add (for add)
													 when "100010" => alucontrol <= "110"; -- subtract (for sub)
													 when "100100" => alucontrol <= "000"; -- logical and (for and)
													 when "100101" => alucontrol <= "001"; -- logical or (for or)
													 when "101010" => alucontrol <= "111"; -- set on less (for slt)
													 when others   => alucontrol <= "--0"; -- should never happen
												end case;
								when others   => alucontrol <= "-0-"; -- should never happen
							end case;
		when others   => alucontrol <= "0--"; -- should never happen			
    end case;
  end process;
end;

