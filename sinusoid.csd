<CsoundSynthesizer>
<CsOptions>
-odac --displays
</CsOptions>

<CsInstruments>
0dbfs = 1

        instr   1

img     =       .09

a0      oscil   1, 440, 3

aout    =       img * a0

        display aout, .01, 16

        outall  aout

        endin

</CsInstruments>

<CsScore>
f 1 0 256 10    1
f 2 0 64 10     1 .4
f 3 0 512 9     1 1 0 1.5 1 0

i 1 0 30
e
</CsScore>
</CsoundSynthesizer>
