; run command:
; csound -odac am_dtun.orc t10.sco

0dbfs = 1

        instr       1

    ; lfo which is doing pwm 20%
alfo1   vco2        1, 4.5, 2, .2

    ; convert audio rate to kontrol rate
k1      downsamp    alfo1

    ; convert bipolar to unipolar
k1u     =           (1+k1)/2

    ; detuned sawtooth
a0      vco2        .03, 440
a1      vco2        .03, 440.05

    ; multiplication modulates the amp signal
a2      =           (a0+a1) * k1u

    ; emit sound
        outall      a2

        endin
