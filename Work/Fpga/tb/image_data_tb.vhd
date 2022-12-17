library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
library work;
use work.pkg.all;

entity image_data_tb is

end entity ;

architecture image_read_arc of image_data_tb is


	component image_read is
		port(
			clk: in std_logic;
			output_data: in integer;
			image_vector_out_8_8: out Image_vector   --2 -d array os std_vector to store image
			);
	end component;

	constant image_file :string  := "cheeta.txt";  --text file that need to be read
   
   	constant C_CLK       :time    := 10 ns;
   	signal clk: std_logic;
   	signal output_data: integer; 
   	signal image_vector_8_8: Image_vector;
   	--type image_size is array (0 to image_width-1, 0 to image_height-1) of integer range 0 to 255;
   	

   	
begin

anything : image_read port map(clk, output_data,image_vector_8_8);

ClockGenerator: process
begin
   clk <= '0' after C_CLK, '1' after 2*C_CLK;
   wait for 2*C_CLK;
end process;

read_process: process

			variable file_status: file_open_status;
			variable file_line: line;
			variable image_data     :integer;
			variable open_file: boolean;
			file file_pointer: text;
	begin

		file_open(file_status,file_pointer,image_file,READ_MODE); --reading the text file and updating
	    while not endfile(file_pointer) loop
	        readline(file_pointer, file_line); 
	        read(file_line, image_data);
	        output_data <= image_data;    -- each cycle this will be passed to output_data
	        wait until rising_edge(clk);
    	end loop;
	    file_close(file_pointer);
	    wait;
	end process;
end architecture ; -- image_read_arc