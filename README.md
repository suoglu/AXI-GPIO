# AXI Lite GPIO

## Contents of Readme

1. About
2. Simulation
3. Test
4. Utilization
5. Status Information
6. License

[![Repo on GitLab](https://img.shields.io/badge/repo-GitLab-6C488A.svg)](https://gitlab.com/suoglu/axi-gpio)
[![Repo on GitHub](https://img.shields.io/badge/repo-GitHub-3D76C2.svg)](https://github.com/suoglu/AXI-GPIO)

---

## About

Custom AXI GPIO module with 32 input and 32 output channels. Number of active channels can be adjusted from GUI or via parameters.

## Simulation

IP files include three simulation files for following cases:

- None of the channels are active
- One output and one input channel is active
- 16 input and 16 output channels are active

## Test

IP core tested with 16 input and 16 output channels connected to each other. Data send to Microblaze via uart and forwarded to the IP core with included driver.

## (Synthesized) Utilization on Artix-7

**Without any active channels:**

- Slice LUTs as Logic: 6
- Slice Registers as Flip Flop: 4

**2 input and 2 output channels:**

- Slice LUTs as Logic: 75
- Slice Registers as Flip Flop: 100

**16 input and 16 output channels:**

- Slice LUTs as Logic: 343
- Slice Registers as Flip Flop: 548
- F7 Muxes: 128
- F8 Muxes: 32

**16 output channels:**

- Slice LUTs as Logic: 184
- Slice Registers as Flip Flop: 548
- F7 Muxes: 64

**16 input channels:**

- Slice LUTs as Logic: 166
- Slice Registers as Flip Flop: 36
- F7 Muxes: 64

**32 input and 32 output channels:**

- Slice LUTs as Logic: 614
- Slice Registers as Flip Flop: 1059
- F7 Muxes: 256
- F8 Muxes: 128

## Status Information

**Last Simulation:** 01 November 2021, with [Icarus Verilog](http://iverilog.icarus.com/).

**Last Test:** 01 November 2021, on [Arty A7](https://digilent.com/reference/programmable-logic/arty-a7/start).

## License

CERN Open Hardware Licence Version 2 - Weakly Reciprocal
