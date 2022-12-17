library ieee;
use ieee.std_logic_1164.all;
library work;
use work.pkg.all;

entity zigzag  is
  port    ( Im_in : in ImagesType; 
		      Im_flat_zigzag_out     : out zigzag_Image_Array(0 to (3*3)-1)); 
end entity zigzag;


architecture arch of zigzag is

	
	  function zig_zag (img : ImagesType) return zigzag_Image_Array is
	  
		  variable h : integer := 0;
		  variable v : integer := 0;
		  variable i : integer;

		  variable hmin : integer := 0;
		  variable vmin : integer := 0;

		  variable hmax : integer := 3;
		  variable vmax : integer := 3;

		  variable output : zigzag_Image_Array(0 to (hmax*vmax)-1):=(others=> 0);
		  begin
			  i := 0;
			  while ((v<vmax) and (h<hmax)) loop
			  
				if(((h+v) mod 2)= 0) then
				
					if(v=vmin) then
						output(i) := img(v)(h);
						if(h = hmax) then
							v:=v+1;
						else
							h:=h+1;
						end if;
						i:=i+1;
						
					elsif((h = hmax-1) and (v<vmax)) then
						output(i) := img(v)(h);
						v:=v+1;
						i:=i+1;
					
					elsif((v>vmin) and (h< hmax-1)) then
						output(i) := img(v)(h);
						v:=v-1;
						h:=h+1;
						i:=i+1;
					end if;
					
				else 
				
					if((v = vmax-1) and (h<= hmax-1)) then
						output(i) := img(v)(h);
						h:=h+1;
						i:=i+1;
						
					elsif(h = hmin) then
						output(i) := img(v)(h);
						if(v= vmax-1) then
							h:=h+1;
						else
							v:=v+1;
						end if;
						i:=i+1;
					
					elsif((v<vmax-1) and (h>hmin)) then
						output(i) := img(v)(h);
						v:=v+1;
						h:=h-1;
						i:=i+1;						
					end if;
				end if;
			  
			  if((v=vmax-1) and (h=hmax-1)) then
				output(i) := img(v)(h);
				exit;
			  end if;
			  
			  end loop;
		  return output;
	  end zig_zag;
begin
  -- component instances
    Im_flat_zigzag_out <= zig_zag(Im_in);
end arch;