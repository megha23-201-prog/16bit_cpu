## ============================================================
## Constraints file for the Arty S7 Rev. C (XC7S25-CSGA324)
## Tailored for the 16-bit CPU project (CPU.v top module)
##
## HOW TO USE:
##   - Lines starting with ## are comments (ignored by Vivado)
##   - Lines starting with # are UNCOMMENTED by removing the #
##     when you want to use that pin in your design
##   - The Clock line is ACTIVE (no #) — required to fix all warnings
## ============================================================

## ============================================================
## CLOCK — 100 MHz on-board oscillator (ACTIVE — required)
## The CPU's Clock port is connected to this pin.
## ============================================================
set_property -dict { PACKAGE_PIN R2 IOSTANDARD SSTL135 } [get_ports { Clock }];
create_clock -period 20.000 [get_ports { Clock }];

## Optional: 12 MHz oscillator (uncomment if you prefer slower clock for debugging)
#set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { Clock }];
#create_clock -add -name sys_clk_pin -period 83.333 -waveform {0 41.667} [get_ports { Clock }];

## ============================================================
## SWITCHES (sw[0]..sw[3]) — useful for manual CPU reset or mode select
## ============================================================
#set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; # Sch=sw[0]
#set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; # Sch=sw[1]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; # Sch=sw[2]
#set_property -dict { PACKAGE_PIN M5    IOSTANDARD SSTL135  } [get_ports { sw[3] }]; # Sch=sw[3]

## ============================================================
## BUTTONS (btn[0]..btn[3]) — useful for clock step / reset
## ============================================================
#set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { btn[0] }]; # Sch=btn[0]
#set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { btn[1] }]; # Sch=btn[1]
#set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { btn[2] }]; # Sch=btn[2]
#set_property -dict { PACKAGE_PIN H13   IOSTANDARD LVCMOS33 } [get_ports { btn[3] }]; # Sch=btn[3]

## ============================================================
## LEDs (led[2]..led[5]) — useful to display ALU result bits
## ============================================================
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports { opcode_out[0] }]; # LED0
set_property -dict { PACKAGE_PIN F13 IOSTANDARD LVCMOS33 } [get_ports { opcode_out[1] }]; # LED1
set_property -dict { PACKAGE_PIN E13 IOSTANDARD LVCMOS33 } [get_ports { opcode_out[2] }]; # LED2
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports { reg_write_out }]; # LED3

## ============================================================
## RGB LEDs (rgb_led[0]..rgb_led[5]) — status indicators
## ============================================================
#set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { rgb_led[0] }];
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { rgb_led[1] }];
#set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { rgb_led[2] }];
#set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports { rgb_led[3] }];
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { rgb_led[4] }];
#set_property -dict { PACKAGE_PIN E14   IOSTANDARD LVCMOS33 } [get_ports { rgb_led[5] }];

## ============================================================
## PMOD Header JA — general purpose I/O expansion
## ============================================================
#set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { ja[0] }];
#set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { ja[1] }];
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { ja[2] }];
#set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { ja[3] }];
#set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { ja[4] }];
#set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { ja[5] }];
#set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { ja[6] }];
#set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports { ja[7] }];

## ============================================================
## PMOD Header JB
## ============================================================
#set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { jb[0] }];
#set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { jb[1] }];
#set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { jb[2] }];
#set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { jb[3] }];
#set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { jb[4] }];
#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { jb[5] }];
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { jb[6] }];
#set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { jb[7] }];

## ============================================================
## USB-UART Interface — for serial debug output
## ============================================================
#set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { uart_rxd_out }];
#set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { uart_txd_in  }];

## ============================================================
## Bitstream / Configuration options (ACTIVE — leave these on)
## Required for correct SPI flash programming on Arty S7
## ============================================================
set_property BITSTREAM.CONFIG.CONFIGRATE 50        [current_design]
set_property CONFIG_VOLTAGE              3.3        [current_design]
set_property CFGBVS                     VCCO       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4       [current_design]
set_property CONFIG_MODE                SPIx4      [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE       [current_design]

## ============================================================
## Internal VREF for Bank 34 (required because sw[3] is on M5
## in the 1.35V bank — leave this active even if not using sw[3])
## ============================================================
set_property INTERNAL_VREF 0.675 [get_iobanks 34]

