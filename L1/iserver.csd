<CsoundSynthesizer>

<CsOptions>
-+rtaudio=jack -odac -b256 -B512 -m128
</CsOptions>

<CsInstruments>

sr=48000
0dbfs=1
ksmps=32
nchnls=2

gih     OSCinit     7000
        turnon      1

;-------------------- osc listener --------------------;
        instr       1
kamp    init        0
kinst   init        0
kdur    =           0.05
kcv4    init        0
kp5     init        72
kp6     init        48
        nxtmsg:
kk      OSClisten   gih, "/ch/1", "f", kcv4
        if (kk==0)  then
        goto        done
        endif
        event       "i", 100, 0, kdur, kcv4/10, kp5, kp6
        kgoto       nxtmsg
        done:
endin

;----------------- lofi kick drum --------------------;
        instr       100
iamp    =           p4*0.2
imhi    =           p5
imlo    =           p6
ifhi    mtof        imhi
iflo    mtof        imlo
iwfn    =           3
k1      line        ifhi, p3, iflo
k2      line        ifhi+22, p3, iflo
a1      oscil       iamp, k1, iwfn
a2      oscil       iamp, k2, iwfn
knv     linen       1, p3/10, p3, p3/10
        outs        a1*knv, a2*knv
        endin

;---------------- bass synth ----------------------;
        instr       101
idur    =           p3
iamp    =           p4
imd1    =           p5
imd2    =           p6
ifrq    mtof        imd1
iwfn    =           3
a1      oscil       iamp, ifrq, iwfn
a2      oscil       iamp, ifrq+5, iwfn
knv     linen       1, idur/10, idur, idur/10
        outs        a1*knv, a2*knv
        endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1                  ; hifi sine wave
f 2 0  256  10 1                  ; lofi sine wave
f 3 0  256   7 0 64 1 128 -1 64 0 ; triangle wave

f 0 3600                          ; wait for 1 hour doing nothing
e
</CsScore>
</CsoundSynthesizer>
