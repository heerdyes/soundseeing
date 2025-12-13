<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 16
nchnls = 2
0dbfs = 1

        instr           1
gkn,gkp sensekey
if changed(gkp)==1 then
  if gkp==1 then
    if gkn==97 then
      event "i", 10, 0, 5, 9.00, .2
      event "i", 10, 4, 5, 9.05, .2
      event "i", 10, 8, 5, 9.04, .2
    endif
  endif
endif
        endin

; --- fm bass bell --- ;
        instr           10
idur    =               p3
ifrq    =               cpspch(p4)
iamp    =               p5

k3      unirand         1
k3b     =               2*k3-1
knv     expseg          1, idur, .02
a0      foscil          iamp, ifrq, 1, 1+.11*k3b*knv, 3*knv, 1

        outall          a0*knv
        endin

</CsInstruments>
<CsScore>
; timbres
f 1 0 1024 9  1 1 0
f 2 0 1024 9  1 5 0  2 2 0  3 1 0

; envelopes
; --- var tbl
f 10 0 512 5  .01 128 1 128 .01 128 1 128 .01

; instr
i 10 .0  1 7.05 .12
i 10 .2  1 7.05 .12
i 10 .4  1 8.00 .12
i 10 .6  1 7.10 .12
i 10 1.0 1 8.00 .12
i 10 1.2 1 8.02 .12
i 10 1.4 1 8.00 .12
i 10 1.6 1 7.05 .12

</CsScore>
</CsoundSynthesizer>
