mkdir('chronux_2_12')
addpath(genpath('chronux_2_12'))
clc; clear;

%%
% get the time and raw data from parsed csv file
fileID = fopen("capture.txt", 'r');
formatSpec = '%d %f';
sizeA = [2 Inf];
data = fscanf(fileID,formatSpec,sizeA);
data = data';
%data = data(5000:40000, :);      % trim the raw data if needed

time = data(:,1);
raw_value = data(:,2);

data_size = size(raw_value);
data_size = data_size(1,1);
new_raw_value = [];

for i = 2:data_size
    new_raw_value(i,1) = raw_value(i,1) - raw_value(i-1, 1);
end

% plot the eeg signal waveform and spectrogram
params.Fs     = 1000;     % sampling rate 
params.fpass  = [0 40];  % limit the frequency range for display 
params.tapers = [2 3];
movingWin = [0.6 0.1];
params.trialave = 0;
params.err = 1;

subplot(2,1,1)
plot(new_raw_value);
title("eye open/close");

subplot(2,1,2)
[Sc,t,f]=mtspecgramc(new_raw_value,movingWin,params);
imagesc(t,f,Sc');
set(gca,'YDir','normal') % flip the graph
xlabel('Time(s)') 
ylabel('Frequency') 
colormap("turbo");

