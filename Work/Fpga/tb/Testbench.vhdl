library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.pkg.all;

entity Testbench is
end entity;
architecture Behave of Testbench is

  ----------------------------------------------------------------
  --  edit the following lines to set the number of i/o's of your
  --  DUT.
  ----------------------------------------------------------------
  constant number_of_inputs  : integer := 16;                  -- # input bits to your design.
  constant number_of_outputs : integer := 2*number_of_inputs;  -- # output bits from your design.
  ----------------------------------------------------------------
  ----------------------------------------------------------------

  -- Note that you will have to wrap your design into the DUT
  -- as indicated in class.
  component DUT is
	generic ( len : integer);
   port    ( input_vector: in flat_Image_Array(0 to len-1);    
       	    output_vector: out flat_Image_Array(0 to (2*len-1)));
  end component;


  signal input_vector  : flat_Image_Array(0 to number_of_inputs-1);
  signal output_vector : flat_Image_Array(0 to number_of_outputs-1);

begin
  process 
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "/media/haddi/HaDdi_ubuntu/SEM4/STUDY/Vlsi_Lab/Project/simmu_git/MPEG-4-Video-compression/VHDL_CODE/code/TRACEFILE.txt";
    FILE OUTFILE: text  open write_mode is "/media/haddi/HaDdi_ubuntu/SEM4/STUDY/Vlsi_Lab/Project/simmu_git/MPEG-4-Video-compression/VHDL_CODE/code/OUTPUTS.txt";

    -- bit-vectors are read from the file.
    variable input_vector_var: flat_Image_Array (0 to number_of_inputs-1);
    variable output_vector_var: flat_Image_Array (0 to number_of_outputs-1);

    -- for comparison of output with expected-output
    variable output_comp_var: flat_Image_Array (0 to number_of_outputs-1);

    -- for read/write.
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;

    
  begin
    while not endfile(INFILE) loop 
	  -- will read a new line every 5ns, apply input,
	  -- wait for 1 ns for circuit to settle.
	  -- read output.


      LINE_COUNT := LINE_COUNT + 1;


			  -- read input at current time.
			  readLine (INFILE, INPUT_LINE);
				  for kk in 0 to (number_of_inputs-1) loop
						 read(INPUT_LINE,input_vector_var(kk));
					 end loop; 

				  for kk in 0 to (number_of_outputs-1) loop
						 read(INPUT_LINE,output_vector_var(kk));
					 end loop; 


			
			  -- apply input.
					 input_vector <= input_vector_var;

			  -- wait for the circuit to settle 
			  wait for 20 ns;

			  -- check output.

					  if (output_vector_var  /= output_vector) then

				--       write(OUTPUT_LINE,to_string("ERROR: line "));
						 write(OUTPUT_LINE, LINE_COUNT);
						 writeline(OUTFILE, OUTPUT_LINE);
						 err_flag := true;
						 
					 end if;
				  for kk in 0 to (number_of_inputs-1) loop
						 write(OUTPUT_LINE, input_vector(kk));
					 end loop; 
					 
				  --  write(OUTPUT_LINE, to_string(" "));
				  for kk in 0 to (number_of_outputs-1) loop
						write(OUTPUT_LINE, output_vector(kk));
					 end loop; 

					 writeline(OUTFILE, OUTPUT_LINE);

			  -- advance time by 4 ns.
			  wait for 4 ns;

    end loop;

			 assert (err_flag) report "SUCCESS, all tests passed." severity note;
			 assert (not err_flag) report "FAILURE, some tests failed." severity error;

			 wait;
  end process;

  dut_instance: DUT 
		generic map ( len => number_of_inputs)
     	port map    ( input_vector => input_vector, output_vector => output_vector);

end Behave;
