recording.flac

sox -t alsa default ./recording.flac silence 1 0.1 5% 1 1.0 5%
play recording.flacy recording.flac
