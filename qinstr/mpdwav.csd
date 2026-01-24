<CsoundSynthesizer>
<CsOptions>
--realtime -+rtaudio=alsa -iadc -odac -Ma -m2
</CsOptions>
<CsInstruments>
sr=44100
ksmps=16
nchnls=2
0dbfs=1

                        massign                 0,0
                        pgmassign               0,0

; ----------------- ;
;      global       ;
; ----------------- ;

gasnd                   init                    0

gkinstbase              init                    100
gkinstoff               init                    0

gkvoxlp                 init                    3333

gkfxdlyt                init                    .4
gkfxdlyfb               init                    .45
gkdlyamt                init                    .25

giaudix                 init                    7.7
giaudiy                 init                    16.7
giaudiz                 init                    5.3
gkaudimicx              init                    3.3
gkaudimicy              init                    1.3
gkaudimicz              init                    1.9
gkrvbamt                init                    .15

gkatkmax                init                    .25
gkrelmax                init                    2
gkatk                   init                    .022
gkrel                   init                    1.8
gkoct                   init                    0

; -------------- - - - - ------------------ ;
;                slider gui                 ;
; -------------- - - - - ------------------ ;
                        FLpanel                 "mpdwav", 1280, 720, 320, 180, 0, 1
iexp                    =                       0 ; // linear: 0 // log: -1
itype                   =                       5 ; // graphic type (5='nice' slider)
idisp                   =                       -1 ; // display handle (-1=not used)

iwidth                  =                       1080
iheight                 =                       32
ix                      =                       100
iy                      =                       48

gkdlyamt, ihdly         FLslider                "delay amt",  0,.94, iexp,itype,idisp, iwidth,iheight, ix,iy
gkrvbamt, ihrvb         FLslider                "reverb amt", 0,.88, iexp,itype,idisp, iwidth,iheight, ix,iy*2
gkvoxlp, ihvxlp         FLslider                "vox lopass", 1111,8888, iexp,itype,idisp, iwidth,iheight, ix,iy*3
                        FLpanelEnd
                        
                        FLrun

                        FLsetVal_i .25, ihdly
                        FLsetVal_i .11, ihrvb
                        FLsetVal_i 2222, ihvxlp

; ----------------- ;
;      kbdmon       ;
; ----------------- ;
                        instr                   1
gkasc                   FLkeyIn
ktrig                   changed                 gkasc

  if ktrig==1 then
    if gkasc==91 then
      gkoct             -=                      12
                        
    elseif gkasc==93 then
      gkoct             +=                      12
      
    elseif gkasc>=97 && gkasc<=122 then
      gkinstoff         =                       gkasc-97
      
    endif

                        printk2                 gkasc
  endif
                        endin

; ----------------- ;
;      mpdmon       ;
; ----------------- ;
                        instr                   2
ks,kc,kd1,kd2           midiin

  if ks==144 then
    event "i", gkinstbase+gkinstoff,0,gkatk+gkrel, kd1+gkoct,kd2, gkatk,gkrel
                        
  elseif ks==176 then
    if kd1==3 then
      gkatk             =                       .001+gkatkmax*kd2/128
      
    elseif kd1==9 then
      gkrel             =                       .001+gkrelmax*kd2/128
      
    endif
    
    printks "[%d] cc: %d, %d\n", .05, kc,kd1,kd2
    
  endif
  
                        endin
                        
; ---------- ;
;   notif    ;
; ---------- ;
                        instr                   44
knv                     expseg                  1,p3,.01
aout                    oscil                   knv,1200,1
                        outall                  aout*p4
                        endin
                        
; -------------- ;
;     syn: a     ;
; -------------- ;
                        instr                   100
idur                    =                       p3
inote                   =                       p4
ivelo                   =                       p5
iatk                    =                       p6
irel                    =                       p7

ifrq                    =                       cpsmidinn(inote)
iampraw                 =                       ivelo/128
iamp                    =                       .02+iampraw/3

        ; synth
knv                     expseg                  .01,iatk,1,irel,.01
a0                      oscil                   knv,ifrq,1

asub                    oscil                   .5,4*ifrq/5,1
asubu                   =                       asub+.5

aout                    =                       iamp*a0*asubu
                        outall                  aout
                        
gasnd                   +=                      aout
                        endin
                        
; ---------------------- ;
;    syn: b // saw       ;
; ---------------------- ;
                        instr                   101
