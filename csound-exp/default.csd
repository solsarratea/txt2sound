<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr      =           44100
nchnls 	= 		2

gi1 ftgen 1, 0, 4096, 10, 1
gi2 ftgen 2, 0, 4096, 7, -1, 4096, 1    ; sawtooth
gi3 ftgen 3, 0, 4096, 7,  0, 1024, 1, 2048, -1, 1024, 0  ;triangle

instr 101,102,103
  iamp =      ampdbfs(p5)
  a1   oscil  iamp, p4, p1-100
  kenv expseg 1, p3, .01
  a1   =      a1 * kenv
       outs   a1, a1
endin
 
</CsInstruments>
<CsScore bin="csbeats">
