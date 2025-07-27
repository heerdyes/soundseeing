s.boot;

y={
	SinOsc.ar([440,441],0,0.1)
}.play;

(
var winenv;
// a custom envelope
winenv = Env([0, 1, 0], [0.5, 0.5], [8, -8]);
z = Buffer.sendCollection(s, winenv.discretize, 1);

SynthDef(\sin_grain_test, { |out, gate = 1, amp = 0.2, envbuf|
    var pan, env, freqdev;
    // use mouse x to control panning
    pan = MouseX.kr(-1, 1);
    // use WhiteNoise and mouse y to control deviation from center pitch
    freqdev = PinkNoise.kr(MouseY.kr(0, 100));
    env = EnvGen.kr(
        Env([0, 1, 0], [1, 1], \sin, 1),
        gate,
        levelScale: amp,
        doneAction: Done.freeSelf
    );
    Out.ar(out,
        GrainSin.ar(2, Impulse.kr(50), 0.075, 840 + freqdev, pan, envbuf) * env)
}).add;
)

s.scope;
// use built-in env
x = Synth(\sin_grain_test, [\envbuf, -1]);
x.free;

// switch to the custom env
x.set(\envbuf, z)
x.set(\envbuf, -1);

x.set(\gate, 0);

y.free;
