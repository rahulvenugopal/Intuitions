% Parameters
fs = 100; % Sampling rate (Hz)
t = 0:1/fs:5-1/fs; % Time vector for 30 seconds
f1 = 5; % Frequency of the first component (Hz)
f2 = 10; % Frequency of the second component (Hz)
f3 = 7.5; % Frequency of the third component (Hz)
f4 = 8.13; % Frequency of the third component (Hz)

% Create 5 Hz + 10 Hz signal
signal = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t) + sin(2*pi*f4*t);

% Plot the signal and its FFT in one column
figure;

% Plot original signal
subplot(2, 2, 1);
plot(t, signal);
title('Original Signal');

% Plot FFT of original signal
subplot(2, 2, 2);
fft_result_original = fft(signal);
frequencies_original = linspace(0, fs, numel(fft_result_original));
plot(frequencies_original, abs(fft_result_original));
title('FFT of Original Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% Introduce three random 0.5-second gaps
gap_duration = 0.5 * fs; % 0.5 second gap in samples

for i = 1:3
    gap_start = randi([1, numel(t)-gap_duration]); % Random start index for gap
    signal(gap_start:gap_start+gap_duration-1) = 0; % Set values to zero for the gap
end

% Plot signal with discontinuities
subplot(2, 2, 3);
plot(t, signal);
title('Signal with Discontinuities');

% Compute and plot FFT of signal with discontinuities
subplot(2, 2, 4);
fft_result_discontinuous = fft(signal);
frequencies_discontinuous = linspace(0, fs, numel(fft_result_discontinuous));
plot(frequencies_discontinuous, abs(fft_result_discontinuous));
title('FFT of Signal with Discontinuities');
xlabel('Frequency (Hz)');
ylabel('Amplitude');