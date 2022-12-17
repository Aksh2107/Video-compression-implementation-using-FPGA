library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.pkg.all;

entity Testbench_zigzag is
end entity;
architecture Behave of Testbench_zigzag is

  ----------------------------------------------------------------
  --  edit the following lines to set the number of i/o's of your
  --  DUT.
  ----------------------------------------------------------------
  constant number_of_inputs : integer := 3;  -- # output bits from your design.

  constant number_of_outputs : integer := 9;  -- # output bits from your design.
  ----------------------------------------------------------------
  ----------------------------------------------------------------

  -- Note that you will have to wrap your design into the DUT
  -- as indicated in class.
  component DUT_zigzag is
  port    ( input_vector : in ImagesType; 
			   output_vector: out zigzag_Image_Array(0 to (3*3)-1));
  end component;


  signal input_vector  : ImagesType;
  signal output_vector : zigzag_Image_Array(0 to number_of_outputs-1);

begin
  process 
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "/media/haddi/HaDdi_ubuntu/SEM4/STUDY/Vlsi_Lab/Project/simmu_git/MPEG-4-Video-compression/VHDL_CODE/code/TRACEFILE_1.txt";
    FILE OUTFILE: text  open write_mode is "/media/haddi/HaDdi_ubuntu/SEM4/STUDY/Vlsi_Lab/Project/simmu_git/MPEG-4-Video-compression/VHDL_CODE/code/OUTPUTS_1.txt";

    -- bit-vectors are read from the file.
    variable input_vector_var: ImagesType;
    variable output_vector_var: zigzag_Image_Array (0 to number_of_outputs-1);

    -- for comparison of output with expected-output
    variable output_comp_var: zigzag_Image_Array (0 to number_of_outputs-1);

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
				  for kk in 0 to (number_of_inputs-1) loop
							readline (INFILE, INPUT_LINE);
							for j in 0 to (number_of_inputs-1) loop
								read(INPUT_LINE,input_vector_var(kk)(j));
							end loop;
					 end loop; 

				readLine (INFILE, OUTPUT_LINE);

				  for kk in 0 to (number_of_outputs-1) loop
						 read(OUTPUT_LINE,output_vector_var(kk));
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
							for j in 0 to (number_of_inputs-1) loop
							write(OUTPUT_LINE, input_vector_var(kk)(j));
							end loop;
						writeline(OUTFILE, OUTPUT_LINE);
					 end loop; 


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

  dut_instance: DUT_zigzag 
     	port map    ( input_vector => input_vector, output_vector => output_vector);

end Behave;
