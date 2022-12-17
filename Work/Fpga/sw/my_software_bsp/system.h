/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'compression'
 * SOPC Builder design path: ../../compression.sopcinfo
 *
 * Generated: Fri May 03 11:40:32 IST 2019
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x02080820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1a
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x01000020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x1a
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x01000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x02080820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x1a
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x01000020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x1a
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x01000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_NIOS2_GEN2
#define __ALTPLL


/*
 * LIne2_2 configuration
 *
 */

#define ALT_MODULE_CLASS_LIne2_2 altera_avalon_pio
#define LINE2_2_BASE 0x2081180
#define LINE2_2_BIT_CLEARING_EDGE_REGISTER 0
#define LINE2_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE2_2_CAPTURE 0
#define LINE2_2_DATA_WIDTH 32
#define LINE2_2_DO_TEST_BENCH_WIRING 0
#define LINE2_2_DRIVEN_SIM_VALUE 0
#define LINE2_2_EDGE_TYPE "NONE"
#define LINE2_2_FREQ 50000000
#define LINE2_2_HAS_IN 1
#define LINE2_2_HAS_OUT 1
#define LINE2_2_HAS_TRI 0
#define LINE2_2_IRQ -1
#define LINE2_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE2_2_IRQ_TYPE "NONE"
#define LINE2_2_NAME "/dev/LIne2_2"
#define LINE2_2_RESET_VALUE 0
#define LINE2_2_SPAN 16
#define LINE2_2_TYPE "altera_avalon_pio"


/*
 * Line1_1 configuration
 *
 */

#define ALT_MODULE_CLASS_Line1_1 altera_avalon_pio
#define LINE1_1_BASE 0x20811f0
#define LINE1_1_BIT_CLEARING_EDGE_REGISTER 0
#define LINE1_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE1_1_CAPTURE 0
#define LINE1_1_DATA_WIDTH 32
#define LINE1_1_DO_TEST_BENCH_WIRING 0
#define LINE1_1_DRIVEN_SIM_VALUE 0
#define LINE1_1_EDGE_TYPE "NONE"
#define LINE1_1_FREQ 50000000
#define LINE1_1_HAS_IN 1
#define LINE1_1_HAS_OUT 1
#define LINE1_1_HAS_TRI 0
#define LINE1_1_IRQ -1
#define LINE1_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE1_1_IRQ_TYPE "NONE"
#define LINE1_1_NAME "/dev/Line1_1"
#define LINE1_1_RESET_VALUE 0
#define LINE1_1_SPAN 16
#define LINE1_1_TYPE "altera_avalon_pio"


/*
 * Line1_2 configuration
 *
 */

#define ALT_MODULE_CLASS_Line1_2 altera_avalon_pio
#define LINE1_2_BASE 0x20811e0
#define LINE1_2_BIT_CLEARING_EDGE_REGISTER 0
#define LINE1_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE1_2_CAPTURE 0
#define LINE1_2_DATA_WIDTH 32
#define LINE1_2_DO_TEST_BENCH_WIRING 0
#define LINE1_2_DRIVEN_SIM_VALUE 0
#define LINE1_2_EDGE_TYPE "NONE"
#define LINE1_2_FREQ 50000000
#define LINE1_2_HAS_IN 1
#define LINE1_2_HAS_OUT 1
#define LINE1_2_HAS_TRI 0
#define LINE1_2_IRQ -1
#define LINE1_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE1_2_IRQ_TYPE "NONE"
#define LINE1_2_NAME "/dev/Line1_2"
#define LINE1_2_RESET_VALUE 0
#define LINE1_2_SPAN 16
#define LINE1_2_TYPE "altera_avalon_pio"


/*
 * Line2_1 configuration
 *
 */

#define ALT_MODULE_CLASS_Line2_1 altera_avalon_pio
#define LINE2_1_BASE 0x2081190
#define LINE2_1_BIT_CLEARING_EDGE_REGISTER 0
#define LINE2_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE2_1_CAPTURE 0
#define LINE2_1_DATA_WIDTH 32
#define LINE2_1_DO_TEST_BENCH_WIRING 0
#define LINE2_1_DRIVEN_SIM_VALUE 0
#define LINE2_1_EDGE_TYPE "NONE"
#define LINE2_1_FREQ 50000000
#define LINE2_1_HAS_IN 1
#define LINE2_1_HAS_OUT 1
#define LINE2_1_HAS_TRI 0
#define LINE2_1_IRQ -1
#define LINE2_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE2_1_IRQ_TYPE "NONE"
#define LINE2_1_NAME "/dev/Line2_1"
#define LINE2_1_RESET_VALUE 0
#define LINE2_1_SPAN 16
#define LINE2_1_TYPE "altera_avalon_pio"


