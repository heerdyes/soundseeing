<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 16
nchnls = 2
0dbfs = 1

garvsnd init            0
gkdur   init            4
gkinst  init            102
gki1    init            0
gki0    init            2
gkstate init            0

        instr           1
gkn,gkp sensekey
if changed(gkp)==1 then
  if gkp==1 then
  
    if gkstate==0 then
      if gkn>=48 && gkn<=57 then
gki1    =               gkn-48
gkinst  =               100 + gki1*10 + gki0
gkstate =               1
        printk2         gkinst
      endif
    elseif gkstate==1 then
      if gkn>=48 && gkn<=57 then
gki0    =               gkn-48
gkinst  =               100 + gki1*10 + gki0
gkstate =               0
        printk2         gkinst
      endif
    endif
    
; --- playable notes --- ;
    if gkn>=97 && gkn<=122 then
kcps    =               333 + 888*(gkn-97)/26
        event           "i", gkinst, 0, gkdur, kcps, .22, 0
        printk2         kcps
    elseif gkn==45 then
gkdur   *=              .5
    elseif gkn==61 then
gkdur   *=              1.5
    endif
    
  endif
endif
        endin

; --- fm tone bank --- ;
        instr           100
idur    =               p3
ifrq    =               p4
iamp    =               p5
irvsnd  =               p6

knv     expseg          1, idur, .01

k2      unirand         1
k3      lineto          k2, .14
k4      lineto          k2, .081

a0      foscil          knv, ifrq, 1, .95+.1*k3, .75, 1
a1      foscil          knv, ifrq, 1, 1.9+k4*.2, .75, 1
a2      =               .8*a0 + .2*a1

aout    =               a2*iamp
        outall          aout
        
garvsnd +=              irvsnd*aout
        endin
        
; --- rumble instrument --- ;
        instr           101
idur    =               p3
ifrq    =               p4
iamp    =               p5
irvsnd  =               p6

knv     expseg          1, idur, .01

k2      unirand         1
k3      lineto          k2, .14
k4      lineto          k2, .081

a0      foscil          knv, ifrq, 1, .025+.041*k3, .75, 1

aout    =               a0*iamp
        outall          aout
        
garvsnd +=              irvsnd*aout
        endin
        
; --- test instrument --- ;
        instr           102
idur    =               p3
ifrq    =               p4
iamp    =               p5
irvsnd  =               p6

knv     expseg          1, idur, .01

k2      bexprnd         1
a0      foscil          knv, ifrq+k2*100, 1, .1, 1, 1

aout    =               a0*iamp
        outall          aout
        
garvsnd +=              irvsnd*aout
        endin
        
; --- fx --- ;
        instr           999
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
i 999 0 360 .44
</CsScore>
</CsoundSynthesizer>
