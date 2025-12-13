<CsoundSynthesizer>
<CsOptions>
-odac -m96
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

garvsnd         init            0
gadlysnd        init            0

gisteps         init            8
gkgrid[][]      init            gisteps,gisteps
gkr             init            0
gkc             init            0
gkstate         init            0
gk10th          init            0
gk100th         init            0
gkwn            init            0
gkwrap[]        fillarray       1,1,1,1, 1,1,1,1

gksqfa[][]      init            2,gisteps
gksqfa          fillarray       441,0,888,0, 661,0,0,0, \
                                1,0,1,0, 1,0,0,0
                                
gktick          init            0
gkmvol          init            .33

; ----- keyboard fu ----- ;
                instr           1
gkn, gkp        sensekey
idcy            =               2

    if changed(gkp) == 1 then
        if gkp == 1 then
            if gkstate==0 then
                if gkn>=49 && gkn<=56 then
gkr             =               gkn-49
gkstate         =               1
                endif
            elseif gkstate==1 then
                if gkn>=49 && gkn<=56 then
gkc             =               gkn-49
gkstate         =               2
                endif
            elseif gkstate==2 then
                if gkn>=49 && gkn<=57 then
gkwn            =               gkn-48
gkstate         =               3
                elseif gkn>=97 && gkn<=122 then
gkwn            =               gkn-97+10
gkstate         =               3
                else
gkstate         =               0
                printk2         gkstate
                endif
            elseif gkstate==3 then
                if gkn==46 then
gkstate         =               4
                else
gkstate         =               0
                printk2         gkstate
                endif
            elseif gkstate==4 then
                if gkn>=48 && gkn<=57 then
gk10th          =               gkn-48
gkstate         =               5
                else
gkstate         =               0
                printk2         gkstate
                endif
            elseif gkstate==5 then
                if gkn>=48 && gkn<=57 then
gk100th         =               gkn-48
                endif
gkgrid[gkr][gkc]=               gkwn + .1*gk10th + .01*gk100th
gkstate         =               0
                printk2         gkgrid[gkr][gkc]
            endif
            
; --- keyboard sounds --- ;
            if gkn==97 then
                event           "i", 10, 0, idcy, 640, .25
            elseif gkn==115 then
                event           "i", 10, 0, idcy, 540, .25
            elseif gkn==100 then
                event           "i", 10, 0, idcy, 440, .25
            endif
        endif
    endif
                endin
                
; ----- sequencer ----- ;
                instr           2
kbeat           metro           4
ktok            metro           .125

    if kbeat==1 then
                event           "i", 10, 0, .05, gksqfa[0][gktick], gksqfa[1][gktick]*gkmvol
                
gktick          +=              1
        if gktick>=gisteps then
gktick          =               0
        endif
    endif
    
                printarray      gkgrid, ktok, "%.2f", "grid"
                endin
                
; ----- instruments ----- ;
                instr           10
idur            =               p3
ifrq            =               p4
iamp            =               p5

k0              expseg          1, idur, .01
k1              oscil           k0, 2.22, 1

k2              expseg          1, idur, .01
a0              foscil          k0, ifrq*(1+.025*k1), 1, .22*k2, .84, 1

aout            =               iamp*a0
                outall          aout
                
garvsnd         +=              .5*aout
gadlysnd        +=              .5*aout
                endin
                
; ----- reverb ----- ;
                instr           9000
iamt            =               p4
idcy            =               p5

a1,a2           babo            garvsnd, 1, 1.4, .25, 3, 3, 8, idcy
                outs            iamt*a1, iamt*a2
                
garvsnd         =               0
                endin
                
; ----- delay ----- ;
                instr           9001
idly            =               p4
idcy            =               p5

a1              delay           gadlysnd, idly
a2              delay           gadlysnd, idly*2

aout            =               idcy*a1 + idcy*idcy*a2
                outall          aout
                
gadlysnd         =               0
                endin

</CsInstruments>
<CsScore>
f 1 0 512 9  1 1 0

i 1 0 360
i 2 0 360

i 9000 0 360 .55 .91
i 9001 0 360 .25 .40
</CsScore>
</CsoundSynthesizer>
