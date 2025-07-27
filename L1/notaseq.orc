sr=48000
ksmps=32
nchnls=2
0dbfs=1

instr 1

; modulate freq with an lfo
k0 lfo 1, 1.9

; wavetable acting as pwm envelope
knv oscil 1, 6.4, 4

; detuned vco
a0 vco2 .06, 261.53*(1+.27*k0)
a1 vco2 .06, 261.63*(1+.27*k0)

a01 = knv*(a0+a1)
a2 butlp a01, 1800

; delay
adly delay a2, .26

outall a2+.21*adly
endin
