module nios_handler(
			clk,reset,leds_w_export,sdram_clk,sdram_cke,sdram_addr,sdram_ba,sdram_cs_n,
			sdram_cas_n,sdram_ras_n,sdram_we_n,sdram_dq,sdram_dqm
);

		input clk;
		input reset;
		output [7:0] leds_w_export;
		output [12:0] sdram_addr;
		output [1:0] sdram_ba;
		output sdram_cas_n,sdram_ras_n,sdram_cke,sdram_cs_n;
		output sdram_we_n,sdram_clk;
		output[3:0] sdram_dqm;
		inout wire [31:0]sdram_dq;


		reg [31:0] Line1_1_IN; //mapping pin to register
		reg [31:0] Line1_2_IN;
		reg [31:0] Line2_1_IN;
		reg [31:0] Line2_2_IN;
		reg [31:0] Line3_1_IN;
		reg [31:0] Line3_2_IN;
		reg [31:0] Line4_1_IN;
		reg [31:0] Line4_2_IN;
		reg [31:0] Line5_1_IN;
		reg [31:0] Line5_2_IN;
		reg [31:0] Line6_1_IN;
		reg [31:0] Line6_2_IN;
		reg [31:0] Line7_1_IN;
		reg [31:0] Line7_2_IN;
		reg [31:0] Line8_1_IN;
		reg [31:0] Line8_2_IN;

		reg [31:0] Line1_1_OUT;
		reg [31:0] Line1_2_OUT;
		reg [31:0] Line2_1_OUT;
		reg [31:0] Line2_2_OUT;
		reg [31:0] Line3_1_OUT;
		reg [31:0] Line3_2_OUT;
		reg [31:0] Line4_1_OUT;
		reg [31:0] Line4_2_OUT;
		reg [31:0] Line5_1_OUT;
		reg [31:0] Line5_2_OUT;
		reg [31:0] Line6_1_OUT;
		reg [31:0] Line6_2_OUT;
		reg [31:0] Line7_1_OUT;
		reg [31:0] Line7_2_OUT;
		reg [31:0] Line8_1_OUT;
		reg [31:0] Line8_2_OUT;

		wire[7:0] matrix_8[64:1];

compression u0(

		.clk_clk(clk),
		.reset_reset_n(reset),
		.leds_w_export(leds_w_export),
		.sdram_addr(sdram_addr),
		.sdram_ba(sdram_ba),
		.sdram_cas_n(sdram_cas_n),
		.sdram_cke(sdram_cke),
		.sdram_cs_n(sdram_cs_n),
		.sdram_dq(sdram_dq),
		.sdram_dqm(sdram_dqm),
		.sdram_ras_n(sdram_ras_n),
		.sdram_we_n(sdram_we_n),
		.sdram_pll_clk(sdram_clk),
		.line1_1_in_port(Line1_1_IN),
		.line1_1_out_port(Line1_1_out),
		.line1_2_in_port(Line1_2_IN),
		.line1_2_out_port(Line1_2_out),
		.line2_1_in_port(Line2_1_IN),
		.line2_1_out_port(Line2_1_out),
		.line2_2_in_port(Line2_2_IN),
		.line2_2_out_port(Line2_2_out),
		.line3_1_in_port(Line3_1_IN),
		.line3_1_out_port(Line3_1_out),
		.line3_2_in_port(Line3_2_IN),
		.line3_2_out_port(Line3_2_out),
		.line4_1_in_port(Line4_1_IN),
		.line4_1_out_port(Line4_1_out),
		.line4_2_in_port(Line4_2_IN),
		.line4_2_out_port(Line4_2_out),
		.line5_1_in_port(Line5_1_IN),
		.line5_1_out_port(Line5_1_out),
		.line5_2_in_port(Line5_2_IN),
		.line5_2_out_port(Line5_2_out),
		.line6_1_in_port(Line6_1_IN),
		.line6_1_out_port(Line6_1_out),
		.line6_2_in_port(Line6_2_IN),
		.line6_2_out_port(Line6_2_out),
		.line7_1_in_port(Line7_1_IN),
		.line7_1_out_port(Line7_1_out),
		.line7_2_in_port(Line7_2_IN),
		.line7_2_out_port(Line7_2_out),
		.line8_1_in_port(Line8_1_IN),
		.line8_1_out_port(Line8_1_out),
		.line8_2_in_port(Line8_2_IN),
		.line8_2_out_port(Line8_2_out),
		);
			
genvar f;
	generate
	for(f=1; f<65; f=f+1) begin: kForl
		begin
			assign matrix_8[f] = 255; //generating a 8x8 image 255
		end
	end
endgenerate

always @(posedge clk) begin
	Line1_1_IN <= {matrix_8[1], matrix_8[2], matrix_8[3], matrix_8[4]};  //passing 4 byte on each line
	Line1_2_IN <= {matrix_8[5], matrix_8[6], matrix_8[7], matrix_8[8]};
	Line2_1_IN <= {matrix_8[9], matrix_8[10], matrix_8[11], matrix_8[12]};
	Line2_2_IN <= {matrix_8[13], matrix_8[14], matrix_8[15], matrix_8[16]};
	Line3_1_IN <= {matrix_8[17], matrix_8[18], matrix_8[19], matrix_8[20]};
	Line3_2_IN <= {matrix_8[21], matrix_8[22], matrix_8[23], matrix_8[24]};
	Line4_1_IN <= {matrix_8[25], matrix_8[26], matrix_8[27], matrix_8[28]};
	Line4_2_IN <= {matrix_8[29], matrix_8[30], matrix_8[31], matrix_8[32]};
	Line5_1_IN <= {matrix_8[33], matrix_8[34], matrix_8[35], matrix_8[36]};
	Line5_2_IN <= {matrix_8[37], matrix_8[38], matrix_8[39], matrix_8[40]};
	Line6_1_IN <= {matrix_8[41], matrix_8[42], matrix_8[43], matrix_8[44]};
	Line6_2_IN <= {matrix_8[45], matrix_8[46], matrix_8[47], matrix_8[48]};
	Line7_1_IN <= {matrix_8[49], matrix_8[50], matrix_8[51], matrix_8[52]};
	Line7_2_IN <= {matrix_8[53], matrix_8[54], matrix_8[55], matrix_8[56]};
	Line8_1_IN <= {matrix_8[57], matrix_8[58], matrix_8[59], matrix_8[60]};
	Line8_2_IN <= {matrix_8[61], matrix_8[62], matrix_8[63], matrix_8[64]};
end
endmodule
		
		



