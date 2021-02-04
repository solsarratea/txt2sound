#!/usr/bin/env python3
import os
from os import path

# 1. Text to musical notation. Use solfa.py
# 2. Musical notation to csound output


INPUT ="hello is there anybody in there is not that you can teach me is there anyone home"

OUTPUT_FILE="encripted.txt"

# Hardcoded options for message encription
TONIC_KEY="A"
# {C,C#,Db,D,Eb,E,F,F#,Gb,G,Ab,A,Bb,B}

MODE="lydian"
# {major,dorian,phrygian,lydian,mixolydian,minor,locrian}

CLEF="bass"
# {treble, alto, bass}

RYTHM ="1/4"
# {1/4,1/8,1/16}

#---------------------------------------------------------------
SCORES_FILE= "scores.txt"
def get_scores():
    scores = open(SCORES_FILE, "a")
    f = open(OUTPUT_FILE, "r")
    notes = f.read().split(" | ")[1:]
    for bar_idx, bar in enumerate(notes, start=1):
        mN = f'm{bar_idx}'
        _bar = bar.split(" ")
        delta = 4/len(_bar)
        idx = 1;
        for i in range(len(_bar)):
            bN = f'b{idx}'
            note =  _bar[i].capitalize()
            if (note[0] == "Z"):
                note = "Z";
            pp = f'i103 {mN} {bN} q {note} \n'
            idx += int(delta)
            mN = '  '
            if (len(_bar[i].strip()) > 1):
                scores.write(pp)

    for bar_idx, bar in enumerate(notes, start=1):
        mN = f'm{bar_idx}'
        _bar = bar.split(" ")
        delta = 4/len(_bar)
        idx = 0;
        for i in range(len(_bar)):
            bN = f'b{idx}'
            note =  _bar[i].capitalize()
            if (note[0] == "Z"):
                note = "Z";
            pp = f'i101 {mN} {bN} q {note} \n'
            idx += int(delta)
            mN = '  '
            if (len(_bar[i].strip()) > 1):
                scores.write(pp)
    scores.close()

#---------------------------------------------------------------
CSOUND_OUTPUT_FILE = "message.csd"
DEFAULT_FILE= "default.csd"
BPM = 240
PREMEASURE = 4
def create_csound_file():
    f = open(CSOUND_OUTPUT_FILE, "a")
    #copy default config
    f0 = open(DEFAULT_FILE)
    for line in f0.readlines():
        f.write(line)
    f0.close()
    #copy scores
    f.write(f'beats = {BPM} \n')
    f.write(f'permeasure = {PREMEASURE} \n\n')
    f1 = open(SCORES_FILE)
    for line in f1.readlines():
        f.write(line)
    f.write("end\n")
    f.write("</CsScore> \n")
    f.write("</CsoundSynthesizer>\n")



# INITIALIZE PROCESS
print("Deleting existing files...")
if (path.exists(OUTPUT_FILE)):
     os.remove(OUTPUT_FILE)
if (path.exists(SCORES_FILE)):
     os.remove(SCORES_FILE)
if (path.exists(CSOUND_OUTPUT_FILE)):
    os.remove(CSOUND_OUTPUT_FILE)

print("Converting message into musical notation..")
COMMAND = f'python2 solfa.py -m "{INPUT}" -kt {TONIC_KEY} -km {MODE} -kc {CLEF} -kr {RYTHM} > {OUTPUT_FILE}'
os.system(COMMAND)

print("Getting `csound` scores from ", OUTPUT_FILE)
get_scores();
print("Created at ", SCORES_FILE)

print("Creating new csound file from default template")
create_csound_file();
