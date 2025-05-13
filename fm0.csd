<CsoundSynthesizer>
<CsOptions>
-odac --displays
</CsOptions>

<CsInstruments>
0dbfs = 1
ksmps = 8

        instr   1
img     =       .09

a1      vco2    1, 6.6, 12
k1u     =       (1+k(a1))/2

kf      linseg  4, 8, 40
a2      vco2    1, kf, 2, .3
k2u     =       (1+k(a2))/2

a3      vco2    1, .4, 12
k3u     =       k(a3)

am0     vco2    100, 7+3*k3u, 12
a0      vco2    k1u*k2u, 880+k(am0)

aout    =       img * a0

        display aout, .0075, 32
        ;dispfft aout, .006, 2048
        outall  aout
        endin

</CsInstruments>

<CsScore>
i 1 0 30
e
</CsScore>
</CsoundSynthesizer>
