# BREAKOUT-ATF1508AS

A breakout board for the PLCC84 version of the ATF1504AS or ATF1508AS. Allows for usage in a breadboard environment.

![Assembled](/Assets/assembled.jpg)

### Example Project

See ![Example](/Example)

### Dual Voltage Rails

The PLCC84 variants of the ATF1504AS and ATF1504AS provide two voltage rails - VCCINT and VCCIO. VCCINT is the CPLD core voltage and is required to be at 5V. VCCIO is the external IO voltage and can be either 3.3V (3.0V to 3.6V) or 5V.

### Oscillator

Socket X1 is for a 3.3V or 5V TTL oscillator in the 4 lead DIP-8 form factor. The enable pin is left electrically unconnected, which is enabled for the majority of TTL oscillators. 

The oscillator output is connected to I83/GCLK1. If an external clock is provided on I83/GCLK1 through the breakout headers, the oscillator must be removed.

Jumper JP1 selects the source voltage of the oscillator. Position 1-2 connects the oscillator to the VCCIO rail and Position 2-3 connects to the VCCINT (5V) rail.

### Programming

In the event that JTAG has been disabled on the CPLD, a 12V boost regulator is provided to force the CPLD into JTAG mode.

Jumper JP2 selects the function of the I84/OE1 pin. Position 1-2 is normal operation, with the pin connected to the breakout headers along the bottom of the board. Position 2-3 is for erase. This disconnects the pin from the breakout headers and instead connects it to 12V through current limiting resistor R3 (2.2 kOhm by default).

Programming can be achieved with an official programmer or a FT232H and OpenOCD. See ![FT232H Instructions](https://github.com/teknoman117/P80C550-SPM-CPLD#flashing-cpld-without-an-expensive-programmer)

Please note that JTAG Header J1 is not isolated from the breakout headers. If the design uses P14 (TDI), P23 (TMS), P62 (TCK), or P71 (TDO), the breakout board may need to be removed from the circuit prior to programming.

### Errata

The I2/GCLK2 label on the breakout headers should be I2/GCLK2/OE2.

### License

CC-BY-SA 4.0
