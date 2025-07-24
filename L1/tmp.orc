sr=48000
ksmps=32
nchnls=2
0dbfs=1

            instr       1

k1          oscil       20, 0.51, 1
knv         oscil       1, k1+24, 2

k2          oscil       15, 0.81, 1
k0          oscil       50, 30+k2, 1

a0          oscil       0.1*knv, 350+k0, 1
            outall      a0

            endin
