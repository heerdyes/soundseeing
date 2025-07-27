sr=44100
ksmps=16
nchnls=1
0dbfs=1

            instr       1

asig        in

a1          reson       asig, 0, 3000, 1
w1          spectrum    a1, .02, 6, 24, 12, 1, 3

koct,kamp   specptrk    w1, 1, 6.5, 8.9, 7.5, 10, 7, .7, 0, 3, 1, .1
a2          delay       a1, .066

            printk2     koct

            endin
