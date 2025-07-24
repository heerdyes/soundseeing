s.boot;

y={
	var k1=SinOsc.kr(0.51,0,20,24);
	var knv=EnvGen.kr(
		Env([0,0,1,0], [0,0.025,0.05]),
		Impulse.kr(k1)
	);
	var k2=SinOsc.kr(0.81,0,15,30);
	var k0=SinOsc.kr(k2, 0, 50, 350);
	SinOsc.ar([k0,k0], 0, 0.12*knv)
}.play;

y.free;