idur                    =                       p3
inote                   =                       p4
ivelo                   =                       p5
iatk                    =                       p6
irel                    =                       p7

ifrq                    =                       cpsmidinn(inote)
iampraw                 =                       ivelo/128
iamp                    =                       .02+iampraw/3

        ; synth
knv                     expseg                  .01,iatk,1,irel,.01

a0                      vco2                    knv,ifrq*0.999
a1                      vco2                    knv,ifrq*1.001

aout                    =                       iamp*(a0+a1)/2
                        outall                  aout
                        
gasnd                   +=                      aout
                        endin
                        
; ------------------------ ;
;    syn: c // snare       ;
; ------------------------ ;
                        instr                   102
idur                    =                       p3
inote                   =                       p4
ivelo                   =                       p5
iatk                    =                       p6
irel                    =                       p7

ifrq                    =                       cpsmidinn(inote)
iampraw                 =                       ivelo/128
iamp                    =                       .02+iampraw/3

ibeta                   =                       .5

k0                      expseg                  .01,iatk,1,irel,.01
a0                      fractalnoise            k0,ibeta

a1                      butlp                   a0,8888
a2                      buthp                   a1,2222

alfo                    oscil                   1,.14,1
alfu                    =                       (1+alfo)/2
kfb                     =                       .03
afl                     flanger                 a2,.03*alfu,kfb
amix                    =                       .4*a2+.6*afl

aout                    =                       amix*iamp
                        outall                  aout
                        
gasnd                   +=                      aout
                        endin
                        
; --------------- ;
;    syn: d       ;
; --------------- ;
                        instr                   103
idur                    =                       p3
inote                   =                       p4
ivelo                   =                       p5
iatk                    =                       p6
irel                    =                       p7

ifrq                    =                       cpsmidinn(inote)
iampraw                 =                       ivelo/128
iamp                    =                       .02+iampraw/3

        ; synth
knv                     expseg                  .01,iatk,1,irel,.01
a0                      oscil                   knv,knv*ifrq,1

aout                    =                       iamp*a0
                        outall                  aout
                        
gasnd                   +=                      aout
                        endin
                        
; ---------------------------- ;
;             vox              ;
; ---------------------------- ;
                        instr                   500
ain                     inch                    1
ifftsz                  =                       1024
ihopsz                  =                       256

fs1,fsi2                pvsifd                  ain, ifftsz,ihopsz, 1
fst                     partials                fs1,fsi2, .03, 1,3, 500

ifn1                    =                       4
ifn0                    =                       2
a1                      resyn                   fst, 1,1, 500,ifn1
ktrk                    oscil                   1,.1,1
a0                      resyn                   fst, 1,2, 330+100*ktrk,ifn0

asyn                    =                       81*a1/100 + 19*a0/100

admp                    delayr                  .008
k0                      oscil                   1,.04,1
adly                    deltap                  .004+.0007*k0
afb                     =                       .28*adly+asyn
                        delayw                  afb
                        
aout                    butlp                   afb, gkvoxlp
                        outall                  aout
                        
gasnd                   +=                      aout
                        endin
                        
; ---------------- - - - - - --------------- ;
;                   fx inst                  ;
; ---------------- - - - - - --------------- ;

                        instr                   900
;; // feedback delay
admp                    delayr                  1

k0                      oscil                   1,.05,1
adly                    deltap                  gkfxdlyt+.01*k0
afb                     =                       gkfxdlyfb*adly+gasnd

                        delayw                  afb
adlyout                 =                       afb*gkdlyamt

;; // reverb
a0,a1                   babo                    gasnd, gkaudimicx,gkaudimicy,gkaudimicz, giaudix,giaudiy,giaudiz
arvb                    =                       (a0+a1)/2
arvbout                 =                       arvb*gkrvbamt

;; // fx out
                        outall                  adlyout+arvbout
                        
gasnd                   =                       0
                        endin

</CsInstruments>
<CsScore>
f 1 0 1024  9  1 1 0

f 2 0 512   7  0 128 1 256 -1 128 0
f 3 0 256   7  0 16 1 96 1 32 -1 96 -1 16 0
f 4 0 256   7  1 256 -1

i 1 0 3600
i 2 0 3600
i 500 0 3600
i 900 0 3600
</CsScore>
</CsoundSynthesizer>

