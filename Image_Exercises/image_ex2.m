% Digital Content Retrieval
% EXERCISE IMAGE 2
% Giuseppe Nebbione

% Description: Write the code capable of reducing the number of intensity
% levels in a image from 256 to 2, in integer powers of 2. The desired 
% number of intensity levels needs to be a variable input to your program.

clear;

pkg load image;

function numGroup = groupInterval(stepValue, inputValue)
  numGroup = floor(inputValue/stepValue)+1;
endfunction


[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);

figure(1);
title('Reducing Intensity Levels');

subplot(1,2,1);
imshow(img);

nroIntervals=input('Inserire il numero di livelli di grigi desiderato: ');
newStep=256/nroIntervals;
imgIntLev=img;

for i=1:resolution(1)
  for j=1:resolution(2)
    idNewGroup=groupInterval(newStep,img(i,j));
    imgIntLev(i,j)=(idNewGroup*newStep)-1;  
  endfor
endfor

disp('Conversion 100% Done');

subplot(1,2,2);
imshow(imgIntLev);
