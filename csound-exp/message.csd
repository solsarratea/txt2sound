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
beats = 240
permeasure = 2

i103 m1 b1 q C2 
i103    b3 q D2 
i103 m2 b1 q Z 
i103    b3 q D2 
i103 m3 b1 q E4 
i103 m4 b1 q G4 
i103 m5 b1 q B4 
i103 m6 b1 q F2 
i103    b3 q A2 
i103 m7 b1 q C2 
i103    b3 q F2 
i103 m8 b1 q C4 
i103 m9 b1 q A4 
i103 m10 b1 q D3 
i103    b3 q G1 
i103 m11 b1 q Z 
i103    b3 q D1 
i103 m12 b1 q E2 
i103    b2 q C1 
i103    b3 q G1 
i103 m13 b1 q G4 
i103 m14 b1 q D4 
i103 m15 b1 q F2 
i103    b3 q A2 
i103 m16 b1 q C2 
i103 m17 b1 q C4 
i103 m18 b1 q G4 
i103 m19 b1 q B4 
i103 m20 b1 q D4 
i103 m21 b1 q E4 
i103 m22 b1 q F4 
i103 m23 b1 q F2 
i103    b3 q A2 
i103 m24 b1 q A4 
i103 m25 b1 q F3 
i103    b3 q G1 
i103 m26 b1 q E2 
i103    b3 q E2 
i103 m27 b1 q Z 
i103    b3 q G2 
i103 m28 b1 q A4 
i103 m29 b1 q D4 
i103 m30 b1 q F4 
i103 m31 b1 q C4 
i103 m32 b1 q A2 
i103    b3 q G2 
i103 m33 b1 q Z 
i103    b3 q A2 
i103 m34 b1 q Z 
i103    b3 q B2 
i103 m35 b1 q C4 
i103 m36 b1 q G4 
i103 m37 b1 q B4 
i103 m38 b1 q F2 
i103    b3 q A2 
i103 m39 b1 q C2 
i103    b3 q F2 
i103 m40 b1 q C4 
i103 m41 b1 q A4 
i103 m42 b1 q D3 
i103    b3 q G1 
i103 m43 b1 q E4 
i103 m44 b1 q D4 
i103 m45 b1 q C2 
i103    b3 q A2 
i103 m46 b1 q E2 
i103    b3 q B2 
i103 m47 b1 q C4 
i101 m1 b0 q C2 
i101    b2 q D2 
i101 m2 b0 q Z 
i101    b2 q D2 
i101 m3 b0 q E4 
i101 m4 b0 q G4 
i101 m5 b0 q B4 
i101 m6 b0 q F2 
i101    b2 q A2 
i101 m7 b0 q C2 
i101    b2 q F2 
i101 m8 b0 q C4 
i101 m9 b0 q A4 
i101 m10 b0 q D3 
i101    b2 q G1 
i101 m11 b0 q Z 
i101    b2 q D1 
i101 m12 b0 q E2 
i101    b1 q C1 
i101    b2 q G1 
i101 m13 b0 q G4 
i101 m14 b0 q D4 
i101 m15 b0 q F2 
i101    b2 q A2 
i101 m16 b0 q C2 
i101    b2 q F2 
i101 m17 b0 q C4 
i101 m18 b0 q G4 
i101 m19 b0 q B4 
i101 m20 b0 q D4 
i101 m21 b0 q E4 
i101 m22 b0 q F4 
i101 m23 b0 q F2 
i101    b2 q A2 
i101 m24 b0 q A4 
i101 m25 b0 q F3 
i101    b2 q G1 
i101 m26 b0 q E2 
i101    b2 q E2 
i101 m27 b0 q Z 
i101    b2 q G2 
i101 m28 b0 q A4 
i101 m29 b0 q D4 
i101 m30 b0 q F4 
i101 m31 b0 q C4 
i101 m32 b0 q A2 
i101    b2 q G2 
i101 m33 b0 q Z 
i101    b2 q A2 
i101 m34 b0 q Z 
i101    b2 q B2 
i101 m35 b0 q C4 
i101 m36 b0 q G4 
i101 m37 b0 q B4 
i101 m38 b0 q F2 
i101    b2 q A2 
i101 m39 b0 q C2 
i101    b2 q F2 
i101 m40 b0 q C4 
i101 m41 b0 q A4 
i101 m42 b0 q D3 
i101    b2 q G1 
i101 m43 b0 q E4 
i101 m44 b0 q D4 
i101 m45 b0 q C2 
i101    b2 q A2 
i101 m46 b0 q E2 
i101    b2 q B2 
i101 m47 b0 q C4 
end
</CsScore> 
</CsoundSynthesizer>
