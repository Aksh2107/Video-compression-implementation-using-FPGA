-- A DUT entity is used to wrap your design.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.pkg.all;

entity DUT is
  generic ( len : integer := 16);
  port    ( input_vector : in flat_Image_Array(0 to (len-1)); 
			   output_vector: out flat_Image_Array(0 to (2*len-1)));
end entity;

architecture DutWrap of DUT is

	component RLE  is
	  generic ( in_length : integer);
	  port    ( Im_flat_in : in flat_Image_Array(0 to (in_length-1)); 
			      Im_out     : out flat_Image_Array(0 to (2*in_length-1))); -- worst case => Full Length Sequence
	end component RLE;
	
begin

   -- input/output vector element ordering is critical,
   add_instance: RLE 
			generic map ( in_length => len)
			port map    ( Im_flat_in => input_vector,
					        Im_out   => output_vector);

end DutWrap;

