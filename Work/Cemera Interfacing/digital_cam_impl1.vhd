
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity digital_cam_impl1 is
  Port ( clk_50 : in  STD_LOGIC;
    btn_resend          : in  STD_LOGIC;
    led_config_finished : out STD_LOGIC;

    vga_hsync : out  STD_LOGIC;
    vga_vsync : out  STD_LOGIC;
    vga_r     : out  STD_LOGIC_vector(7 downto 0);
    vga_g     : out  STD_LOGIC_vector(7 downto 0);
    vga_b     : out  STD_LOGIC_vector(7 downto 0);
    vga_blank_N : out  STD_LOGIC;
    vga_sync_N  : out  STD_LOGIC;
    vga_CLK     : out  STD_LOGIC;

    ov7670_pclk  : in  STD_LOGIC;
    ov7670_xclk  : out STD_LOGIC;
    ov7670_vsync : in  STD_LOGIC;
    ov7670_href  : in  STD_LOGIC;
    ov7670_data  : in  STD_LOGIC_vector(7 downto 0);
    ov7670_sioc  : out STD_LOGIC;
    ov7670_siod  : inout STD_LOGIC;
    ov7670_pwdn  : out STD_LOGIC;
    ov7670_reset : out STD_LOGIC
  );
end digital_cam_impl1;


architecture my_structural of digital_cam_impl1 is


  COMPONENT VGA
  PORT(
    CLK25 : IN std_logic;    
    Hsync : OUT std_logic;
    Vsync : OUT std_logic;
    Nblank : OUT std_logic;      
    clkout : OUT std_logic;
    activeArea : OUT std_logic;
    Nsync : OUT std_logic
    );
  END COMPONENT;

  COMPONENT ov7670_controller
  PORT(
    clk : IN std_logic;
    resend : IN std_logic;    
    siod : INOUT std_logic;      
    config_finished : OUT std_logic;
    sioc : OUT std_logic;
    reset : OUT std_logic;
    pwdn : OUT std_logic;
    xclk : OUT std_logic
    );
  END COMPONENT;

  COMPONENT frame_buffer
  PORT(
    data : IN std_logic_vector(11 downto 0);
    rdaddress : IN std_logic_vector(16 downto 0);
    rdclock : IN std_logic;
    wraddress : IN std_logic_vector(16 downto 0);
    wrclock : IN std_logic;
    wren : IN std_logic;          
    q : OUT std_logic_vector(11 downto 0)
    );
  END COMPONENT;

  COMPONENT ov7670_capture
  PORT(
    pclk : IN std_logic;
    vsync : IN std_logic;
    href : IN std_logic;
    d : IN std_logic_vector(7 downto 0);          
    addr : OUT std_logic_vector(16 downto 0);
    dout : OUT std_logic_vector(11 downto 0);
    we : OUT std_logic
    );
  END COMPONENT;

  COMPONENT RGB
  PORT(
    Din : IN std_logic_vector(11 downto 0);
    Nblank : IN std_logic;          
    R : OUT std_logic_vector(7 downto 0);
    G : OUT std_logic_vector(7 downto 0);
    B : OUT std_logic_vector(7 downto 0)
    );
  END COMPONENT;

  -- DE2-150 board has an Altera Cyclone VI GX, which has ALTPLL's'
  COMPONENT my_altpll
  PORT (
    inclk0 : IN STD_LOGIC := '0';
    c0     : OUT STD_LOGIC ;
    c1     : OUT STD_LOGIC 
    );
  END COMPONENT;

  COMPONENT Address_Generator
  PORT(
    CLK25       : IN  std_logic;
    enable      : IN  std_logic;       
    vsync       : in  STD_LOGIC;
    address     : OUT std_logic_vector(16 downto 0)
    );
  END COMPONENT;



  signal clk_50_camera : std_logic;
  signal clk_25_vga    : std_logic;
  signal wren       : std_logic;
  signal resend     : std_logic;
  signal nBlank     : std_logic;
  signal vSync      : std_logic;

  signal wraddress  : std_logic_vector(16 downto 0);
  signal wrdata     : std_logic_vector(11 downto 0);   
  signal rdaddress  : std_logic_vector(16 downto 0);
  signal rddata     : std_logic_vector(11 downto 0);
  signal red,green,blue : std_logic_vector(7 downto 0);
  signal activeArea : std_logic;
   

begin


  vga_r <= red(7 downto 0);
  vga_g <= green(7 downto 0);
  vga_b <= blue(7 downto 0);
   

  Inst_vga_pll: my_altpll PORT MAP(
    inclk0 => clk_50,
    c0 => clk_50_camera,
    c1 => clk_25_vga
  );    
    
    
  -- take the inverted push button because KEY0 on DE2-150 board generates
  -- a signal 111000111; with 1 with not pressed and 0 when pressed/pushed;
  resend <= not btn_resend;
  vga_vsync <= vsync;
  vga_blank_N <= nBlank;
  
  Inst_VGA: VGA PORT MAP(
    CLK25      => clk_25_vga,
    clkout     => vga_CLK,
    Hsync      => vga_hsync,
    Vsync      => vsync,
    Nblank     => nBlank,
    Nsync      => vga_sync_N,
    activeArea => activeArea
  );

  Inst_ov7670_controller: ov7670_controller PORT MAP(
    clk             => clk_50_camera,
    resend          => resend,
    config_finished => led_config_finished,
    sioc            => ov7670_sioc,
    siod            => ov7670_siod,
    reset           => ov7670_reset,
    pwdn            => ov7670_pwdn,
    xclk            => ov7670_xclk
  );
   
  Inst_ov7670_capture: ov7670_capture PORT MAP(
    pclk  => ov7670_pclk,
    vsync => ov7670_vsync,
    href  => ov7670_href,
    d     => ov7670_data,
    addr  => wraddress,
    dout  => wrdata,
    we    => wren
  );

  Inst_frame_buffer: frame_buffer PORT MAP(
    rdaddress => rdaddress,
    rdclock   => clk_25_vga,
    q         => rddata,      
    wrclock   => ov7670_pclk,
    wraddress => wraddress(16 downto 0),
    data      => wrdata,
    wren      => wren
  );
  
  Inst_RGB: RGB PORT MAP(
    Din => rddata,
    Nblank => activeArea,
    R => red,
    G => green,
    B => blue
  );

  Inst_Address_Generator: Address_Generator PORT MAP(
    CLK25 => clk_25_vga,
    enable => activeArea,
    vsync => vsync,
    address => rdaddress
  );

end my_structural;
