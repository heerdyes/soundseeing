<CsoundSynthesizer>
<CsOptions>
--realtime -+rtaudio=alsa -odac -m2
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


; ----- tables ----- ;
gixpdcy         ftgen           0,0, 256, 5, 1,64,.05,192,.001
gicos           ftgen           0,0, 512, 9, 1,1,0
gisin           ftgen           0,0, 512, 10, 1


; ----- gui ----- ;
giww            =               1920
gihh            =               1080
giw             =               1600
gih             =               900
gix             =               (giww-giw)/2
giy             =               (gihh-gih)/2
gislh           =               18
gitxh           =               20
gitxw           =               220
giygap          =               50

                FLcolor         0,0,0
                FLpanel         "enterphase", giw,gih, gix,giy
                
                FLcolor         180,180,180
                FLlabel         16, 6,6, 255,180,36
                
gk00,ih00       FLtext          "clk_frq",  .1,5.4,  .01,1,   gitxw,gitxh, 20,30+giygap*0

;; // bd
gk11,ih1a       FLtext          "bd_clk",   .5,  8,  .01,1,   gitxw,gitxh, 20,30+giygap*2
gk12,ih1b       FLtext          "bd_pch",  100,420,    1,1,   gitxw,gitxh, 20,30+giygap*3
gk13,ih1c       FLtext          "bd_phs",    0,  1,  .01,1,   gitxw,gitxh, 20,30+giygap*4
gk14,ih1d       FLtext          "bd_amp",    0,.75,  .01,1,   gitxw,gitxh, 20,30+giygap*5
gk15,ih1e       FLtext          "bd_dur",  .03,.95, .001,1,   gitxw,gitxh, 20,30+giygap*6
gk15p,ih1e0     FLtext          "bd_pr",     0,  1,  .01,1,   gitxw,gitxh, 20,30+giygap*7

gk16,ih1f       FLtext          "bd2_clk",  .5,  8,  .01,1,   gitxw,gitxh, 20,30+giygap*9
gk17,ih1g       FLtext          "bd2_pch", 100,420,    1,1,   gitxw,gitxh, 20,30+giygap*10
gk18,ih1h       FLtext          "bd2_phs",   0,  1,  .01,1,   gitxw,gitxh, 20,30+giygap*11
gk19,ih1i       FLtext          "bd2_amp",   0,.75,  .01,1,   gitxw,gitxh, 20,30+giygap*12
gk1a,ih1j       FLtext          "bd2_dur", .03,.95, .001,1,   gitxw,gitxh, 20,30+giygap*13
gk1ap,ih1j0     FLtext          "bd2_pr",    0,  1,  .01,1,   gitxw,gitxh, 20,30+giygap*14

;; // hh
gk21,ih2a       FLtext          "hh_clk",   .5,  8, .01,1,    gitxw,gitxh, 20+gitxw+20,30+giygap*2
gk22,ih2b       FLtext          "hh_lp", 3333,9999,   5,1,    gitxw,gitxh, 20+gitxw+20,30+giygap*3
gk23,ih2c       FLtext          "hh_phs",    0,  1, .01,1,    gitxw,gitxh, 20+gitxw+20,30+giygap*4
gk24,ih2d       FLtext          "hh_amp",    0,.75, .01,1,    gitxw,gitxh, 20+gitxw+20,30+giygap*5
gk25,ih2e       FLtext          "hh_dur",  .03,.95, .01,1,    gitxw,gitxh, 20+gitxw+20,30+giygap*6
gk25p,ih2e0     FLtext          "hh_pr",     0,  1, .01,1,    gitxw,gitxh, 20+gitxw+20,30+giygap*7

