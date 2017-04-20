% Digital Content Retrieval
% EXERCISE AUDIO 7
% Giuseppe Nebbione

% Description: Plot the spectrogram of the signal

clear;

pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
audio=audioread(fileName);
numElem=size(audio);


% Plot the spectrogram of the signal
specgram(audio);

