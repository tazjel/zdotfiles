# commandlinefu.com by David Winterbottom

# Stream system sounds over rtmp
sox -d -p | ffmpeg -i pipe:0 -f flv -preset ultrafast -tune zerolatency rtmp://localhost/live/livestream

# Resample a WAV file with sox
sox infile.wav -r 44100 outfile.wav resample

# Apply fade effect to a audio
sox input.mp3 output.mp3 fade h 5 00:02:58 5

# Get duration of an audio file in seconds.
get_duration() { durline=$(sox "$1" -n stat 2>&1|grep "Length (seconds):");echo ${durline#*\: }; }

# Convert a .wav file to .sln file
sox is_that_correct.wav -t raw -r 8000 -s -w -c 1 is_that_correct.sln

# Convert .wav audio files to .gsm format
sudo sox <file name>.wav -r 8000 <file name>.gsm

# Convert .wav audio files to .gsm forman
sudo sox <file name>.wav -r 8000 <file name>.gsm

# SoX recording audio and trimming silence
sox -t alsa default ./recording.flac silence 1 0.1 5% 1 1.0 5%

# record audio and use sox to eliminate silence. Results an ogg file that only contains the audio signal exceeding -45dB
rec -r 44100 -p | sox -p "audio_name-$(date '+%Y-%m-%d').ogg" silence -l 1 00:00:00.5 -45d -1 00:00:00.5 -45d

# Resample MP3's to 44.1kHz
file /music/dir/* | grep -v 44.1 | sed 's/:.*//g' | grep .mp3 | { while IFS= read; do filebak="\"$REPLY.original\""; file="\"$REPLY\""; mv $file $filebak; sox -t mp3 $filebak $file rate 44k; done; };

# Stream audio over ssh
sox Klaxon.mp3 -t wav - |ssh thelab@company.com paplay

# Truncate 0.3 sec from an audio file using sox
sox input.wav output.wav reverse trim 00:00:00.3 reverse

# Your name backwards
espeak "$USER" --stdout | sox - -t mp3 - reverse | mpg123 -

# Merge - Concate MP3 files
sox *.mp3 -t wavpcm - | lame - > bunch.mp3

# Create an audio test CD of sine waves from 1 to 99 Hz
(echo CD_DA; for f in {01..99}; do echo "$f Hz">&2; sox -nt cdda -r44100 -c2 $f.cdda synth 30 sine $f; echo TRACK AUDIO; echo FILE \"$f.cdda\" 0; done) > cdrdao.toc && cdrdao write cdrdao.toc && rm ??.cdda cdrdao.toc

# Convert mp3/wav file to asterisk ulaw for music on hold (moh)
sox -v 0.125 -V <mp3.mp3> -t au -r 8000 -U -b -c 1 <ulaw.ulaw> resample -ql

