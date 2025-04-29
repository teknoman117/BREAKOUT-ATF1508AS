#!/bin/bash

export WINEPREFIX="$HOME/.wine32"
export WINEARCH=win32

PN=shift-register
DEVICE=P1508C84

die() {
    echo "command failure"
    exit 1
}

if [ "${1}" = "-s" ]; then
    wine "c:\\Wincupl\\Shared\\cupl.exe" \
        -uabm1s "c:\\Wincupl\\Shared\\cupl.dl" "${PN}.pld" \
        2>/dev/null || die
else
    wine "c:\\Wincupl\\Shared\\cupl.exe" \
        -uabm2kb "c:\\Wincupl\\Shared\\cupl.dl" "${PN}.pld" \
        2>/dev/null || die
    wine "c:\\Wincupl\\WinCupl\\Fitters\\fit1508.exe" \
        "${PN}.tt2" \
        -device ${DEVICE} \
        -preassign keep \
        -strategy jtag off \
        -strategy pin_keep off \
        -strategy output_fast on \
	-strategy logic_doubling on \
	-strategy open_collector = OUT0 OUT1 OUT2 OUT3 OUT4 OUT5 OUT6 OUT7 OUT8 OUT9 OUT10 OUT11 OUT12 OUT13 OUT14 OUT15 OUT16 OUT17 OUT18 OUT19 OUT20 OUT21 OUT22 OUT23 OUT24 OUT25 OUT26 OUT27 OUT28 OUT29 OUT30 OUT31 OUT32 OUT33 OUT34 OUT35 OUT36 OUT37 OUT38 OUT39 OUT40 OUT41 OUT42 OUT43 OUT44 OUT45 OUT46 OUT47 OUT48 OUT49 OUT50 OUT51 OUT52 OUT53 OUT54 OUT55 OUT56 OUT57 OUT58 OUT59 OUT60 OUT61 OUT62 OUT63 \
        2>/dev/null || die
fi
