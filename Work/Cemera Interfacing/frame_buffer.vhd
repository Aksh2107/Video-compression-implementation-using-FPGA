LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY frame_buffer IS
  PORT
  (
    data     : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    rdaddress : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
    rdclock   : IN STD_LOGIC;
    wraddress : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
    wrclock   : IN STD_LOGIC;
    wren     : IN STD_LOGIC;
    q        : OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
  );
END frame_buffer;


ARCHITECTURE SYN OF frame_buffer IS

  
  COMPONENT my_frame_buffer_15to0 IS
  PORT
  (
    data    : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    rdaddress    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    rdclock    : IN STD_LOGIC ;
    wraddress    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    wrclock    : IN STD_LOGIC  := '1';
    wren    : IN STD_LOGIC  := '0';
    q    : OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
  );
  END COMPONENT;

  
  -- read signals
  signal q_top : STD_LOGIC_VECTOR (11 DOWNTO 0);
  signal q_bottom : STD_LOGIC_VECTOR (11 DOWNTO 0);
  -- write signals
  signal wren_top : STD_LOGIC;
  signal wren_bottom : STD_LOGIC;
  
BEGIN

  Inst_buffer_top : my_frame_buffer_15to0
    PORT MAP (
      data => data(11 downto 0),
      rdaddress => rdaddress(15 downto 0),
      rdclock => rdclock,
      wraddress => wraddress(15 downto 0),
      wrclock => wrclock,
      wren => wren_top,
      q => q_top
    );
  Inst_buffer_bottom : my_frame_buffer_15to0
    PORT MAP (
      data => data(11 downto 0),
      rdaddress => rdaddress(15 downto 0),
      rdclock => rdclock,
      wraddress => wraddress(15 downto 0),
      wrclock => wrclock,
      wren => wren_bottom,
      q => q_bottom
    );  
    
  process (wraddress(16), wren)
  begin
    case wraddress(16) is 
      when '0' =>
        wren_top <= wren; wren_bottom <= '0';
      when '1' =>
        wren_top <= '0'; wren_bottom <= wren;  
      when others =>
        wren_top <= '0'; wren_bottom <= '0';
    end case;
  end process;
  
  process (rdaddress(16), q_top, q_bottom)
  begin
    case rdaddress(16) is 
      when '0' =>
        q <= q_top;
      when '1' =>
        q <= q_bottom;
      when others =>
        q <= "000000000000";
    end case;
  end process;
    
END SYN;