/*
 * Line3_1 configuration
 *
 */

#define ALT_MODULE_CLASS_Line3_1 altera_avalon_pio
#define LINE3_1_BASE 0x2081170
#define LINE3_1_BIT_CLEARING_EDGE_REGISTER 0
#define LINE3_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE3_1_CAPTURE 0
#define LINE3_1_DATA_WIDTH 32
#define LINE3_1_DO_TEST_BENCH_WIRING 0
#define LINE3_1_DRIVEN_SIM_VALUE 0
#define LINE3_1_EDGE_TYPE "NONE"
#define LINE3_1_FREQ 50000000
#define LINE3_1_HAS_IN 1
#define LINE3_1_HAS_OUT 1
#define LINE3_1_HAS_TRI 0
#define LINE3_1_IRQ -1
#define LINE3_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE3_1_IRQ_TYPE "NONE"
#define LINE3_1_NAME "/dev/Line3_1"
#define LINE3_1_RESET_VALUE 0
#define LINE3_1_SPAN 16
#define LINE3_1_TYPE "altera_avalon_pio"


/*
 * Line3_2 configuration
 *
 */

#define ALT_MODULE_CLASS_Line3_2 altera_avalon_pio
#define LINE3_2_BASE 0x2081160
#define LINE3_2_BIT_CLEARING_EDGE_REGISTER 0
#define LINE3_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE3_2_CAPTURE 0
#define LINE3_2_DATA_WIDTH 32
#define LINE3_2_DO_TEST_BENCH_WIRING 0
#define LINE3_2_DRIVEN_SIM_VALUE 0
#define LINE3_2_EDGE_TYPE "NONE"
#define LINE3_2_FREQ 50000000
#define LINE3_2_HAS_IN 1
#define LINE3_2_HAS_OUT 1
#define LINE3_2_HAS_TRI 0
#define LINE3_2_IRQ -1
#define LINE3_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE3_2_IRQ_TYPE "NONE"
#define LINE3_2_NAME "/dev/Line3_2"
#define LINE3_2_RESET_VALUE 0
#define LINE3_2_SPAN 16
#define LINE3_2_TYPE "altera_avalon_pio"


/*
 * Line4_1 configuration
 *
 */

#define ALT_MODULE_CLASS_Line4_1 altera_avalon_pio
#define LINE4_1_BASE 0x2081150
#define LINE4_1_BIT_CLEARING_EDGE_REGISTER 0
#define LINE4_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE4_1_CAPTURE 0
#define LINE4_1_DATA_WIDTH 32
#define LINE4_1_DO_TEST_BENCH_WIRING 0
#define LINE4_1_DRIVEN_SIM_VALUE 0
#define LINE4_1_EDGE_TYPE "NONE"
#define LINE4_1_FREQ 50000000
#define LINE4_1_HAS_IN 1
#define LINE4_1_HAS_OUT 1
#define LINE4_1_HAS_TRI 0
#define LINE4_1_IRQ -1
#define LINE4_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE4_1_IRQ_TYPE "NONE"
#define LINE4_1_NAME "/dev/Line4_1"
#define LINE4_1_RESET_VALUE 0
#define LINE4_1_SPAN 16
#define LINE4_1_TYPE "altera_avalon_pio"


/*
 * Line4_2 configuration
 *
 */

#define ALT_MODULE_CLASS_Line4_2 altera_avalon_pio
#define LINE4_2_BASE 0x2081140
#define LINE4_2_BIT_CLEARING_EDGE_REGISTER 0
#define LINE4_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE4_2_CAPTURE 0
#define LINE4_2_DATA_WIDTH 32
#define LINE4_2_DO_TEST_BENCH_WIRING 0
#define LINE4_2_DRIVEN_SIM_VALUE 0
#define LINE4_2_EDGE_TYPE "NONE"
#define LINE4_2_FREQ 50000000
#define LINE4_2_HAS_IN 1
#define LINE4_2_HAS_OUT 1
#define LINE4_2_HAS_TRI 0
#define LINE4_2_IRQ -1
#define LINE4_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE4_2_IRQ_TYPE "NONE"
#define LINE4_2_NAME "/dev/Line4_2"
#define LINE4_2_RESET_VALUE 0
#define LINE4_2_SPAN 16
#define LINE4_2_TYPE "altera_avalon_pio"


