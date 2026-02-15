<CsoundSynthesizer>
<CsOptions>
--realtime -+rtaudio=alsa -odac -m1
</CsOptions>
<CsInstruments>
sr=44100
ksmps=10
nchnls=2
0dbfs=1

; --- globals --- ;
gkvol           init            .3333
gkbasef         init            432
gkpatch         init            10
gkdur           init            .91
gkmaxdur        init            5.6
gkmindur        init            .022
gkrvamt         init            .05
gasnd           init            0

gisativra       init            256/243
gire            init            9/8
giretivra       init            32/27
giga            init            81/64
gima            init            4/3
gimativra       init            1024/729
gipa            init            3/2
gipativra       init            128/81
gidha           init            27/16
gidhativra      init            16/9
gini            init            243/128

; --- key sensor --- ;
                instr           1
gkn,gkp         sensekey

if changed(gkp)==1 then
  if gkp==1 then
                printk2         gkn
                
;; // volume level
    if gkn==45 then
gkvol           *=              2/3
    elseif gkn==61 then
gkvol           *=              1.5

        if gkvol>1 then
        gkvol   =               .99
        endif
      
;; // reverb amount
    elseif gkn==62 then
gkrvamt         *=              2/3
    elseif gkn==63 then
gkrvamt         *=              1.5

    ; limit max rvb amt
        if gkrvamt>.91 then
        gkrvamt =               .91
        endif
                printk2         gkrvamt

;; // decay duration
    elseif gkn==107 then
kd              =               .75*gkdur
      if kd<gkmindur then
        gkdur   =               gkmindur
      else
        gkdur   =               kd
      endif

    elseif gkn==108 then
kd              =               1.5*gkdur
      if kd>gkmaxdur then
gkdur           =               gkmaxdur
      else
gkdur           =               kd
      endif

;; ------------------- ;;
;; // patch changes // ;;
;; ------------------- ;;
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
    elseif gkn==55 then
gkpatch         =               16
    elseif gkn==56 then
gkpatch         =               17
    elseif gkn==57 then
gkpatch         =               18
    elseif gkn==48 then
gkpatch         =               19

;; // octave OR +/- fifth
    elseif gkn==91 then
gkbasef         *=              .5

    elseif gkn==93 then
gkbasef         *=              2

    elseif gkn==59 then
gkbasef         *=              2/3

    elseif gkn==39 then
gkbasef         *=              3/2

;; ----------- ;;
;; // drums // ;;
;; ----------- ;;
    elseif gkn==113 then
                event           "i", 100, 0, gkdur, 200
    elseif gkn==119 then
                event           "i", 110, 0, gkdur, 2
    elseif gkn==101 then
                event           "i", 120, 0, gkdur, 2
    elseif gkn==114 then
                event           "i", 101, 0, gkdur, 200
    elseif gkn==116 then
                event           "i", 121, 0, gkdur, 311
    elseif gkn==121 then
                event           "i", 122, 0, gkdur, 640
                
;; ----------- ;;
;; // pitch // ;;
;; ----------- ;;
    elseif gkn==122 then
                event           "i", gkpatch, 0, gkdur, gkbasef
                
    elseif gkn==115 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gisativra
                
    elseif gkn==120 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gire
                
    elseif gkn==100 then
                event           "i", gkpatch, 0, gkdur, gkbasef*giretivra
                
    elseif gkn==99 then
                event           "i", gkpatch, 0, gkdur, gkbasef*giga
                
    elseif gkn==118 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gima
                
    elseif gkn==103 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gimativra
                
    elseif gkn==98 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gipa
                
    elseif gkn==104 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gipativra
                
    elseif gkn==110 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gidha
                
    elseif gkn==106 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gidhativra
                
    elseif gkn==109 then
                event           "i", gkpatch, 0, gkdur, gkbasef*gini
                
    elseif gkn==44 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2
                
;; // 2nd octave
    elseif gkn==90 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2
                
    elseif gkn==83 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gisativra
                
    elseif gkn==88 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gire
                
    elseif gkn==68 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*giretivra
                
    elseif gkn==67 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*giga
                
    elseif gkn==86 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gima
                
    elseif gkn==71 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gimativra
                
    elseif gkn==66 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gipa
                
    elseif gkn==72 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gipativra
                
    elseif gkn==78 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gidha
                
    elseif gkn==74 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gidhativra
                
    elseif gkn==77 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*gini
                
    elseif gkn==60 then
                event           "i", gkpatch, 0, gkdur, gkbasef*2*2
    endif
  endif
