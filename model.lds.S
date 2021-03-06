/*
 * model.lds.S - simple linker script for stand-alone Linux booting
 *
 * Copyright (C) 2011 ARM Limited. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE.txt file.
 */

OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
TARGET(binary)

INPUT(./boot.o)

PHYS_OFFSET = 0xe0100000 - 0x10000; /* upper end of SRAM */


SECTIONS
{
 . = PHYS_OFFSET;

 .text : { boot.o }

 . = PHYS_OFFSET + 0x8000;
 monitor_start = .;
 .monitor : { monitor.o }

 .data : { *(.data) }
 .bss : { *(.bss) }

}
