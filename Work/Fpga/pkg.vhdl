library ieee;
use ieee.std_logic_1164.all;
package pkg is
--    type	ImageType	       is array (0 to 31) of real;
--    type ImagesType         is array (0 to 31) of ImageType;

	constant image_width   :integer := 480;
   	constant image_height   :integer := 640;

    type flat_Image_Array   is array (integer range <>) of integer;
    type image_size is array (0 to 7, 0 to 7) of integer range 0 to 255;
	 type Image_vector is array(0 to 7, 0 to 7) of std_logic_vector(7 downto 0);
--	 function run_length_encode (img : flat_Image_Array(0 to 15)) return flat_Image_Array;
end pkg;


--package body pkg is
--    -- calcluate the RLE
--        function run_length_encode (img : flat_Image_Array(0 to 15)) return flat_Image_Array is
--        variable i : integer;
--        variable j : integer;
--        variable skip : integer;
--        variable accumulator : flat_Image_Array(0 to 15):=(others=> 0);
--        begin
--        i := 0;
--        j := 0;
--        skip := 0;
--        while(i < 16) loop
--            if(img(i) /= 0) then
--                accumulator(j):=img(j);
--                accumulator(j+1):=skip;
--                j := j+1;
--                skip:= 0;
--            else 
--                skip := skip+1;
--            end if;
--            i := i + 1;
--        end loop;
--        return accumulator;
--        end run_length_encode;
--
--end pkg;