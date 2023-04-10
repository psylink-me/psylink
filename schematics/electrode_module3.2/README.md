# PsyLink Electrode Module 3.2

- Part ID: ["b3.2"](https://psylink.me/b3.2/)
- Circuit ID: ["10.2"](https://psylink.me/c10.2/)
- Dimensions: 70 x 25mm
- Finalized on: 2022-01-26
- Tested: Yes
- Known bugs:
    - Excessive interference along "out2" trace.
    - Too aggressive filtering through 100pF (C1-C8) capacitors. Solved by changing them to 100nF.

# PCB Images

![Front Side](https://psylink.me/img/boards/b3.2.png)

![Back Side](https://psylink.me/img/boards/b3.2_back.png)

# Circuit Image

![Circuit](https://psylink.me/img/circuits/c10.2.png)

# Changelog
## Circuit

Electrode Module 3.2:

- Gain resistors R9, R11, R12 have been reduced from 1000 Ohms to 100 Ohms, raising the gain tenfold, from 51x to 501x.
- Gain resistor R10 was only reduced to 200 Ohms, raising the gain to only 251x. This was done to offset an interference bug along the out2 trace.  Once this is fixed, the resistance should be set to equal that of R9/R11/R12 once again.
- JP1-JP8 are now closed by default, to save time during assembly

## PCB

Electrode Module 3.2:

- Moved EX1 closer to EX5 and EX4 closer to EX8, so that two 2-pin-headers can be used instead of four 1-pin headers
- Longer solder pads on U1-U4 for easier hand-soldering
- Improved labels, added PsyLink logo