endif

                endin

; ----------------------------------- ;
; ---------- tone patches ----------- ;
; ----------------------------------- ;

;; // ------- noise sculpted tone -------- //
                instr           10
idur            =               p3
kfq             =               p4

iat             =               .0054*idur
idc             =               (1-iat)*idur
k0              expseg          .05,iat, 1, idc,.01

        ; lin dist noise
a0              unirand         2
a1              =               a0-1

        ; reso fltr
ares            reson           a1,kfq,9
asig            balance         ares,a1
aflt            buthp           asig,80
aout            =               k0*aflt

                outall          aout*gkvol
gasnd           +=              aout*gkvol
                endin
                
;; // -------- lofi sine --------- //
                instr           11
idur            =               p3
kfq             =               p4

k0              expseg          1,idur,.01

        ; lfo bell
a0              oscil           k0,kfq,2

        ; delay fu
abuf            delayr          .01
ko0             oscil           1,.144,1
ad0             deltap          .005+.0027*ko0
afb             =               .44*ad0 + a0
                delayw          afb

        ; out
                outall          ad0*gkvol
gasnd           +=              ad0*gkvol
                endin
                
;; // -------------- dtun sawtooth -------------- //
                instr           12
kfq             =               p4
idur            =               p3

k0              expseg          1,idur,.02

        ; env
iat             =               .044
idc             =               1-iat
k1              expseg          .11,iat*idur, 1, idc*idur,.01

        ; vibrato
kvib            oscil           1,2.66,1
kamt            =               .0051
kfvb            =               kfq * (1 + kamt*kvib)

        ; dtuning
kdtun           =               .0015
a0              vco2            k0,(1+kdtun)*kfvb
a1              vco2            k0,(1-kdtun)*kfvb
        ; fltr
a0f             butlp           a0,4500*k1
a1f             butlp           a1,4300*k1

aout            =               (a0f+a1f)/2
                outall          aout*gkvol
                
gasnd           +=              aout*gkvol
                endin
                
;; // ---------- fm arrives --------------- //
                instr           13
idur            =               p3
ifrq            =               p4

knv             expseg          1, idur, .01

k2              unirand         1
k3              lineto          k2, .14
k4              lineto          k2, .081

a0              foscil          knv, ifrq, 1, .95+.1*k3, .75, 1
a1              foscil          knv, ifrq, 1, 1.9+k4*.2, .75, 1
a2              =               .8*a0 + .2*a1

aout            =               a2*gkvol
                outall          aout
        
gasnd           +=              aout
                endin
                
;; // --------- rumble instrument ---------- //
                instr           14
idur            =               p3
ifrq            =               p4

knv             expseg          1, idur, .01

k2              unirand         1
k3              lineto          k2, .14
k4              lineto          k2, .081

a0              foscil          knv, ifrq, 1, .025+.041*k3, .75, 1

aout            =               a0*gkvol
                outall          aout
        
gasnd           +=              aout
                endin
                
;; // ----------- adsynt octave bell ------------ //
                instr           15
        idur    =               p3
        ifrq    =               p4

        icnt    =               5
        kndex   =               0
        klfo    oscil           1,4.18,1
        
;; harmonic setup loop
loop:
        kdf     pow             .75,kndex
        kb      =               2.00+.0051*klfo*kdf
        khf     pow             kb,kndex
        kha     pow             .5,kndex+1
        
                tablew          khf,kndex,10
                tablew          kha,kndex,11
                
        kndex   +=              1
if kndex<icnt kgoto loop

;; enveloping
        k0      expseg          1,idur,.01
        asig    adsynt          k0,ifrq, 1,10,11, icnt
        
                outall          asig*gkvol
gasnd           +=              asig*gkvol
                endin

;; // --------------- dtun pluck --------------- //
                instr           16
idur            =               p3
ifrq            =               p4

k0              expseg          1,idur,.09

        ; fq vib
k2              linseg          .125,idur,1
k1              oscil           k2,4.1,1
kva             =               .027
kfv             =               ifrq*(1+kva*k1)

        ; dtuned
