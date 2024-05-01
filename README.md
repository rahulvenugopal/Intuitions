## Impact of discontinuity on estimating power using FFT
1. Let us take a pure 5 Hz sine wave and mix pure 10 Hz sine wave for five seconds duration with 100 Hz sampling rate. Observe the resultant waveform in time domain and its decomposition in right panel. The peaks mark the ingredient frequencies.
2. Introduce a 0.5 second break. Observe what happens now
![](https://github.com/rahulvenugopal/IntuitionsSignalProcessing/blob/main/The%20Gap%20Effect/TheGapEffect.png)

> Points to ponder: What if the cut happens in such a manner that, the joint pieces exactly match? Meaning, there is no **jump** from the last datapoint of cut to next, a smooth transition.

## Now, let me mix a non integer sine wave. 7.5
- This implies that the cycle is not finished after 5 seconds. FFT is going to have a tough time recreating this sudden end
![](https://github.com/rahulvenugopal/IntuitionsSignalProcessing/blob/main/The%20Gap%20Effect/TheeSinewaves.png)
> Look at the width of 7.5 Hz component! Why is it wider than 5 or 10 Hz?

## Let me throw a 8.13 Hz sine wave
![](https://github.com/rahulvenugopal/IntuitionsSignalProcessing/blob/main/The%20Gap%20Effect/FourSinewaves.png)

# Within vs between subjects study | Power
![](https://github.com/rahulvenugopal/Intuitions/blob/main/Pair%20or%20not%20to%20pair/mean_se_viz_corrected.png)
