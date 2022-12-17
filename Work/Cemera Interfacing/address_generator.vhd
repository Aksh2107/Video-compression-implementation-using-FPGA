library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Address_Generator is
  Port (   
    CLK25,enable : in  STD_LOGIC;  -- 
    vsync        : in  STD_LOGIC;
    address      : out STD_LOGIC_VECTOR (16 downto 0) 
  );  
end Address_Generator;

architecture Behavioral of Address_Generator is

  signal val: STD_LOGIC_VECTOR(address'range):= (others => '0'); -- signals
  
begin

  address <= val; -- adresse genretor

  process(CLK25)
    begin
      if rising_edge(CLK25) then
      
        if (enable='1') then        

          if (val < 320*240) then         
            val <= val + 1 ;
          end if;
        end if;
        
        if vsync = '0' then 
           val <= (others => '0');
        end if;
        
      end if;  
    end process;
end Behavioral;
