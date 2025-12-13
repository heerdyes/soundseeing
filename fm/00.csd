<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 16
nchnls = 2
0dbfs = 1

garvsnd init            0
gkdur   init            4
gkinst  init            12

        instr           1
gkn,gkp sensekey
if changed(gkp)==1 then
  if gkp==1 then
        printk2         gkn
        
    if gkn>=48 && gkn<=57 then
kcps    =               222 + 222*(gkn-48)/10
        event           "i", gkinst, 0, gkdur, kcps, .22
        printk2         kcps
    elseif gkn>=97 && gkn<=122 then
kcps    =               444 + 2.6*222*(gkn-97)/26
        event           "i", gkinst, 0, gkdur, kcps, .22
        printk2         kcps
    elseif gkn==45 then
gkdur   *=              .5
    elseif gkn==61 then
gkdur   *=              1.5
    endif
    
  endif
endif
        endin

; --- fm latent tremolo --- ;
        instr           10
idur    =               p3
ifrq    =               p4
iamp    =               p5

knv     expseg          1, idur, .01
k2      unirand         1
k3      lineto          k2, .14

k4      oscil           1, 6.4, 4
a0      foscil          k4*knv, ifrq, 1, .02+.1*k3, 1.5, 3

aout    =               a0*iamp
        outall          aout
        
garvsnd +=              aout
        endin
        
; --- fm watery handpan --- ;
        instr           11
idur    =               p3
ifrq    =               p4
iamp    =               p5

knv     expseg          1, idur, .01

k2      unirand         1
k3      lineto          k2, .128

a0      foscil          knv, ifrq, 1, 2+.112*k3, .75, 1
aout    =               a0*iamp

        outall          aout
        
garvsnd +=              aout
        endin
        
; --- dual fm tone --- ;
        instr           12
idur    =               p3
ifrq    =               p4
iamp    =               p5

knv     expseg          1, idur, .01

k2      unirand         1
k3      lineto          k2, .14

a0      foscil          knv, ifrq, 1, .025+.15*k3, 1, 1
a1      foscil          knv, ifrq, 1, 2.125-.075+.15*k3, 1, 1
a2      =               .8*a0 + .2*a1

aout    =               a2*iamp
        outall          aout
        
garvsnd +=              aout
        endin
        
; --- fx --- ;
        instr           99
iamt    =               p4
a0,a1   babo            garvsnd, 1.5,.5,2, 2,2,3
        outs            iamt*a0, iamt*a1
garvsnd =               0
        endin

</CsInstruments>
<CsScore>
; timbres
f 1 0 1024 9  1 1 0
f 2 0 512  7  1 512 -1
f 3 0 512  7  0 128 1 256 -1 128 0

; envelopes
f 4 0 128  7  0 8 1 64-8-8 1 8 0
f 5 0 256  7  0 8 1 64-8-8 1 8 0

; instr
i 1 0 360
i 99 0 360 .44
</CsScore>
</CsoundSynthesizer>
