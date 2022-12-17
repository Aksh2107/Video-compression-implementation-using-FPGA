-- A DUT entity is used to wrap your design.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.pkg.all;

entity DUT_zigzag is
  port    ( input_vector : in ImagesType; 
			   output_vector: out zigzag_Image_Array(0 to (3*3)-1));
end entity;

architecture DutWrap of DUT_zigzag is

component zigzag  is
  port    ( Im_in : in ImagesType; 
		      Im_flat_zigzag_out     : out zigzag_Image_Array(0 to (3*3)-1)); 
end component zigzag;
	
begin

   -- input/output vector element ordering is critical,
   add_instance: zigzag 
			port map    ( Im_in => input_vector,
					        Im_flat_zigzag_out   => output_vector);

end DutWrap;

