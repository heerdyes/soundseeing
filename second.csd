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

ao1     vco2    1, .18, 12
kf      =       39

kpw     =       .5+.1*k(ao0)
a2      vco2    1, kf, 2, kpw
a2u     =       (1+a2)/2

km0     =       36
a1      vco2    1, km0, 12
a1u     =       (1+a1)/2

k3f     linseg  800, 6, 100
kp2     =       .66
a3      vco2    1, k3f, 2, kp2
a3u     =       (1+a3)/2

kform   linseg  200, 6, 2400
a0      vco2    k(a1u)*k(a2u)*k(a3u), kform
aflt    butlp   a0, 3600

aout    =       img * aflt

        display aout, .05
        ;dispfft aout, .002, 2048
        outall  aout
        endin

</CsInstruments>

<CsScore>
i 1 0 30
e
</CsScore>
</CsoundSynthesizer>