gk26,ih2f       FLtext          "hh2_clk",  .5,   8, .01,1,   gitxw,gitxh, 20+gitxw+20,30+giygap*9
gk27,ih2g       FLtext          "hh2_lp", 3333,9999,   5,1,   gitxw,gitxh, 20+gitxw+20,30+giygap*10
gk28,ih2h       FLtext          "hh2_phs",    0,  1, .01,1,   gitxw,gitxh, 20+gitxw+20,30+giygap*11
gk29,ih2i       FLtext          "hh2_amp",    0,.75, .01,1,   gitxw,gitxh, 20+gitxw+20,30+giygap*12
gk2a,ih2j       FLtext          "hh2_dur",  .03,.95, .01,1,   gitxw,gitxh, 20+gitxw+20,30+giygap*13
gk2ap,ih2j0     FLtext          "hh2_pr",     0,  1, .01,1,   gitxw,gitxh, 20+gitxw+20,30+giygap*14

;; // sn
gk31,ih3a       FLtext          "sn_clk",  .5,   8, .01,1,    gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*2
gk32,ih3b       FLtext          "sn_lp", 1111,9999,   5,1,    gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*3
gk33,ih3c       FLtext          "sn_phs",    0,  1, .01,1,    gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*4
gk34,ih3d       FLtext          "sn_amp",    0,.75, .01,1,    gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*5
gk35,ih3e       FLtext          "sn_dur",  .03,.95, .01,1,    gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*6
gk35p,ih3e0     FLtext          "sn_pr",     0,  1, .01,1,    gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*7

gk36,ih3f       FLtext          "sn2_clk",  .5,   8, .01,1,   gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*9
gk37,ih3g       FLtext          "sn2_lp", 1111,9999,   5,1,   gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*10
gk38,ih3h       FLtext          "sn2_phs",    0,  1, .01,1,   gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*11
gk39,ih3i       FLtext          "sn2_amp",    0,.75, .01,1,   gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*12
gk3a,ih3j       FLtext          "sn2_dur",  .03,.95, .01,1,   gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*13
gk3ap,ih3j0     FLtext          "sn2_pr",     0,  1, .01,1,   gitxw,gitxh, 20+(gitxw+20)*2,30+giygap*14

;; // fm
gk41,ih4a       FLtext          "fm_clk",  .5,   8, .01,1,    gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*2
gk42,ih4b       FLtext          "fm_frq",  270,2222,  5,1,    gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*3
gk43,ih4c       FLtext          "fm_phs",    0,  1, .01,1,    gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*4
gk44,ih4d       FLtext          "fm_amp",    0,.75, .01,1,    gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*5
gk45,ih4e       FLtext          "fm_dur",  .03,.95, .01,1,    gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*6
gk45p,ih4e0     FLtext          "fm_pr",     0,  1, .01,1,    gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*7

gk46,ih4f       FLtext          "fm_car",   .1,   2, .01,1,   gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*9
gk47,ih4g       FLtext          "fm_mod",   .1,   2, .01,1,   gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*10
gk48,ih4h       FLtext          "fm_ndx",   .1,   2, .01,1,   gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*11
gk49,ih4i       FLtext          "fm_lfo_f",   0, 10, .01,1,   gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*12
gk4a,ih4j       FLtext          "fm_lfo_a",   0,  1, .01,1,   gitxw,gitxh, 20+(gitxw+20)*3,30+giygap*13

;; // fm2
gk51,ih5a       FLtext          "fm2_clk",  .5,   8, .01,1,   gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*2
gk52,ih5b       FLtext          "fm2_frq",  270,2222,  5,1,   gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*3
gk53,ih5c       FLtext          "fm2_phs",    0,  1, .01,1,   gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*4
gk54,ih5d       FLtext          "fm2_amp",    0,.75, .01,1,   gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*5
gk55,ih5e       FLtext          "fm2_dur",  .03,.95, .01,1,   gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*6
gk55p,ih5e0     FLtext          "fm2_pr",     0,  1, .01,1,   gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*7

