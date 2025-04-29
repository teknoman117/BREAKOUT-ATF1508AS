Shift Register Example
=====================

![demo](/Assets/shift-register.gif)

Connections
-----------

|   Arduino   | CPLD |
| ----------- | ---- |
|      2      |  83  |
|     RST     |  1   |
|   11 (MOSI) |  84  |
|   13 (SCK)  |  2   |

Instructions
------------
Run "build-pld.bash" to compile the HDL image for the ATF1508AS, assuming wincupl is installed the C drive in the Wine Prefix "$HOME/.wine32"

Build and run "shift-register.ino" on an attached Arduino Uno
