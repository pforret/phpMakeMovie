:: Script tips on every step in the process

:: ==== SCAN CPL
:: * TASK: check what MXF files are used
:: * TASK: check if there are frames to be ignored in audio or video
:: * TASK: check if multiple reels
:: * TOOL: XML parsing in PHP

:: ==== EXTRACT MXF AUDIO
:: * TASK: extract each reel to 6-channel WAV file
:: * TASK: append all WAVs to 1 large WAV file
:: * TOOL: asdcp [www.cinecert.com/asdcplib/](http://www.cinecert.com/asdcplib/)
asdcp-test -x wav/REEL1 -f %SKIP% -d %NBFRAMES% %MXF_AUDIO%

:: ==== EXTRACT MXF VIDEO
:: * TASK: extract each reel to compressed JPEG2000 files
:: * TASK: (optional) rename frames of reel 1,2,... into 1 large sequence
:: * TOOL: asdcp [www.cinecert.com/asdcplib/](http://www.cinecert.com/asdcplib/)
asdcp-test -x img/f01_ -f %SKIP% -d %NBFRAMES% %MXF_VIDEO%

:: ==== DOWNMIX 5.1 AUDIO TO STEREO
:: * TASK: mix L/R/C/LFE/LS/RS to L/R
:: * TASK: (optional) detect if voice is present to use other parameters 
::         sox oops` - or 'karaoke' - will eliminate voice and result will be more silent than original
:: * TASK: (optional) use LAME MP3 output to measure ReplayGain
::         lame --replaygain-accurate --clipdetect --disptime 120 %STEREO_WAV% %STEREO_MP3% > %LAME_OUTPUT%
:: * TOOL: sox [sox.sourceforge.net](http://sox.sourceforge.net/)
sox %WAV_51% %WAV_STEREO%  remix 1,3,5 2,3,6

:: ==== CONVERTS JPEG2000 TO TIF