gk56,ih5f       FLtext          "fm2_car",   .1,   2, .01,1,  gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*9
gk57,ih5g       FLtext          "fm2_mod",   .1,   2, .01,1,  gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*10
gk58,ih5h       FLtext          "fm2_ndx",   .1,   2, .01,1,  gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*11
gk59,ih5i       FLtext          "fm2_lfo_f",  0,  10, .01,1,  gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*12
gk5a,ih5j       FLtext          "fm2_lfo_a",  0,   1, .01,1,  gitxw,gitxh, 20+(gitxw+20)*4,30+giygap*13

                FLpanelEnd
                
                FLrun
                
        ; init
                FLsetVal_i      1,   ih00
; // bd         
                FLsetVal_i      1,   ih1a
                FLsetVal_i      200, ih1b
                FLsetVal_i      0,   ih1c
                FLsetVal_i      .12, ih1d
                FLsetVal_i       .1, ih1e
                FLsetVal_i        1, ih1e0
                
                FLsetVal_i      1,   ih1f
                FLsetVal_i      300, ih1g
                FLsetVal_i      0,   ih1h
                FLsetVal_i      0,   ih1i
                FLsetVal_i       .1, ih1j
                FLsetVal_i        1, ih1j0
; // hh         
                FLsetVal_i      1,    ih2a
                FLsetVal_i      6400, ih2b
                FLsetVal_i      0,    ih2c
                FLsetVal_i      0,    ih2d
                FLsetVal_i       .1,  ih2e
                FLsetVal_i        1,  ih2e0
                
                FLsetVal_i      1,    ih2f
                FLsetVal_i      8400, ih2g
                FLsetVal_i      0.25, ih2h
                FLsetVal_i      0,    ih2i
                FLsetVal_i       .1,  ih2j
                FLsetVal_i       1 ,  ih2j0
; // sn         
                FLsetVal_i      .5,   ih3a
                FLsetVal_i      6400, ih3b
                FLsetVal_i      0,    ih3c
                FLsetVal_i      0,    ih3d
                FLsetVal_i       .1,  ih3e
                FLsetVal_i        1,  ih3e0
                
                FLsetVal_i      .5,   ih3f
                FLsetVal_i      4400, ih3g
                FLsetVal_i      0.25, ih3h
                FLsetVal_i      0,    ih3i
                FLsetVal_i       .1,  ih3j
                FLsetVal_i        1,  ih3j0
; // fm
                FLsetVal_i      1,    ih4a
                FLsetVal_i      1000, ih4b
                FLsetVal_i      0,    ih4c
                FLsetVal_i      0,    ih4d
                FLsetVal_i      .1,   ih4e
                FLsetVal_i      1,    ih4e0
                
                FLsetVal_i      1,   ih4f
                FLsetVal_i      1,   ih4g
                FLsetVal_i      1,   ih4h
                FLsetVal_i      0,   ih4i
                FLsetVal_i      0,   ih4j
; // fm2
                FLsetVal_i      1,    ih5a
                FLsetVal_i      1500, ih5b
                FLsetVal_i      0,    ih5c
                FLsetVal_i      0,    ih5d
                FLsetVal_i      .1,   ih5e
                FLsetVal_i      1,    ih5e0
                
                FLsetVal_i      1,   ih5f
                FLsetVal_i      1,   ih5g
                FLsetVal_i      1,   ih5h
                FLsetVal_i      0,   ih5i
                FLsetVal_i      0,   ih5j


; ----- instruments ----- ;

;; // sequencer
                instr           1
                
; // bd clk
abdclk          osciliktp       gk11*gk00,gisin,gk13
kbdclk          downsamp        abdclk
abd2clk         osciliktp       gk16*gk00,gisin,gk18
kbd2clk         downsamp        abd2clk

; // hh clk
ahhclk          osciliktp       gk21*gk00,gisin,gk23
khhclk          downsamp        ahhclk
ahh2clk         osciliktp       gk26*gk00,gisin,gk28
khh2clk         downsamp        ahh2clk

; // sn clk
asnclk          osciliktp       gk31*gk00,gisin,gk33
ksnclk          downsamp        asnclk
asn2clk         osciliktp       gk36*gk00,gisin,gk38
ksn2clk         downsamp        asn2clk

