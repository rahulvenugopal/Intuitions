## Impact of discontinuity on estimating power using FFT
1. Let us take a pure 5 Hz sine wave and mix pure 10 Hz sine wave for five seconds duration with 100 Hz sampling rate. Observe the resultant waveform in time domain and its decomposition in right panel. The peaks mark the ingredient frequencies.
2. Introduce a 0.5 second break. Observe what happens now

Points to ponder: What is the cut happens in such a manner that, the joint pieces exactly match? Meaning, there is no *jump* from the last datapoint of cut to next, a smooth transition.

## Now, let me mix a non integer sine wave. 7.5 or 8.3 Hz. This implies that the cycle is not finished after 5 seconds. FFT is going to have a tough time recreating this sudden end