kdt             =               .0022
kfq1            =               kfv*(1-kdt)
kfq2            =               kfv*(1+kdt)

        ; plucks
a0              pluck           k0,kfq1,ifrq, 0,1
a1              pluck           k0,kfq2,ifrq, 0,1
a2              pluck           k0,kfv/2,ifrq/2, 0,1

        ; mixer
ioct            =               .132
inor            =               (1-ioct)/2
a3              =               inor*a0 + inor*a1 + ioct*a2

                outall          a3*gkvol
gasnd           +=              a3*gkvol
                endin
                
;; // ------------ amp mod tri harp ------------- //

                instr           17
idur            =               p3
ifrq            =               p4

        ; env
k0              expseg          1,idur,.01

        ; syn
k1              oscil           1,.11,1
kmodf           =               81+64*k1
amod            oscil           1,kmodf,1

kmwet           =               .084
kmdry           =               1-kmwet

k3              linseg          0,idur/2,1
k2              oscil           1,3.9,1
kfq             =               ifrq*(1+.0048*k2*k3)

ifn             =               21
a0              oscil           k0,kfq*0.999,ifn
a1              oscil           k0,kfq*1.001,ifn

a2              =               (a0+a1)/2
a2m             =               a2*(kmdry + kmwet*amod)
amono           =               a2m

        ; out
aout            =               amono*gkvol
                outall          aout
gasnd           +=              aout
                endin


; ---- - - - - - - ---- ;
;     drum patches      ;
; ---- - - - - - - ---- ;

;; // bass drum
                instr           100
idur            =               p3
ifrq            =               p4

k0              expseg          1,idur,.01
a0              oscil           k0,k0*ifrq,1

                outall          a0*gkvol
                
gasnd           +=              a0*gkvol
                endin
                
;; // bd 2 lofi
                instr           101
idur            =               p3
ifrq            =               p4

k0              expseg          1,idur,.01
a0              oscil           k0,k0*ifrq,3

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
                
;; // snares
                instr           120
idur            =               p3
ibeta           =               p4

k0              expseg          1,idur,.01
a0              fractalnoise    k0,ibeta

a1              butlp           a0,8888
a2              buthp           a1,2222

alfo            oscil           1,.14,1
alfu            =               (1+alfo)/2
kfb             =               .03
afl             flanger         a2,.03*alfu,kfb
amix            =               .4*a2+.6*afl

                outall          amix*gkvol
                
gasnd           +=              amix*gkvol
                endin
                
;; // sn 2 lofi
                instr           121
idur            =               p3
ifrq            =               p4
ifn             =               9

k0              expseg          1,idur,.01
k1              oscil           1,22,ifn
kfq             =               ifrq*(1+.5*k1)
a0              oscil           k0,kfq,ifn

                outall          a0*gkvol
gasnd           +=              a0*gkvol
                endin
                
;; // sn 3
                instr           122
idur            =               p3
ifrq            =               p4
ifn             =               9
iwav            =               2

k0              expseg          1,idur,.01
k1              oscil           1,15,ifn
kfq             =               ifrq*(1+.33*k1)
a0              oscil           k0,kfq,iwav

                outall          a0*gkvol
gasnd           +=              a0*gkvol
                endin
                
;; // fx
                instr           900
a0,a1           babo            gasnd, 2.4,1.1,4.8, 9,4,19
aout            =               (a0+a1)/2

                outall          gkrvamt*aout
                
gasnd           =               0
                endin

</CsInstruments>
<CsScore>
f 1 0 1024  9  1 1 0
f 2 0   32  9  1 1 0

; bd2
f 3 0   64  9  1 5 0  1.108 4 0

; noise tables
f 9 0   64 21  3 1

;; adsynt
; frqs
f 10 0  32 7  0 32 0
; amps
f 11 0  32 7  0 32 0

;; fractal tri waves
f 20 0 512 7  0 98 1 10 .9 5 .95 5 .9 10 1 256 -1 10 -.9 5 -.95 5 -.9 10 -1 98 0
f 21 0 128 7  0 22 1 5 .8 5 1 64 -1 5 -.8 5 -1 22 0

; key ctl
i 1 0 7200

; fx
i 900 0 7200
</CsScore>
</CsoundSynthesizer>
