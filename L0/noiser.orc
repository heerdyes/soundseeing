; csound -odac noiser.orc t10.sco

0dbfs = 1

        instr       1

    ; dream up some noise
a0      noise       .09, .12

    ; make one tri lfo
a3      vco2        15.4, 0.25, 12

    ; lfo freq modded by above lfo
a2      vco2        4800, 16 + k(a3), 12

    ; filter the dream
a1      butlp       a0, 5000 + k(a2)

    ; line out
        outall      a1

        endin
