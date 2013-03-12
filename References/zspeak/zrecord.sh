lang=en-us

#!/bin/sh 
echo "1 SoX Sound Exchange - Convert WAV to FLAC with 16000" 
sox message.wav message.flac rate 16k 
echo "2 Submit to Google Voice Recognition" 
wget -q -U "Mozilla/5.0" --post-file message.flac --header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=de-de&client=chromium" > message.ret echo "3 SED Extract recognized text" cat message.ret | sed 's/.*utterance":"//' | sed 's/","confidence.*//' > message.txt 
echo "4 Remove Temporary Files" 
rm message.flac rm message.ret 
echo "5 Show Text " 
cat message.txt