/*
 * Line5_1 configuration
 *
 */

#define ALT_MODULE_CLASS_Line5_1 altera_avalon_pio
#define LINE5_1_BASE 0x2081130
#define LINE5_1_BIT_CLEARING_EDGE_REGISTER 0
#define LINE5_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE5_1_CAPTURE 0
#define LINE5_1_DATA_WIDTH 32
#define LINE5_1_DO_TEST_BENCH_WIRING 0
#define LINE5_1_DRIVEN_SIM_VALUE 0
#define LINE5_1_EDGE_TYPE "NONE"
#define LINE5_1_FREQ 50000000
#define LINE5_1_HAS_IN 1
#define LINE5_1_HAS_OUT 1
#define LINE5_1_HAS_TRI 0
#define LINE5_1_IRQ -1
#define LINE5_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE5_1_IRQ_TYPE "NONE"
#define LINE5_1_NAME "/dev/Line5_1"
#define LINE5_1_RESET_VALUE 0
#define LINE5_1_SPAN 16
#define LINE5_1_TYPE "altera_avalon_pio"


/*
 * Line5_2 configuration
 *
 */

#define ALT_MODULE_CLASS_Line5_2 altera_avalon_pio
#define LINE5_2_BASE 0x2081120
#define LINE5_2_BIT_CLEARING_EDGE_REGISTER 0
#define LINE5_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE5_2_CAPTURE 0
#define LINE5_2_DATA_WIDTH 32
#define LINE5_2_DO_TEST_BENCH_WIRING 0
#define LINE5_2_DRIVEN_SIM_VALUE 0
#define LINE5_2_EDGE_TYPE "NONE"
#define LINE5_2_FREQ 50000000
#define LINE5_2_HAS_IN 1
#define LINE5_2_HAS_OUT 1
#define LINE5_2_HAS_TRI 0
#define LINE5_2_IRQ -1
#define LINE5_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE5_2_IRQ_TYPE "NONE"
#define LINE5_2_NAME "/dev/Line5_2"
#define LINE5_2_RESET_VALUE 0
#define LINE5_2_SPAN 16
#define LINE5_2_TYPE "altera_avalon_pio"


/*
 * Line6_1 configuration
 *
 */

#define ALT_MODULE_CLASS_Line6_1 altera_avalon_pio
#define LINE6_1_BASE 0x2081110
#define LINE6_1_BIT_CLEARING_EDGE_REGISTER 0
#define LINE6_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE6_1_CAPTURE 0
#define LINE6_1_DATA_WIDTH 32
#define LINE6_1_DO_TEST_BENCH_WIRING 0
#define LINE6_1_DRIVEN_SIM_VALUE 0
#define LINE6_1_EDGE_TYPE "NONE"
#define LINE6_1_FREQ 50000000
#define LINE6_1_HAS_IN 1
#define LINE6_1_HAS_OUT 1
#define LINE6_1_HAS_TRI 0
#define LINE6_1_IRQ -1
#define LINE6_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE6_1_IRQ_TYPE "NONE"
#define LINE6_1_NAME "/dev/Line6_1"
#define LINE6_1_RESET_VALUE 0
#define LINE6_1_SPAN 16
#define LINE6_1_TYPE "altera_avalon_pio"


/*
 * Line6_2 configuration
 *
 */

#define ALT_MODULE_CLASS_Line6_2 altera_avalon_pio
#define LINE6_2_BASE 0x2081100
#define LINE6_2_BIT_CLEARING_EDGE_REGISTER 0
#define LINE6_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE6_2_CAPTURE 0
#define LINE6_2_DATA_WIDTH 32
#define LINE6_2_DO_TEST_BENCH_WIRING 0
#define LINE6_2_DRIVEN_SIM_VALUE 0
#define LINE6_2_EDGE_TYPE "NONE"
#define LINE6_2_FREQ 50000000
#define LINE6_2_HAS_IN 1
#define LINE6_2_HAS_OUT 1
#define LINE6_2_HAS_TRI 0
#define LINE6_2_IRQ -1
#define LINE6_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE6_2_IRQ_TYPE "NONE"
#define LINE6_2_NAME "/dev/Line6_2"
#define LINE6_2_RESET_VALUE 0
#define LINE6_2_SPAN 16
#define LINE6_2_TYPE "altera_avalon_pio"


