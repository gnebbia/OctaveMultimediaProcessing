% Digital Content Retrieval
% EXERCISE AUDIO 4
% Giuseppe Nebbione

% Description: Perform a wavelet transform on the audio signal, 
% plot the coefficient.


clear;

pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
[audio,fs]=audioread(fileName);

% Here we apply a wavelet transform
audioFwt=fwt(audio,'db4',1);

% Here we plot the coefficients
xAxis=[1:size(audioFwt)(1)]

% Plot the coefficients of the Wavelet Transform
figure(1);
subplot(1,1,1);
plot(xAxis,audioFwt);
title('Coefficients of the Wavelet Transform');
xlabel('Coefficient Index');
ylabel('Coefficient Value');
