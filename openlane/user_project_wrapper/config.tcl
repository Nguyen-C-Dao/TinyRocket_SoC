# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]]]
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/fixed_wrapper_cfgs.tcl
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/default_wrapper_cfgs.tcl
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"


set ::env(DESIGN_NAME) user_project_wrapper

set ::env(FP_PDN_CHECK_NODES) 0
set ::env(FP_PDN_ENABLE_RAILS) 1 

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "Inst_ChipTop.clock_clock"

set ::env(CLOCK_PERIOD) "40"

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
set ::env(DIODE_INSERTION_STRATEGY) 5

set ::env(MAGIC_WRITE_FULL_LEF) 0

set ::env(SYNTH_FLAT_TOP) 1
#set ::env(SYNTH_NO_FLAT) 1
set ::env(CLOCK_TREE_SYNTH) 1
set ::env(DESIGN_IS_CORE) 1
#set ::env(FP_PDN_CORE_RING) 1
set ::env(STA_REPORT_POWER) 0
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"
set ::env(VDD_NETS) {vccd1 vdda1 vdda2 vccd2}
set ::env(GND_NETS) {vssd1 vssa1 vssa2 vssd2}
set ::env(VDD_PIN) "vccd1"
set ::env(GND_PIN) "vssd1"
set ::env(PL_TARGET_DENSITY) 0.25
set ::env(PL_SKIP_INITIAL_PLACEMENT) 1
#set ::env(CTS_TARGET_SKEW) 200
#set ::env(CTS_SINK_CLUSTERING_SIZE) 100
#set ::env(CTS_SINK_CLUSTERING_MAX_DIAMETER) 1000
set ::env(ROUTING_CORES) 16
set ::env(GLB_RT_ALLOW_CONGESTION) 1
#set ::env(GLB_RT_MAXLAYER) 5
#set ::env(RT_MAX_LAYER) {met4}
set ::env(FP_PDN_CHECK_NODES) 0
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(KLAYOUT_XOR_GDS) 0
set ::env(KLAYOUT_XOR_XML) 0
set ::env(FP_PDN_IRDROP) 0

#set ::env(PL_MAX_DISPLACEMENT_X) 800
#set ::env(PL_MAX_DISPLACEMENT_Y) 600
#set ::env(FP_TAP_HORIZONTAL_HALO) 20
#set ::env(FP_TAP_VERTICAL_HALO) 20
#set ::env(FP_PDN_HORIZONTAL_HALO) 30
#set ::env(FP_PDN_VERTICAL_HALO) 30
#set ::env(FP_PDN_VOFFSET) 5
#set ::env(FP_PDN_HOFFSET) 235
#set ::env(FP_PDN_VWIDTH) 1.6
#set ::env(FP_PDN_HSPACING) 15.5
#set ::env(FP_PDN_HSPACING) 3
#set ::env(FP_PDN_VPITCH) 2800
#set ::env(FP_PDN_HPITCH) {2800}
#set ::env(PL_MACRO_CHANNEL) {5 30}
#set ::env(PL_MACRO_HALO) {5 30}
#set ::env(FP_PDN_HPITCH) {180}
#set ::env(FP_PDN_VPITCH) {2800}

set ::env(SYNTH_READ_BLACKBOX_LIB) 1
## Source Verilog Files
#set ::env(VERILOG_FILES) [glob $script_dir/../../verilog/rtl/defines.v $script_dir/../../../verilog/rtl/*.v ]
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../../verilog/rtl/user_project_wrapper.v \
	$script_dir/../../../verilog/rtl/tinyRocket/*v "


## Internal Macros
### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) "$script_dir/../../../openlane/user_project_wrapper/macro.cfg"

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/verilog/sky130_sram_2kbyte_1rw1r_32x512_8.v \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/verilog/sky130_sram_1kbyte_1rw1r_8x1024_8.v \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/verilog/sky130_sram_1kbyte_1rw1r_32x256_8.v"

set ::env(EXTRA_LEFS) "\
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lef/sky130_sram_2kbyte_1rw1r_32x512_8.lef \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lef/sky130_sram_1kbyte_1rw1r_8x1024_8.lef \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lef/sky130_sram_1kbyte_1rw1r_32x256_8.lef"

set ::env(EXTRA_GDS_FILES) "\
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/gds/sky130_sram_2kbyte_1rw1r_32x512_8.gds \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/gds/sky130_sram_1kbyte_1rw1r_8x1024_8.gds \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/gds/sky130_sram_1kbyte_1rw1r_32x256_8.gds"

set ::env(EXTRA_LIBS) "\
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lib/sky130_sram_1kbyte_1rw1r_8x1024_8_TT_1p8V_25C.lib \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lib/sky130_sram_1kbyte_1rw1r_32x256_8_TT_1p8V_25C.lib \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lib/sky130_sram_2kbyte_1rw1r_32x512_8_TT_1p8V_25C.lib"

### Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "\
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.ptw.l2_tlb_ram.l2_tlb_ram_ext.mem_0_0 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.ptw.l2_tlb_ram.l2_tlb_ram_ext.mem_0_1 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.ptw.l2_tlb_ram.l2_tlb_ram_ext.mem_0_2 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.ptw.l2_tlb_ram.l2_tlb_ram_ext.mem_0_3 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.ptw.l2_tlb_ram.l2_tlb_ram_ext.mem_0_4 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.frontend.icache.tag_array.tag_array_ext.mem_0_0 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.frontend.icache.data_arrays_0.data_arrays_0_0_ext.mem_0_0 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.frontend.icache.data_arrays_0.data_arrays_0_0_ext.mem_1_0 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.dcache.data.data_arrays_0.data_arrays_0_ext.mem_0_0 vccd1 vssd1 \
        Inst_ChipTop.system.tile_prci_domain.tile_reset_domain.tile.dcache.data.data_arrays_0.data_arrays_0_ext.mem_1_0 vccd1 vssd1 "

#set ::env(GLB_RT_OBS) "met1 0 0 $::env(DIE_AREA),\
#				   met2 0 0 $::env(DIE_AREA),\
#				   met3 0 0 $::env(DIE_AREA),\
#				   met4 0 0 $::env(DIE_AREA),\
#				   met5 0 0 $::env(DIE_AREA)"