/*
 * Line7_1 configuration
 *
 */

#define ALT_MODULE_CLASS_Line7_1 altera_avalon_pio
#define LINE7_1_BASE 0x20811a0
#define LINE7_1_BIT_CLEARING_EDGE_REGISTER 0
#define LINE7_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE7_1_CAPTURE 0
#define LINE7_1_DATA_WIDTH 32
#define LINE7_1_DO_TEST_BENCH_WIRING 0
#define LINE7_1_DRIVEN_SIM_VALUE 0
#define LINE7_1_EDGE_TYPE "NONE"
#define LINE7_1_FREQ 50000000
#define LINE7_1_HAS_IN 1
#define LINE7_1_HAS_OUT 1
#define LINE7_1_HAS_TRI 0
#define LINE7_1_IRQ -1
#define LINE7_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE7_1_IRQ_TYPE "NONE"
#define LINE7_1_NAME "/dev/Line7_1"
#define LINE7_1_RESET_VALUE 0
#define LINE7_1_SPAN 16
#define LINE7_1_TYPE "altera_avalon_pio"


/*
 * Line7_2 configuration
 *
 */

#define ALT_MODULE_CLASS_Line7_2 altera_avalon_pio
#define LINE7_2_BASE 0x20811b0
#define LINE7_2_BIT_CLEARING_EDGE_REGISTER 0
#define LINE7_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE7_2_CAPTURE 0
#define LINE7_2_DATA_WIDTH 32
#define LINE7_2_DO_TEST_BENCH_WIRING 0
#define LINE7_2_DRIVEN_SIM_VALUE 0
#define LINE7_2_EDGE_TYPE "NONE"
#define LINE7_2_FREQ 50000000
#define LINE7_2_HAS_IN 1
#define LINE7_2_HAS_OUT 1
#define LINE7_2_HAS_TRI 0
#define LINE7_2_IRQ -1
#define LINE7_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE7_2_IRQ_TYPE "NONE"
#define LINE7_2_NAME "/dev/Line7_2"
#define LINE7_2_RESET_VALUE 0
#define LINE7_2_SPAN 16
#define LINE7_2_TYPE "altera_avalon_pio"


/*
 * Line8_1 configuration
 *
 */

#define ALT_MODULE_CLASS_Line8_1 altera_avalon_pio
#define LINE8_1_BASE 0x20811c0
#define LINE8_1_BIT_CLEARING_EDGE_REGISTER 0
#define LINE8_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE8_1_CAPTURE 0
#define LINE8_1_DATA_WIDTH 32
#define LINE8_1_DO_TEST_BENCH_WIRING 0
#define LINE8_1_DRIVEN_SIM_VALUE 0
#define LINE8_1_EDGE_TYPE "NONE"
#define LINE8_1_FREQ 50000000
#define LINE8_1_HAS_IN 1
#define LINE8_1_HAS_OUT 1
#define LINE8_1_HAS_TRI 0
#define LINE8_1_IRQ -1
#define LINE8_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE8_1_IRQ_TYPE "NONE"
#define LINE8_1_NAME "/dev/Line8_1"
#define LINE8_1_RESET_VALUE 0
#define LINE8_1_SPAN 16
#define LINE8_1_TYPE "altera_avalon_pio"


/*
 * Line8_2 configuration
 *
 */

#define ALT_MODULE_CLASS_Line8_2 altera_avalon_pio
#define LINE8_2_BASE 0x20811d0
#define LINE8_2_BIT_CLEARING_EDGE_REGISTER 0
#define LINE8_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LINE8_2_CAPTURE 0
#define LINE8_2_DATA_WIDTH 32
#define LINE8_2_DO_TEST_BENCH_WIRING 0
#define LINE8_2_DRIVEN_SIM_VALUE 0
#define LINE8_2_EDGE_TYPE "NONE"
#define LINE8_2_FREQ 50000000
#define LINE8_2_HAS_IN 1
#define LINE8_2_HAS_OUT 1
#define LINE8_2_HAS_TRI 0
#define LINE8_2_IRQ -1
#define LINE8_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LINE8_2_IRQ_TYPE "NONE"
#define LINE8_2_NAME "/dev/Line8_2"
#define LINE8_2_RESET_VALUE 0
#define LINE8_2_SPAN 16
#define LINE8_2_TYPE "altera_avalon_pio"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV GX"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x2081238
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x2081238
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x2081238
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "compression"


/*
 * altpll_0 configuration
 *
 */

