# Copyright 2017 DuWei
#-*- coding:utf-8 -*-

import wave
import numpy as np
import sys

if len(sys.argv) != 2:
	print 'Usage: cut_wav.py wav.scp:'
	print 'wav.scp:'
	print '	raw.wav new.wav start_time end_time'
	sys.exit();

scp = sys.argv[1]
scpfile = open(scp,'r')
# read wave data
for line in scpfile:
    # deal with one line
    line=line.replace("\n","").split(" ")
    wav,cutwav,start,end = line[:4]
    # read raw wav
    wavefile = wave.open(wav)
    params = wavefile.getparams()
    nchannels, sampwidth, framerate, nframes = params[:4]
    start_time = int(float(start)*framerate)
    end_time = int(float(end)*framerate)
    # get new data
    cutwavfile = wave.open(cutwav,'wb')
    str_data = wavefile.readframes(nframes)
    wave_data = np.fromstring(str_data, dtype=np.short)
    cutwavfile.setnchannels(nchannels)
    cutwavfile.setsampwidth(sampwidth)
    cutwavfile.setframerate(framerate)
    cutwavfile.writeframes(wave_data[start_time:end_time].tostring())
    cutwavfile.close()