; // fm clk
afmclk          osciliktp       gk41*gk00,gisin,gk43
kfmclk          downsamp        afmclk

; // fm lfo
kfmlfo          oscil           gk4a,gk49*gk00,gisin

; // fm2 clk
afm2clk         osciliktp       gk51*gk00,gisin,gk53
kfm2clk         downsamp        afm2clk

; // fm2 lfo
kfm2lfo         oscil           gk5a,gk59*gk00,gisin

; // trigs
kbdtrig         trigger         kbdclk, 0,0
kbd2trig        trigger         kbd2clk, 0,0
khhtrig         trigger         khhclk, 0,0
khh2trig        trigger         khh2clk, 0,0
ksntrig         trigger         ksnclk, 0,0
ksn2trig        trigger         ksn2clk, 0,0
kfmtrig         trigger         kfmclk, 0,0
kfm2trig        trigger         kfm2clk, 0,0

; // probs
kbdpr           unirand         1
kbd2pr          unirand         1
khhpr           unirand         1
khh2pr          unirand         1
ksnpr           unirand         1
ksn2pr          unirand         1
kfmpr           unirand         1
kfm2pr          unirand         1

;                                    p1 p2 p3    p4    p5
;                                          dur   amp   frq
        if kbdtrig==1 && kbdpr<=gk15p then
                event           "i", 10,0, gk15, gk14, gk12
        endif
        
        if kbd2trig==1 && kbd2pr<=gk1ap then
                event           "i", 10,0, gk1a, gk19, gk17
        endif

;                                    p1 p2 p3    p4    p5
;                                          dur   amp   frq
        if khhtrig==1 && khhpr<=gk25p then
                event           "i", 20,0, gk25, gk24, gk22
        endif
        
        if khh2trig==1 && khh2pr<=gk2ap then
                event           "i", 20,0, gk2a, gk29, gk27
        endif
        
;                                    p1 p2 p3    p4    p5
;                                          dur   amp   frq
        if ksntrig==1 && ksnpr<=gk35p then
                event           "i", 30,0, gk35, gk34, gk32
        endif
        
        if ksn2trig==1 && ksn2pr<=gk3ap then
                event           "i", 30,0, gk3a, gk39, gk37
        endif
        
;                                    p1 p2 p3    p4    p5    p6    p7    p8
;                                          dur   amp   frq   car   mod   ndx
        if kfmtrig==1 && kfmpr<=gk45p then
                event           "i", 40,0, gk45, gk44, gk42*(1+kfmlfo), gk46, gk47, gk48
        endif
        
        if kfm2trig==1 && kfm2pr<=gk55p then
                event           "i", 40,0, gk55, gk54, gk52*(1+kfm2lfo), gk56, gk57, gk58
        endif

                endin

;; // bd
                instr           10
idur            =               p3
iamp            =               p4
ifrq            =               p5

k0              expseg          1,idur,.01
a0              oscil           k0,k0*ifrq,gicos

                outall          iamp*a0
                endin

;; // hh
                instr           20
idur            =               p3
iamp            =               p4
ifrq            =               p5

k0              expseg          1,idur,.01
a0              fractalnoise    k0,0
a1              buthp           a0,ifrq

                outall          iamp*a1
                endin
                
;; // sn
                instr           30
idur            =               p3
iamp            =               p4
ifrq            =               p5

k0              expseg          1,idur,.01
a0              unirand         2
a1              =               (a0-1)*k0

ah              buthp           a1,300
a2              butlp           ah,ifrq

                outall          iamp*a2
                endin
                
;; // fm
                instr           40
idur            =               p3
iamp            =               p4
ifrq            =               p5

kcar            =               p6
kmod            =               p7
kndx            =               p8

k0              expseg          1,idur,.01
a0              foscil          k0,ifrq, kcar,kmod,kndx, gisin

                outall          a0*iamp
                endin

</CsInstruments>
<CsScore>
i 1 0 3600
</CsScore>
</CsoundSynthesizer>
