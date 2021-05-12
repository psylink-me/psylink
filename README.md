# PsyLink

A myoelectric neural interface.

This is intended as a human input device (like a keyboard) that predicts your
intention from muscle signals.  Using a neural network, trained through a
process where you press keys at the exact same time that you make movements
with the limb wearing the device, it learns correlations between the muscle
signals and intended keys, and can press them for you.

- [Video demo](https://hut.pm/data/psy/-video.webm)
- [Development Log](https://hut.pm/psylink.html)

# Pictures

These may be out of date because of e.g. shipping delays, or out of sync
because one part of the system may have advanced faster recently than the
others.

![Hardware Photo](https://hut.pm/data/psy/-hardware.jpg)

![Software Screenshot](https://hut.pm/data/psy/-software.png)

![Schematic](https://hut.pm/data/psy/-schematic.png)

![Rendering of the PCB](https://hut.pm/data/psy/-pcb.png)

# Datasheet

Currently in R&D phase, specification constantly changing.  This describes the
hardware version 0.5.1 and software from 2021-05-08.

- Features:
    - Battery-powered
    - Wireless, using Bluetooth Low Energy (BLE)
    - Supports 17 electrodes (8 pairs + 1 ground)
    - Transmits 8 signals at 8-bit resolution, 500Hz sampling rate
    - Linux graphical user interface for:
        - Mapping keyboard key presses to muscle signals
        - Training a neural network to predict key presses from signals
        - Simulating key presses based on neural network predictions
    - GNURadio integration for plotting the raw signals + FFT
- Hardware overview:
    - A fabric glove/sleeve with a central component (arduino + power supply)
      and 8 distributed signal clean-up units close to individual electrodes.
    - [KiCad Schematic](schematics/myocular0.5.1.sch)
    - [KiCad PCB of one distributed signal clean-up unit](schematics/myocular0.5.1d.kicad_pcb)
- Components:
    - 1x [Arduino Nano 33 BLE Sense](https://store.arduino.cc/arduino-nano-33-ble-sense)
    - 1x [LM324 Operational Amplifier](https://www.ti.com/product/LM324)
    - 8x [INA128 Instrumentational Amplifier](https://www.ti.com/product/INA128)
    - Any portable 6V power supply (like 2x CR2032)
    - 17x Electrodes, e.g. [Prym 390120](https://www.prym.com/en/non-sew-refill-for-390120-smooth-cap-10mm-silver-coloured-390104) (don't laugh, they work)
    - A forearm sleeve from non-conductive fabric
    - Additional standard components (see schematic)
- Power ratings
    - Supply Voltage: 4.5-6V
    - Power dissipation:
        - Idle: ~86.9mW (16.9mA x 5.14V)
        - Transmitting at 6-7kB/s: 92.5mW (18.0mA x 5.14V)
- Weight: ~85g (at 9.81m/s² gravitational acceleration)

# License

Copyright (C) 2021  Roman Zimbelmann

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3 as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
