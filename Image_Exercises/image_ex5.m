% Digital Content Retrieval
% EXERCISE IMAGE 5
% Giuseppe Nebbione

% Description: Download an image (if color image, perform a conversion 
% to a gray level image) and write the code which computes the entropy. 
% Compare the computed value to the value provided
% by the built-in matlab function entropy.

clear;

pkg load image;

global N_GREY_LEVELS=256;

function frequencyValue = frequencyLevelCounter(img,resolution)
  global N_GREY_LEVELS;
  frequencyValue=zeros(1,N_GREY_LEVELS);
  for i=1:resolution(1)
    for j=1:resolution(2)
      frequencyValue(img(i,j)+1)=frequencyValue(img(i,j)+1)+1;
    endfor
  endfor
endfunction


% Select a grey level image

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);

% Compute frequency of grey levels
freqLevels=frequencyLevelCounter(img, resolution);


% Compute the probabilities of grey levels
nTotPixels=resolution(1)*resolution(2);

probLevel=zeros(1,N_GREY_LEVELS);

for i=1:N_GREY_LEVELS
  probLevel(i)=freqLevels(i)/nTotPixels;
endfor

% Delete zeros from probabilities vector, in order to compute the log
probLevel=probLevel(find(probLevel));

% Computation of the entropy
computedEntropy=-sum(probLevel.*log2(probLevel));

% Entropy given by the "entropy" octave function
functionEntropy=entropy(img);

printf("The computed entropy is : %f \n", computedEntropy);
printf("The entropy given by the function \"entropy\" in Octave is : %f \n", functionEntropy);

