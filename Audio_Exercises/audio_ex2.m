% Digital Content Retrieval
% EXERCISE AUDIO 2 
% Giuseppe Nebbione

% Description: Perform a dct on the audio signal, plot the coefficient.


clear;

pkg load signal;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
audio=audioread(fileName);

audioTransformed=dct(audio);

% Plot the image
xAxis=[1:size(audioTransformed)(1)]
figure(1);
subplot(1,1,1);
plot(xAxis,audioTransformed);
title('Coefficients of the Wavelet Transform');
xlabel('Coefficient Index');
ylabel('Coefficient Value');
