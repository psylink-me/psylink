This consists of multiple parts.

# GNURadio

- Dependencies:
    - `BLE_GANTT` python library

# Stand-alone scripts

These are mostly for testing/debugging.  I tried out different python BLE
libraries which have their individual dependencies.  You'll figure it out.

# Arduino

- RGB LED color codes:
    - Red LED: Bluetooth Low Energy failed to initialize
    - Yellow LED: Timer failed to initialize
    - Blue LED: Bluetooth device is connected
    - No LED: Everything went well, but no device is connected yet
- Dependencies:
    - `ArduinoBLE` library
    - [`NRF52_MBED_TimerInterrupt`](https://github.com/khoih-prog/NRF52_MBED_TimerInterrupt) library
