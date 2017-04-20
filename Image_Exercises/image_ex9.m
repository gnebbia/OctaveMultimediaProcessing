% Digital Content Retrieval
% EXERCISE IMAGE 9
% Giuseppe Nebbione

% Description: With reference to user selected figure of the book, 
% write the code to extract 4 bands of the wavelet and compute
% the histogram.


clear;


pkg load image;
pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);

img=double(img);


imgFwt=fwt2(img,'db1',1);

imgWavelet=mat2gray(imgFwt);
%figure(1);
%imshow(imgWavelet);

% Extract the four sub-blocks
h=1;
k=1;
for i=1:resolution(1)/2
  for j=1:resolution(2)/2
    imgSubBlockUL(h,k)=imgWavelet(i,j);
    k++;
  endfor
  h++;
  k=1;
endfor

h=1;
k=1;
for i=resolution(1)/2:resolution(1)
  for j=1:resolution(2)/2
    imgSubBlockUR(h,k)=imgWavelet(i,j);
    k++;
  endfor
  h++;
  k=1;
endfor

h=1;
k=1;
for i=1:resolution(1)/2
  for j=resolution(2)/2:resolution(2)
    imgSubBlockLL(h,k)=imgWavelet(i,j);
    k++;
  endfor
  h++;
  k=1;
endfor


h=1;
k=1;
for i=resolution(1)/2:resolution(1)
  for j=resolution(2)/2:resolution(2)
    imgSubBlockLR(h,k)=imgWavelet(i,j);
    k++;
  endfor
  h++;
  k=1;
endfor
    
figure(1);

subplot(2,4,1);
imshow(imgSubBlockUL);

subplot(2,4,5);
imhist(imgSubBlockUL);


subplot(2,4,2);
imshow(imgSubBlockUR);

subplot(2,4,6);
imhist(imgSubBlockUR);


subplot(2,4,3);
imshow(imgSubBlockLL);

subplot(2,4,7);
imhist(imgSubBlockLL);


subplot(2,4,4);
imshow(imgSubBlockLR);

subplot(2,4,8);
imhist(imgSubBlockLR);
