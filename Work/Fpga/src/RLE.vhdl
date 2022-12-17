library ieee;
use ieee.std_logic_1164.all;
library work;
use work.pkg.all;

entity RLE  is
  generic ( in_length  : integer := 16);
  port    ( Im_flat_in : in flat_Image_Array(0 to (in_length-1)); 
		      Im_out     : out flat_Image_Array(0 to (2*in_length-1))); -- worst case => Full Length Sequence
end entity RLE;


architecture Struct of RLE is
	  function run_length_encode (img : flat_Image_Array(0 to (in_length-1))) return flat_Image_Array is
		  variable i : integer;
		  variable j : integer;
		  variable skip : integer;
		  variable accumulator : flat_Image_Array(0 to (2*in_length-1)):=(others=> 0);
		  begin
			  i := 0;
			  j := 0;
			  skip := 0;
			  while(i < in_length) loop
					if(img(i) /= 0) then
						 accumulator(j):=img(i);
						 accumulator(j+1):=skip;
						 j := j+2;
						 skip:= 0;
					else 
						 skip := skip+1;
					end if;
					i := i + 1;
			  end loop;
		  return accumulator;
	  end run_length_encode;
begin
  -- component instances
    Im_out <= run_length_encode(Im_flat_in);
end Struct;