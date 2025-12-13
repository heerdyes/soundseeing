#!/usr/bin/env python3
prjnm=input('project -> ')

with open(prjnm+".csd", 'w') as fw:
    print('''<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; ----- keyboard fu ----- ;
                instr           1
gkn, gkp        sensekey

    if changed(gkp) == 1 then
        if gkp == 1 then
            if gkn==97 then
                event           "i", 10, 0, .5, 440, .25
                event           "i", 10, 1, .5, 880, .25
            endif
        endif
    endif
                endin
                
; ----- instruments ----- ;
                instr           10
idur            =               p3
ifrq            =               p4
iamp            =               p5

k0              expseg          1,idur,.01
a0              oscil           k0,ifrq*k0,1

aout            =               iamp*a0
                outall          aout
                endin

</CsInstruments>
<CsScore>
f 1 0 512 9  1 1 0

i 1 0 360
</CsScore>
</CsoundSynthesizer>
''', file=fw)
