s.boot;

/////////////// synth def ///////////////

(
SynthDef(\mygrained, {|out,amp=1,gps=10,gdur=0.1,frq=440|
	Out.ar(out,
		GrainSin.ar(2, Impulse.kr(gps), gdur, frq) * amp);
}).add;
)

x=Synth(\mygrained, [\amp, 0.15]);
x.set(\frq, 400, \gps, 9, \gdur, 0.03, \amp, 0.15);
x.free;

//////////////// OSC ///////////////////
NetAddr.langPort

n=NetAddr.new("127.0.0.1", 44816);

var cv0=0;

var o1=OSCFunc({
	|msg,time,addr,recvPort|
	//msg[1].postln;
	x.set(\gps, msg[1]*100);
}, '/ch/1', n);

var o2=OSCFunc({
	|msg,time,addr,recvPort|
	//msg[1].postln;
	x.set(\frq, 200*msg[1]);
}, '/ch/2', n);

o2.free;
o1.free;

///////////
// debug stuff
OSCFunc.trace(true);
OSCFunc.trace(false);