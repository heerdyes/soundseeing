<CsoundSynthesizer>
<CsOptions>
-odac --displays
</CsOptions>

<CsInstruments>
0dbfs = 1

        instr   1
img     =       .081
a0      vco2    1, 320
a1      vco2    1, 320.5
a2      vco2    1, 319.9
a3      vco2    1, 680

aout    =       img * (a0+a1+a2+a3)/4

        ;display aout, .01
        outall  aout
        endin

</CsInstruments>

<CsScore>
i 1 0 30
e
</CsScore>
</CsoundSynthesizer>
