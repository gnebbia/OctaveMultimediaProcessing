% Digital Content Retrieval
% EXERCISE AUDIO 6
% Giuseppe Nebbione

% Description: Try to use dct or wavelet to denoise the audio signal. 
% If the audio signal is not noisy (i.e., it is not the
% result of a recording) add a noise to the original signal.


clear;

pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
[audio,fs]=audioread(fileName);
numElem=size(audio);

% Play the original audio file
sound(audio,fs);

% Here we apply a wavelet transform
audioFwt=fwt(audio,'db4',3);

sound(audioFwt);

lastBand=ceil(size(audioFwt)/8);

% Here we only delete the fourth band
for i=lastBand:size(audioFwt)
    audioFwt(i)=0;
endfor

% Here we play the transformed signal without the fourth band
sound(audioFwt,fs);

numElem=size(audioFwt);

% Here we inverse transform and listen to the recovered signal
audioInvTransformed=ifwt(audioFwt,'db4',3,numElem(1));

sound(audioInvTransformed,fs);
