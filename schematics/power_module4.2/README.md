# PsyLink Power Module 4.2

This board connects to a [Arduino Nano 33 BLE](https://docs.arduino.cc/hardware/nano-33-ble) or [BLE Sense](https://docs.arduino.cc/hardware/nano-33-ble-sense) and a AAA battery, with the purpose to power the Arduino and expose a variety of I/O pins and power pins in order to power further boards such as the PsyLink electrode modules.

- Part ID: ["bp4.2"](https://psylink.me/bp4.2/)
- Circuit ID: ["12.1"](https://psylink.me/c12.1/)
- Dimensions: 90 x 32.6mm
- Finalized on: 2022-01-26
- Tested: Yes
- Known bugs:
    - Power LED (D1) drains a lot of power. Mitigate this by increasing the resistor (R5) or removing the LED entirely - there is another power LED on the Arduino anyway.

# Main Features

- Boosts the battery voltage up to 5V with a [TSP61220](https://www.ti.com/product/de-de/TPS61220) step-up converter
- Supports AAA batteries. Tested with 1.5V non-rechargeable, and 1.2V NiMH rechargeable. Plugged into "Keystone 82" battery clips
- Generates 2.5V Reference Voltage (Vref) with a [LM321](https://www.ti.com/product/LM321) for the ground electrode and to serve as a baseline for the electrode modules
- Exposes Arduino pins A0-A8, D2, D3, D10-D13
- Exposes power output connectors that supply V+, Vref, GND. Three sets of these are available to power 3 electrode modules, but more can be connected via daisy-chaining.
- Features an optional power LED, though I recommend leaving it out to conserve power. The Arduino already provides another power LED.
- Provides mounting points for 5 dome nuts (e.g. [M3 dome nuts of A2 stainless steel](https://www.schraubenking.at/M3-Hutmutter-DIN1587-Edelstahl-A2-P002263)) that act as ground electrode and spacers between the board and the skin, although it is still required to place insulating tape over any exposed metal on the board (other than the screws) to ensure proper function
- Can be worn on a limb by utilizing the rubber band holes on the sides of the PCB.
    -  An isolating tape must fully cover any metal contact points the bottom side
- Supports a 3.3V operating mode by changing the value of R2 from 110kΩ to 180kΩ. This will also change Vref from 2.5V to 1.65V, and if you use a power LED, its resistor R5 may need adjustment.
- You can change the values for R3, R4, and all capacitors by ~1 order of magnitude without too much impact. R3 needs to be equal to R4. R5 may need to be adapted to whichever LED and supply voltage you use, see e.g. [this LED resistor calculator](https://www.allaboutcircuits.com/tools/led-resistor-calculator/).
- Customization via jumpers:
    - JP1: Exposes D2, GND, D3, so you can ground D2 or D3 with a jumper to change the device behavior on the fly
    - JP2: Enable measuring the battery voltage with A7, which sacrifices one electrode signal
    - JP3: Solder jumper to enable the reference voltage generator
    - JP4-JP8: Enables one of the 5 screws/dome-nuts to act as a ground electrode. At least one of them should be activated, and the screw should touch the skin.

# IMPORTANT ASSEMBLY INSTRUCTIONS

- Cover the bottom of the board with isolating tape if it is placed on the skin
- Before soldering on any through-hole components, their pins must be shortened with e.g. wire cutters so that they do not extend out of the board on the bottom side, to avoid scratching the skin
- You must close the solder jumpers JP3 and (e.g.) JP4 for proper function
- The screws connect Vref to the skin (if their resp. jumper is closed). You MUST manually connect Vref with the skin if this board is not worn on the skin directly and if you use this board along with the electrode modules for EMG purposes. Keep a distance of at least 3cm with this ground electrode from any other electrode.
- It's more comfortable to wear if you leave out screw 5.

# PCB Images

![Front Side](https://psylink.me/img/boards/bp4.2.png)

![Back Side](https://psylink.me/img/boards/bp4.2_back.png)

# Circuit Image

![Circuit](https://psylink.me/img/circuits/c12.1.png)

# Changelog

Power Module 4.2:

- Added logo
- Added "OFF" and "ON" labels to power switch
- Simplified power LED circuit: it is now always connected to V+ instead of giving you the choice between V+ and Vref via a jumper
- Moved the external power pins (J7) away from the center of the battery, so the pin headers are not physically in the way when removing the battery.

Power Module 4.1:

- Added pins for external power supply
- Added optional power LED circuit, with a jumper (JP9) that lets you choose between powering it with Vref (should consume less power) or V+ (in case you disable Vref generator via jumper JP3)
- Repositioned some parts

Power Module 4.0:

- Redesigned from scratch to be worn on the arm directly, instead of being attached to a piece of fabric via velcro as before
- Longer but thinner board by repositioning the battery in line with the Arduino rather than side-by-side, so that it fits better on the arm
- Added holes for rubber bands on the sides, compatible with corresponding electrode modules.
- Added screw mounting slots for ground electrodes, connected to Vref. Only one of them needs to be enabled via a jumper (JP4-JP8)
- Power output pins (V+, Vref, GND) for powering electrode modules are now separated from the I/O pins into distinct 3-pin connectors
- Added a third set of power output pins
- New dimensions: 90 x 32.6mm

Power Module 3.1:

- Changed package for L1 inductance coil from 1206 to 1210, so one can fit larger coils with a higher maximum current rating on it
- For easier soldering, added thermal reliefs on the filled area for GND on the back side
- For easier soldering, added larger pads for L1/U*/R*/C* components (see [issue #8](https://codeberg.org/psylink/psylink/issues/8))
- No changes to the circuit

Power Module 3:

- Redesigned PCB from scratch
- Actually works
- Both Arduino and battery clips are now on the top side
- Added bypass capacitors to reduce noise
- Added various jumpers:
    - A solder jumper to enable/disable the reference voltage generator, to save power when it's not needed
    - A solder jumper to sacrifice one electrode and use its analog input pin to measure the battery charge instead.
    - Three configuration pins that expose the Arduino's D2, GND, D3 pins, connectable via jumpers, to change software settings on the fly and toggle between up to 4 different modes. Or you can use them to plug in an extra module.
- New dimensions: 47.63 x 31.34mm

Power Module 2 (defunct):

- Switched from manual wiring to PCB
- Switched from 2x 1.5V coin cells to single 1.2V AAA rechargeable battery
- The battery clips are mounted on the front side whereas the Arduino is mounted on the back side. (this makes it more compact, but unfortunately hard to wear)
- Added boost converter ([TPS61220](https://www.ti.com/product/de-de/TPS61220)) to generate 5V
- Switched from thru-hole LM324 to SMD [LM321](https://www.ti.com/product/LM321) for reference voltage generation
- Outputs 2x 5V, 2x GND, 2x Vref (2.5V) - theoretically. I never got it to work.
- New dimensions: 50 x 25mm

Power Module 1:

- Initial version
- Manual wiring on a prototyping board
- Generating reference voltage with a LM324 chip
- Using 2x 1.5V CR2032 coin cells
- Outputs 2x 3V, 2x GND, 1x Vref (1.5V)
- Dimensions: 36 x 30mm
