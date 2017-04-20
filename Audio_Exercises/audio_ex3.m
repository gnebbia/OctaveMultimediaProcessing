% Digital Content Retrieval
% EXERCISE AUDIO 3
% Giuseppe Nebbione

% Description: Threshold the dct coefficient trying different 
% thresholding schemes and recover the signal. Listen to the
% signal to understand the effects.


clear;

pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
[audio,fs]=audioread(fileName);

% We apply the discrete cosine transform
audioTransformed=dct(audio);


% Here we Threshold with max/2
maximum=max(audioTransformed);
threshold=maximum/2;

audioTransformedThresholded=audioTransformed;

for i=1:size(audioTransformedThresholded)
  if(audioTransformedThresholded(i)<threshold)
    audioTransformedThresholded(i)=0;
  endif
endfor


% Here we recover the  thresholded signal
audioInvTransformed=idct(audioTransformedThresholded);

% Play the original audio file
sound(audio,fs);

%Play the transformed signal, even if it could be meaningless for us
sound(audioTransformed,fs);

% Here we play the inverse transformed signal after it has been thresholded
sound(audioInvTransformed,fs);
