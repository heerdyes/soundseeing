<CsoundSynthesizer>
<CsOptions>
-+rtaudio=jack -odac
</CsOptions>
<CsInstruments>
sr=44100
ksmps=32
nchnls=2
0dbfs=1

; --- globals --- ;
gkvol           init            .3333
gkbasef         init            440
gkpatch         init            10
gkdur           init            .44
gasnd           init            0

; --- key sensor --- ;
                instr           1
gkn,gkp         sensekey

if changed(gkp)==1 then
  if gkp==1 then
                printk2         gkn
                
;; // volume level
    if gkn==45 then
gkvol           *=              .666

    elseif gkn==61 then
gkvol           *=              1.5

      if gkvol>1 then
gkvol           =               .99
      endif
      
;; // decay duration
    elseif gkn==107 then
gkdur           *=              .75
    elseif gkn==108 then
gkdur           *=              1.5

;; // patch changes
    elseif gkn==49 then
gkpatch         =               10
    elseif gkn==50 then
gkpatch         =               11
    elseif gkn==51 then
gkpatch         =               12
    elseif gkn==52 then
gkpatch         =               13
    elseif gkn==53 then
gkpatch         =               14
    elseif gkn==54 then
gkpatch         =               15

;; // octave OR +/- fifth
    elseif gkn==91 then
gkbasef         *=              .5

    elseif gkn==93 then
gkbasef         *=              2

    elseif gkn==59 then
gkbasef         *=              .75

    elseif gkn==39 then
gkbasef         *=              1.5

;; // drums
    elseif gkn==113 then
                event           "i", 100, 0, gkdur, 200
    elseif gkn==119 then
                event           "i", 110, 0, gkdur, 2
                
;; // pitch
    elseif gkn==122 then
                event           "i", gkpatch, 0, gkdur, gkbasef
                
    elseif gkn==115 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2187/2048
                
    elseif gkn==120 then
                event           "i", gkpatch, 0, gkdur, gkbasef*9/8
                
    elseif gkn==100 then
                event           "i", gkpatch, 0, gkdur, gkbasef*19683/16384
                
    elseif gkn==99 then
                event           "i", gkpatch, 0, gkdur, gkbasef*81/64
                
    elseif gkn==118 then
                event           "i", gkpatch, 0, gkdur, gkbasef*4/3
                
    elseif gkn==103 then
                event           "i", gkpatch, 0, gkdur, gkbasef*729/512
                
    elseif gkn==98 then
                event           "i", gkpatch, 0, gkdur, gkbasef*3/2
                
    elseif gkn==104 then
                event           "i", gkpatch, 0, gkdur, gkbasef*6561/4096
                
    elseif gkn==110 then
                event           "i", gkpatch, 0, gkdur, gkbasef*27/16
                
    elseif gkn==106 then
                event           "i", gkpatch, 0, gkdur, gkbasef*59049/32768
                
    elseif gkn==109 then
                event           "i", gkpatch, 0, gkdur, gkbasef*243/128
                
    elseif gkn==44 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2
                
;; // 2nd octave
    elseif gkn==90 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2
                
    elseif gkn==83 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*2187/2048
                
    elseif gkn==88 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*9/8
                
    elseif gkn==68 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*19683/16384
                
    elseif gkn==67 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*81/64
                
    elseif gkn==86 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*4/3
                
    elseif gkn==71 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*729/512
                
    elseif gkn==66 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*3/2
                
    elseif gkn==72 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*6561/4096
                
    elseif gkn==78 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*27/16
                
    elseif gkn==74 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*59049/32768
                
    elseif gkn==77 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*243/128
                
    elseif gkn==60 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*2
    endif
  endif
endif

                endin

; --- tone patches --- ;
                instr           10
kfq             =               p4

k0              expseg          1,p3,.01
a0              oscil           k0,kfq,1

                outall          a0*gkvol
                
gasnd           +=              a0*gkvol
                endin
                
;; // det. sawtooth obviously
                instr           11
kfq             =               p4
idur            =               p3

k0              expseg          1,idur,.02

a0              vco2            k0,1.001*kfq
a1              vco2            k0,0.999*kfq
a0f             butlp           a0,3300*k0
a1f             butlp           a1,2900*k0

aout            =               (a0f+a1f)/2
                outall          aout*gkvol
                
gasnd           +=              aout*gkvol
                endin
                
; --- drum patches --- ;
                instr           100
idur            =               p3
ifrq            =               p4

k0              expseg          1,idur,.025
a0              oscil           k0,k0*ifrq,1

                outall          a0*gkvol
                
gasnd           +=              a0*gkvol
                endin
                
;; // noise hats
                instr           110
idur            =               p3
ibeta           =               p4

k0              expseg          1,idur,.01
a0              fractalnoise    k0,ibeta
a1              buthp           a0,8800

                outall          a1*gkvol
                
gasnd           +=              a1*gkvol
                endin
                
;; // fx
                instr           900
iamt            =               p4

a0,a1           babo            gasnd, 2.4,1.1,4.8, 9,4,19
aout            =               (a0+a1)/2

                outall          iamt*aout
                
gasnd           =               0
                endin

</CsInstruments>
<CsScore>
f 1 0 512 9  1 4 0  2 1 0  3 2 0

i 1 0 3600

i 900 0 3600 .22
</CsScore>
</CsoundSynthesizer>

