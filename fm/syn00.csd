<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 16
nchnls = 2
0dbfs = 1

; --- this is a bad bass --- ;
        instr           10
idur    =               p3
ifrq    =               cpspch(p4)
iamp    =               p5

kvib    oscil           1, 3.6, 12
kfq     =               ifrq + 4.2*kvib

knv     expseg          1, idur, .05
k2      expseg          1, idur/5, 2, 4*idur/5, 1
a0      foscil          iamp, kfq, 1, .21, k2, 1

        outall          a0*knv
        endin

</CsInstruments>
<CsScore>
; timbres
f 1 0 1024 9  1 1 0
f 2 0 1024 9  1 5 0  2 2 0  3 1 0

; envelopes
; --- var tbl
f 9  0 512 5   .01 512 .001
; --- env options
f 10 0 512 5   1 64 .01 128-16 .001 16 .98 64 .01
f 11 0 512 5   1 64-8 .01 8 .99 64 .01
f 12 0 512 5   .01 256 1 256 .01
f 13 0 512 5   1 64 .01

i 10 0 4 10.00 .2
i 10 4 4 9.04 .2
i 10 8 4 8.10 .2
i 10 12 4 8.07 .2

</CsScore>
</CsoundSynthesizer>
