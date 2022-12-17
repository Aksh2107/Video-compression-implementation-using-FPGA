library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all; --pkg file for user defined data type

entity image_read is

port(
	clk: in std_logic;
	output_data: in integer;
	image_vector_out_8_8: out Image_vector --2-d array from pkh.vhd
	);
				
end entity image_read;

architecture arch of image_read is 

	signal image_value: Image_vector;
	
	--signal yoo_data: integer;
begin
	process(clk)
		variable row: integer:=0;
		variable column: integer:=0;
	begin
		if rising_edge(clk) then
					
			image_value(row,column) <= std_logic_vector(to_unsigned(output_data,8));   -- generating 8x8 matrix 
			column := column+1;
			if column=8 then
				column:=0;    
				row :=row+1; --increase row till 8				
			end if ;
			if row=8 then --row=coulnm then we have genertaed the image
				row:=0;
				column:=0;
				image_vector_out_8_8 <= image_value; -- after 64 clock cycle this image will be created for further calculation
				
			end if ;									
		end if ;
		end process;


end architecture ; -- arch


