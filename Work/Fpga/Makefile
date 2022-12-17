# Makefile for creating, building and testing Nios II software projects for a given hardware platform
# Keep this file in your quartus project directory.

# IMP : TODO : set following path to Quartus installation directory.
QUARTUS18:=$(HOME)/intelFPGA_lite/18.1

# You can specify this from command-line everytime. Better to change the name here.
SOPCINFO:=compression.sopcinfo

SOFTWARE_PROJECT_NAME:=my_software
NIOS_CMD_SHELL_SCRIPT:=$(QUARTUS18)/nios2eds/nios2_command_shell.sh
VSIM_BIN_DIR__:=$(QUARTUS18)/modelsim_ase/linuxaloem
QSYS_SYSTEM_NAME__:=$(shell basename $(SOPCINFO) .sopcinfo)
QUARTUS_PROJECT_DIR__:=$(shell pwd)

all: build

new-project-and-bsp:
	# 0. Create software app and bsp directories
	ls $(SOPCINFO)
	$(NIOS_CMD_SHELL_SCRIPT) nios2-swexample-create --sopc-file=$(SOPCINFO) --type=hello_world_small --elf-name=$(SOFTWARE_PROJECT_NAME).elf --app-dir=software/$(SOFTWARE_PROJECT_NAME) --bsp-dir=software/$(SOFTWARE_PROJECT_NAME)_bsp
	# 1. create contenets of bsp project
	cd software/$(SOFTWARE_PROJECT_NAME)_bsp && $(NIOS_CMD_SHELL_SCRIPT) ./create-this-bsp --cpu-name cpu --no-make
	# 2. create default application project
	cd software/$(SOFTWARE_PROJECT_NAME) && rm -f Makefile
	cd software/$(SOFTWARE_PROJECT_NAME) && $(NIOS_CMD_SHELL_SCRIPT) ./create-this-app --no-make

# Auto-update bsp when .sopcinfo file has changed.
software/$(SOFTWARE_PROJECT_NAME)_bsp/Makefile: $(SOPCINFO)
	cd software/$(SOFTWARE_PROJECT_NAME)_bsp && $(NIOS_CMD_SHELL_SCRIPT) ./create-this-bsp --cpu-name cpu --no-make

build: software/$(SOFTWARE_PROJECT_NAME)_bsp/Makefile
	# 1. build bsp project
	cd software/$(SOFTWARE_PROJECT_NAME)_bsp && $(NIOS_CMD_SHELL_SCRIPT) make
	# 2. build application project
	cd software/$(SOFTWARE_PROJECT_NAME) && $(NIOS_CMD_SHELL_SCRIPT) make

clean:
	# 2. build application project
	cd software/$(SOFTWARE_PROJECT_NAME) && $(NIOS_CMD_SHELL_SCRIPT) make clean
	# 1. clean bsp project
	cd software/$(SOFTWARE_PROJECT_NAME)_bsp && $(NIOS_CMD_SHELL_SCRIPT) make clean

download-elf:
	cd software/$(SOFTWARE_PROJECT_NAME) && $(NIOS_CMD_SHELL_SCRIPT) make download-elf
	@echo "Starting nios2-terminal."
	@echo "Make sure to press ctrl+c, and exit from nios2-terminal. Else, quartus programmer will fail."
	cd software/$(SOFTWARE_PROJECT_NAME) && $(NIOS_CMD_SHELL_SCRIPT) nios2-terminal

simulate: software/$(SOFTWARE_PROJECT_NAME)_bsp/Makefile
	@echo "Staring Altera ModelSim"
	@echo "At ModelSim/vsim prompt, type:"
	@echo " run 200000000"
	cd software/$(SOFTWARE_PROJECT_NAME) && $(NIOS_CMD_SHELL_SCRIPT) make sim SPD=$(QUARTUS_PROJECT_DIR__)/$(QSYS_SYSTEM_NAME__)_tb.spd ELF=$(QUARTUS_PROJECT_DIR__)/software/$(SOFTWARE_PROJECT_NAME)/$(SOFTWARE_PROJECT_NAME).elf ENABLE_VSIM_GUI=1 VSIM_DIR=$(VSIM_BIN_DIR__)

help:
	@echo ""
	@echo "##############################################"
	@echo "# This is a makefile for creating, building  #"
	@echo "#  and testing Nios II software project      #"
	@echo "#  for a given hardware platform.            #"
	@echo "##############################################"
	@echo ""
	@echo "Keep this file inside your quarus project directory."
	@echo ""
	@echo "1. To create new software project and BSP\","
	@echo "   (Similar to \"New -> Nios II Application and BSP\"),"
	@echo "   run: \"make SOPCINFO=your_sopc_info_file.sopcinfo\" new-project-and-bsp"
	@echo ""
	@echo "2. To build the software project"
	@echo "   run: \"make build SOPCINFO=your_sopc_info_file.sopcinfo\""
	@echo ""
	@echo "3. To clean the software project"
	@echo "   run: \"make clean\""
	@echo ""
	@echo "4. To download the software to the DE0-Nano board,"
	@echo "   and to see the nios processor output"
	@echo "   (Similar to \"Run as -> Nios II Hardware\")"
	@echo "   run: \"make download-elf\""
	@echo ""
	@echo "5. To simulate the hardware platform and nios,"
	@echo "   software with modelsim"
	@echo "   (Similar to \"Run as -> Nios II ModelSim\")"
	@echo "   run: \"make simulate\""
	@echo "   At ModelSim/vsim prompt, type: \"run 200000000\""
	@echo ""
	@echo "Note : The software main file is software/$(SOFTWARE_PROJECT_NAME)/hello_world_small.c"
	@echo ""

