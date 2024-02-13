Temp=readmatrix('capture');
X = Temp(:,3);

Fs=500; %Sampling Frequency
frequency_range=[0 70]; %Limit frequencies from 0 to 25 Hz
taper_params=[2 3]; %Time bandwidth and number of tapers
window_params=[2 0.25]; %Window size is 4s with step size of 1s
min_nfft=0; %No minimum nfft
detrend_opt='constant'; %detrend each window by subtracting the average
weighting='unity'; %weight each taper at 1
plot_on=true; %plot spectrogram
verbose=true; %print extra info

%Compute the multitaper spectrogram
[spect,stimes,sfreqs] = multitaper_spectrogram(X,Fs,frequency_range, taper_params, window_params, min_nfft, detrend_opt, weighting, plot_on, verbose);

% title('EEG Spectrogram','FontSize', 14);
% xlabel('Time (s)', 'FontSize', 40, 'FontWeight', 'bold');
% ylabel('Frequency (Hz)', 'FontSize', 40, 'FontWeight', 'bold');
% set(gca, 'FontSize', 40, 'FontWeight', 'bold');
% set(gcf, 'Position', [100, 100, 800, 600]);

%Or use multitaper_spectrogram_mex
% [spect,stimes,sfreqs] = multitaper_spectrogram_mex(X,Fs,frequency_range, taper_params, window_params, min_nfft, detrend_opt, weighting, plot_on, verbose);

% figure;
% duration = size(X,1) / 500;
% start_value = 0;
% end_value = duration-0.002;
% interval = 0.002;
% timeStamps = start_value:interval:end_value;
% plot(timeStamps, X);
% title('EEG Raw Signal');
% xlabel('Time (s)');
% ylabel('ADC Value');
