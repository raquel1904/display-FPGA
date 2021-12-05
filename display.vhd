library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 
entity Evidencia2 is 
port (clk: in std_logic; 
sw1: in std_logic; 
sw2: in std_logic; 
sw3: in std_logic; 
sw4: in std_logic; 
sw5: in std_logic; 
rw: out std_logic; 
en: out std_logic; 
rs: out std_logic; 
data: out std_logic_vector(7 downto 0)); 
end Evidencia2;

architecture funcionamiento of Evidencia2 is 
constant N: integer := 39; 
type arr is array (1 to N) of std_logic_vector(7 downto 0); 
constant info1: arr :=  
(X"38",X"0c",X"06",X"01",X"80",X"41",x"6E",x"61",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x "20",x"20",x"20",x"20",x"20",x"C0",x"43",x"72",x"69",x"73",x"20",x"20",x"20",x"20",x"20",x"20",x"2 0",x"20",x"20",x"20",x"20",x"20",X"53"); 
constant info2: arr :=  
(X"38",X"0c",X"06",X"01",X"80",X"41",x"6E",x"61",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x "20",x"20",x"20",x"20",x"20",x"C0",x"50",x"61",x"75",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"2 0",x"20",x"20",x"20",x"20",x"20",X"53"); 
constant info3: arr :=  
(X"38",X"0c",X"06",X"01",X"80",X"4D",x"61",x"72",x"69",x"73",x"20",x"20",x"20",x"20",x"20",x"20",x "20",x"20",x"20",x"20",x"20",x"C0",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"2 0",x"20",x"20",x"20",x"20",x"20",X"53"); 
constant info4: arr :=  
(X"38",X"0c",X"06",X"01",X"80",X"4D",x"6F",x"6E",x"74",x"73",x"65",x"20",x"20",x"20",x"20",x"20",x "20",x"20",x"20",x"20",x"20",x"C0",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"2 0",x"20",x"20",x"20",x"20",x"20",X"53"); 
constant info5: arr :=  
(X"38",X"0c",X"06",X"01",X"80",X"52",x"61",x"71",x"75",x"65",x"6C",x"20",x"20",x"20",x"20",x"20",x "20",x"20",x"20",x"20",x"20",x"C0",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"2 0",x"20",x"20",x"20",x"20",x"20",X"53"); 
constant NA: arr :=  
(X"38",X"0c",X"06",X"01",X"80",X"53",X"65",X"6C",X"65",X"63",x"63",x"69",x"6F",x"6E",x"61",x"72",x "20",x"20",x"20",x"20",x"20",x"C0",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"2 0",x"20",x"20",x"20",x"20",x"20",X"53"); 
begin 
rw <= '0'; 
process(clk) 
variable info: arr; 
variable i: integer := 0; 
variable j: integer := 1; 
begin 
if sw1 = '1' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '0' then 
info := info1; 
elsif sw2 = '1' and sw1 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '0' then info := info2; 
elsif sw3 = '1' and sw2 = '0' and sw1 = '0' and sw4 = '0' and sw5 = '0' then info := info3; 
elsif sw4 = '1' and sw2 = '0' and sw3 = '0' and sw1 = '0' and sw5 = '0' then info := info4; 
elsif sw5 = '1' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw1 = '0' then info := info5; 
else 
info := NA; 
end if; 
if clk'event and clk = '1' then 
if i <= 5000 then 
i := i + 1; 
en <= '1'; 
data <= info(j)(7 downto 0); 
elsif i > 5000 and i < 10000 then 
i := i + 1; 
en <= '0'; 
elsif i = 10000 then 
j := j + 1; 
i := 0; 
end if; 
if j <= 5 then 
rs <= '0'; 
elsif j = 22 then 
rs <= '0';

     else 
rs <= '1'; 
end if; 
if j = 39 then 
j := 5; 
end if; 
end if; 
end process; 

