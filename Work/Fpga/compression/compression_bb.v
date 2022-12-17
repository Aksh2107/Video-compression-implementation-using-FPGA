
module compression (
	clk_clk,
	leds_w_export,
	line1_1_in_port,
	line1_1_out_port,
	line1_2_in_port,
	line1_2_out_port,
	line2_1_in_port,
	line2_1_out_port,
	line2_2_in_port,
	line2_2_out_port,
	line3_1_in_port,
	line3_1_out_port,
	line3_2_in_port,
	line3_2_out_port,
	line4_1_in_port,
	line4_1_out_port,
	line4_2_in_port,
	line4_2_out_port,
	line5_1_in_port,
	line5_1_out_port,
	line5_2_in_port,
	line5_2_out_port,
	line6_1_in_port,
	line6_1_out_port,
	line6_2_in_port,
	line6_2_out_port,
	line7_1_in_port,
	line7_1_out_port,
	line7_2_in_port,
	line7_2_out_port,
	line8_1_in_port,
	line8_1_out_port,
	line8_2_in_port,
	line8_2_out_port,
	reset_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	sdram_pll_clk);	

	input		clk_clk;
	output	[7:0]	leds_w_export;
	input	[31:0]	line1_1_in_port;
	output	[31:0]	line1_1_out_port;
	input	[31:0]	line1_2_in_port;
	output	[31:0]	line1_2_out_port;
	input	[31:0]	line2_1_in_port;
	output	[31:0]	line2_1_out_port;
	input	[31:0]	line2_2_in_port;
	output	[31:0]	line2_2_out_port;
	input	[31:0]	line3_1_in_port;
	output	[31:0]	line3_1_out_port;
	input	[31:0]	line3_2_in_port;
	output	[31:0]	line3_2_out_port;
	input	[31:0]	line4_1_in_port;
	output	[31:0]	line4_1_out_port;
	input	[31:0]	line4_2_in_port;
	output	[31:0]	line4_2_out_port;
	input	[31:0]	line5_1_in_port;
	output	[31:0]	line5_1_out_port;
	input	[31:0]	line5_2_in_port;
	output	[31:0]	line5_2_out_port;
	input	[31:0]	line6_1_in_port;
	output	[31:0]	line6_1_out_port;
	input	[31:0]	line6_2_in_port;
	output	[31:0]	line6_2_out_port;
	input	[31:0]	line7_1_in_port;
	output	[31:0]	line7_1_out_port;
	input	[31:0]	line7_2_in_port;
	output	[31:0]	line7_2_out_port;
	input	[31:0]	line8_1_in_port;
	output	[31:0]	line8_1_out_port;
	input	[31:0]	line8_2_in_port;
	output	[31:0]	line8_2_out_port;
	input		reset_reset_n;
	output	[11:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[31:0]	sdram_dq;
	output	[3:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	output		sdram_pll_clk;
endmodule
