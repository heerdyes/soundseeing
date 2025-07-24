<CsoundSynthesizer>
<CsOptions>
-odac --displays
</CsOptions>

<CsInstruments>
0dbfs = 1
ksmps = 16

        instr   1
img     =       .08

ao0     vco2    1, .2, 12

ao1     vco2    1, .08, 12
kf      =       1020+520*k(ao1)

kpw     =       .5+.1*k(ao0)
a2      vco2    1, kf, 2, kpw
a2u     =       (1+a2)/2

a1      vco2    1, 5.4, 12
a1u     =       (1+a1)/2

kform   linseg  100, 6, 2000
a0      vco2    k(a1u)*k(a2u), kform

aout    =       img * a0

        display aout, .02
        ;dispfft aout, .002, 2048
        outall  aout
        endin

</CsInstruments>

<CsScore>
i 1 0 30
e
</CsScore>
</CsoundSynthesizer>
