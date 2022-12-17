	component compression is
		port (
			clk_clk          : in    std_logic                     := 'X';             -- clk
			leds_w_export    : out   std_logic_vector(7 downto 0);                     -- export
			line1_1_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line1_1_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line1_2_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line1_2_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line2_1_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line2_1_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line2_2_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line2_2_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line3_1_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line3_1_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line3_2_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line3_2_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line4_1_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line4_1_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line4_2_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line4_2_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line5_1_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line5_1_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line5_2_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line5_2_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line6_1_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line6_1_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line6_2_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line6_2_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line7_1_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line7_1_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line7_2_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line7_2_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line8_1_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line8_1_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			line8_2_in_port  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			line8_2_out_port : out   std_logic_vector(31 downto 0);                    -- out_port
			reset_reset_n    : in    std_logic                     := 'X';             -- reset_n
			sdram_addr       : out   std_logic_vector(11 downto 0);                    -- addr
			sdram_ba         : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n      : out   std_logic;                                        -- cas_n
			sdram_cke        : out   std_logic;                                        -- cke
			sdram_cs_n       : out   std_logic;                                        -- cs_n
			sdram_dq         : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_dqm        : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_ras_n      : out   std_logic;                                        -- ras_n
			sdram_we_n       : out   std_logic;                                        -- we_n
			sdram_pll_clk    : out   std_logic                                         -- clk
		);
	end component compression;

	u0 : component compression
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --       clk.clk
			leds_w_export    => CONNECTED_TO_leds_w_export,    --    leds_w.export
			line1_1_in_port  => CONNECTED_TO_line1_1_in_port,  --   line1_1.in_port
			line1_1_out_port => CONNECTED_TO_line1_1_out_port, --          .out_port
			line1_2_in_port  => CONNECTED_TO_line1_2_in_port,  --   line1_2.in_port
			line1_2_out_port => CONNECTED_TO_line1_2_out_port, --          .out_port
			line2_1_in_port  => CONNECTED_TO_line2_1_in_port,  --   line2_1.in_port
			line2_1_out_port => CONNECTED_TO_line2_1_out_port, --          .out_port
			line2_2_in_port  => CONNECTED_TO_line2_2_in_port,  --   line2_2.in_port
			line2_2_out_port => CONNECTED_TO_line2_2_out_port, --          .out_port
			line3_1_in_port  => CONNECTED_TO_line3_1_in_port,  --   line3_1.in_port
			line3_1_out_port => CONNECTED_TO_line3_1_out_port, --          .out_port
			line3_2_in_port  => CONNECTED_TO_line3_2_in_port,  --   line3_2.in_port
			line3_2_out_port => CONNECTED_TO_line3_2_out_port, --          .out_port
			line4_1_in_port  => CONNECTED_TO_line4_1_in_port,  --   line4_1.in_port
			line4_1_out_port => CONNECTED_TO_line4_1_out_port, --          .out_port
			line4_2_in_port  => CONNECTED_TO_line4_2_in_port,  --   line4_2.in_port
			line4_2_out_port => CONNECTED_TO_line4_2_out_port, --          .out_port
			line5_1_in_port  => CONNECTED_TO_line5_1_in_port,  --   line5_1.in_port
			line5_1_out_port => CONNECTED_TO_line5_1_out_port, --          .out_port
			line5_2_in_port  => CONNECTED_TO_line5_2_in_port,  --   line5_2.in_port
			line5_2_out_port => CONNECTED_TO_line5_2_out_port, --          .out_port
			line6_1_in_port  => CONNECTED_TO_line6_1_in_port,  --   line6_1.in_port
			line6_1_out_port => CONNECTED_TO_line6_1_out_port, --          .out_port
			line6_2_in_port  => CONNECTED_TO_line6_2_in_port,  --   line6_2.in_port
			line6_2_out_port => CONNECTED_TO_line6_2_out_port, --          .out_port
			line7_1_in_port  => CONNECTED_TO_line7_1_in_port,  --   line7_1.in_port
			line7_1_out_port => CONNECTED_TO_line7_1_out_port, --          .out_port
			line7_2_in_port  => CONNECTED_TO_line7_2_in_port,  --   line7_2.in_port
			line7_2_out_port => CONNECTED_TO_line7_2_out_port, --          .out_port
			line8_1_in_port  => CONNECTED_TO_line8_1_in_port,  --   line8_1.in_port
			line8_1_out_port => CONNECTED_TO_line8_1_out_port, --          .out_port
			line8_2_in_port  => CONNECTED_TO_line8_2_in_port,  --   line8_2.in_port
			line8_2_out_port => CONNECTED_TO_line8_2_out_port, --          .out_port
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    --     reset.reset_n
			sdram_addr       => CONNECTED_TO_sdram_addr,       --     sdram.addr
			sdram_ba         => CONNECTED_TO_sdram_ba,         --          .ba
			sdram_cas_n      => CONNECTED_TO_sdram_cas_n,      --          .cas_n
			sdram_cke        => CONNECTED_TO_sdram_cke,        --          .cke
			sdram_cs_n       => CONNECTED_TO_sdram_cs_n,       --          .cs_n
			sdram_dq         => CONNECTED_TO_sdram_dq,         --          .dq
			sdram_dqm        => CONNECTED_TO_sdram_dqm,        --          .dqm
			sdram_ras_n      => CONNECTED_TO_sdram_ras_n,      --          .ras_n
			sdram_we_n       => CONNECTED_TO_sdram_we_n,       --          .we_n
			sdram_pll_clk    => CONNECTED_TO_sdram_pll_clk     -- sdram_pll.clk
		);

