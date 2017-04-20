% Digital Content Retrieval
% EXERCISE AUDIO 5
% Giuseppe Nebbione

% Description: Threshold the wavelet coefficients trying different 
% thresholding schemes and recover the signal. Listen
% to the signal to understand the effects. 
% (Hints: try as first experiment, to discard a complete band)


clear;

pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
[audio,fs]=audioread(fileName);

% Play the original audio file
sound(audio,fs);

% Here we apply a wavelet transform
audioFwt=fwt(audio,'db4',1);

sound(audioFwt,fs);

lastBand=ceil(size(audioFwt)/2);

% Here we only delete the fourth band
for i=lastBand:size(audioFwt)
    audioFwt(i)=0;
endfor

% Here we play the transformed signal without the fourth band
sound(audioFwt,fs);

% Here we Threshold the transformed signal with max/2
maximum=max(audioFwt);
threshold=maximum/2;

for i=1:size(audioFwt)
  if(audioFwt(i)<threshold)
    audioFwt(i)=0;
  endif
endfor

res=size(audioFwt);

% Here we inverse transform and listen to the recovered signal
audioInvTransformed=ifwt(audioFwt,'db4',1,res(1));

% Here we play the audio inverse transformed
sound(audioInvTransformed,fs);
