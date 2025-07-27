sr=48000
ksmps=32
nchnls=2
0dbfs=1

instr 1

iamp = 0.14
kpitch = 360
kdens = 50
kampoff = 0
kpitchoff = 0
kgdur = 0.009
imgdur = 0.01
igfn = 1
iwfn = 2 ; gauss env

a0 grain iamp, kpitch, kdens, kampoff, kpitchoff, kgdur, igfn, iwfn, imgdur

outall a0

endin
