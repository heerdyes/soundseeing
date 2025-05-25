; run command:
; csound -odac lowpasslfo.orc t10.sco

0dbfs = 1

        instr       1

    ; detuned sawtooth
a0      vco2        .03, 440
a1      vco2        .03, 440.05

    ; filter them
alf0    vco2        1800, 2.1, 12
a2      butlp       a0 + a1, 2000 + k(alf0)

    ; emit sound
        outall      a2

        endin
