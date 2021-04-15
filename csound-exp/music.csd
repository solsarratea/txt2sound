<CsoundSynthesizer>     ; START OF CSOUND FILE

<CsOptions>             ; START OF CSOUND CONFIGURATION
 -odac ; realtime audio output
</CsOptions>            ; END OF CSOUND CONFIGURATION

<CsInstruments>         ; START OF INSTRUMENT DEFINITIONS
sr = 44100
ksmps = 441
0dbfs = 1
nchnls = 2

;build a table containing a sine wave
giSine     ftgen      0, 0, 2^10, 10, 1

instr Rise
kFreq      init       100
aSine      poscil     .2, kFreq, giSine
           outs       aSine, aSine
;increment frequency by 10 Hz for each k-cycle
kFreq      =          kFreq + 10
;print out the frequency for the last k-cycle
kLast      release
 if kLast == 1 then
           printk     0, kFreq
 endif
endin

instr Partials
;initialize kCount
kCount     init       100
;get new frequency if kCount equals 100, 200, ...
 if kCount % 100 == 0 then
kFreq      =          kCount
 endif
aSine      poscil     .2, kFreq, giSine
           outs       aSine, aSine
;increment kCount
kCount     =          kCount + 1
;print out kFreq whenever it has changed
           printk2    kFreq
endin
instr notReally
sr = 44100
ksmps = 4410

instr notReally
kcount    =         0; sets kcount to 0 at each k-cycle
kcount    =         kcount + 1; does not really increase ...
          printk    0, kcount; print the value
endin

</CsInstruments>        ; END OF INSTRUMENT DEFINITIONS

<CsScore>               ; START OF SCORE EVENTS
;i 1 0 1 ; start instrument 1 at time 0 for 1 second
i "Rise" 0 3
i "Partials" 4 31
</CsScore>

</CsoundSynthesizer>    ; END OF THE CSOUND FILE