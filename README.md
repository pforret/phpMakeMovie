STEPS
=====

* extract info from CPL (xml file)
* extract audio MXF: generate 1 WAV with 6 channels
* extract video MXF: generate N J2C files (N = # frames)
* downmix 5.1 audio to 2 channels (stereo)
* convert image J2C to TIF (with XYZ-RGB / gamma)
* convert TIF to JPG (with rescale)
* generate MOV with JPG sequence and stereo sound