#define ALTPLL_0_BASE 0x2081210
#define ALTPLL_0_IRQ -1
#define ALTPLL_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ALTPLL_0_NAME "/dev/altpll_0"
#define ALTPLL_0_SPAN 16
#define ALTPLL_0_TYPE "altpll"
#define ALT_MODULE_CLASS_altpll_0 altpll


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 4
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x2081238
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * leds configuration
 *
 */

#define ALT_MODULE_CLASS_leds altera_avalon_pio
#define LEDS_BASE 0x2081200
#define LEDS_BIT_CLEARING_EDGE_REGISTER 0
#define LEDS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDS_CAPTURE 0
#define LEDS_DATA_WIDTH 8
#define LEDS_DO_TEST_BENCH_WIRING 0
#define LEDS_DRIVEN_SIM_VALUE 0
#define LEDS_EDGE_TYPE "NONE"
#define LEDS_FREQ 50000000
#define LEDS_HAS_IN 0
#define LEDS_HAS_OUT 1
#define LEDS_HAS_TRI 0
#define LEDS_IRQ -1
#define LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDS_IRQ_TYPE "NONE"
#define LEDS_NAME "/dev/leds"
#define LEDS_RESET_VALUE 0
#define LEDS_SPAN 16
#define LEDS_TYPE "altera_avalon_pio"


/*
 * onchip_memory2_0 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2_0 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_0_BASE 0x2040000
#define ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_0_DUAL_PORT 0
#define ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE "compression_onchip_memory2_0"
#define ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_0_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_0_IRQ -1
#define ONCHIP_MEMORY2_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_0_NAME "/dev/onchip_memory2_0"
#define ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_0_SIZE_VALUE 204800
#define ONCHIP_MEMORY2_0_SPAN 204800
#define ONCHIP_MEMORY2_0_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_0_WRITABLE 1


/*
 * sdram_controller configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_controller altera_avalon_new_sdram_controller
#define SDRAM_CONTROLLER_BASE 0x1000000
#define SDRAM_CONTROLLER_CAS_LATENCY 3
#define SDRAM_CONTROLLER_CONTENTS_INFO
#define SDRAM_CONTROLLER_INIT_NOP_DELAY 0.0
#define SDRAM_CONTROLLER_INIT_REFRESH_COMMANDS 2
#define SDRAM_CONTROLLER_IRQ -1
#define SDRAM_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_CONTROLLER_IS_INITIALIZED 1
#define SDRAM_CONTROLLER_NAME "/dev/sdram_controller"
#define SDRAM_CONTROLLER_POWERUP_DELAY 100.0
#define SDRAM_CONTROLLER_REFRESH_PERIOD 15.625
#define SDRAM_CONTROLLER_REGISTER_DATA_IN 1
#define SDRAM_CONTROLLER_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_CONTROLLER_SDRAM_BANK_WIDTH 2
#define SDRAM_CONTROLLER_SDRAM_COL_WIDTH 8
#define SDRAM_CONTROLLER_SDRAM_DATA_WIDTH 32
#define SDRAM_CONTROLLER_SDRAM_NUM_BANKS 4
#define SDRAM_CONTROLLER_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_CONTROLLER_SDRAM_ROW_WIDTH 12
#define SDRAM_CONTROLLER_SHARED_DATA 0
#define SDRAM_CONTROLLER_SIM_MODEL_BASE 0
#define SDRAM_CONTROLLER_SPAN 16777216
#define SDRAM_CONTROLLER_STARVATION_INDICATOR 0
#define SDRAM_CONTROLLER_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_CONTROLLER_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_CONTROLLER_T_AC 5.5
#define SDRAM_CONTROLLER_T_MRD 3
#define SDRAM_CONTROLLER_T_RCD 20.0
#define SDRAM_CONTROLLER_T_RFC 70.0
#define SDRAM_CONTROLLER_T_RP 20.0
#define SDRAM_CONTROLLER_T_WR 14.0


/*
 * sysid_qsys configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys altera_avalon_sysid_qsys
#define SYSID_QSYS_BASE 0x2081230
#define SYSID_QSYS_ID 0
#define SYSID_QSYS_IRQ -1
#define SYSID_QSYS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_NAME "/dev/sysid_qsys"
#define SYSID_QSYS_SPAN 8
#define SYSID_QSYS_TIMESTAMP 1556863269
#define SYSID_QSYS_TYPE "altera_avalon_sysid_qsys"

#endif /* __SYSTEM_H_ */
