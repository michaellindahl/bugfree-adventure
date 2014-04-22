library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity regfile is -- three-port register file
  port(clk:           in  STD_LOGIC;
       we3:           in  STD_LOGIC;
       ra1, ra2, wa3: in  STD_LOGIC_VECTOR(4 downto 0);
       wd3:           in  STD_LOGIC_VECTOR(31 downto 0);
       rd1, rd2:      out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
entity adder is -- adder
  port(a, b: in  STD_LOGIC_VECTOR(31 downto 0);
       y:    out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;
entity sl2 is -- shift left by 2
  port(a: in  STD_LOGIC_VECTOR(31 downto 0);
       y: out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;
--entity signext is -- sign extender
  entity extend is
  port(a: in  STD_LOGIC_VECTOR(15 downto 0);
       y: out STD_LOGIC_VECTOR(31 downto 0);
		 extend_switch: in STD_LOGIC); -- added this in;
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;  
use IEEE.NUMERIC_STD.all;
entity flopr is -- flip-flop with synchronous reset
  generic(width: integer);
  port(clk, reset: in  STD_LOGIC;
       d:          in  STD_LOGIC_VECTOR(width-1 downto 0);
       q:          out STD_LOGIC_VECTOR(width-1 downto 0));
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;
entity mux2 is -- two-input multiplexer
  generic(width: integer);
  port(d0, d1: in  STD_LOGIC_VECTOR(width-1 downto 0);
       s:      in  STD_LOGIC;
       y:      out STD_LOGIC_VECTOR(width-1 downto 0));
end;


architecture behave of regfile is
  type ramtype is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
  signal mem: ramtype;
begin
  -- three-ported register file
  -- read two ports combinationally
  -- write third port on rising edge of clock
  process(clk) begin
    if clk'event and clk = '1' then
       if we3 = '1' then mem(to_integer( unsigned(wa3) )) <= wd3;
       end if;
    end if;
  end process;
  process(ra1, ra2, mem) begin
    if ( to_integer(unsigned(ra1)) = 0) then rd1 <= X"00000000"; -- register 0 holds 0
    else rd1 <= mem(to_integer(unsigned(ra1)));
    end if;
    if ( to_integer(unsigned(ra2)) = 0) then rd2 <= X"00000000"; 
    else rd2 <= mem(to_integer( unsigned(ra2)));
    end if;
  end process;
end;

architecture behave of adder is
begin
  y <= a + b;
end;

architecture behave of sl2 is
begin
  y <= a(29 downto 0) & "00";
end;

--architecture behave of signext is
architecture behave of extend is
begin
  y <= X"0000" & a when ((a(15) = '0') or (extend_switch = '1')) else X"ffff" & a; 
end;

architecture asynchronous of flopr is
begin
  process(clk, reset) begin
    if reset = '1' then  q <= std_logic_vector(to_unsigned(0,32));
    elsif clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end;

architecture behave of mux2 is
begin
  y <= d0 when s = '0' else d1;
end;
