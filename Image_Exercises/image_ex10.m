% Digital Content Retrieval
% EXERCISE IMAGE 10
% Giuseppe Nebbione

% Description: Write the code for computing the Haar Wavelet and use it
% to extract the horizontal edges (hint: choose an image where 
% horizontal edges are evident and predominant).


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

% Elaborate the four sub-blocks

for i=1:resolution(1)/2
  for j=1:resolution(2)/2
    imgFwt(i,j)=0;
  endfor
endfor


for i=1:resolution(1)/2
  for j=resolution(2)/2:resolution(2)
    imgFwt(i,j)=0;
  endfor
endfor



for i=resolution(1)/2:resolution(1)
  for j=resolution(2)/2:resolution(2)
        imgFwt(i,j)=0;
  endfor
endfor

imgWaveletProva=mat2gray(imgFwt);

imgInvFwt=ifwt2(imgFwt,'db1',1);

imgWavelet=mat2gray(imgInvFwt);
figure(1);
imshow(imgWavelet);
title('Edges');


%figure(1);
%imagesc(img2); 
%colormap(gray); 
%axis('image');
%title('Haar');


% DOMANDA
% Nel caso in cui io abbia un'immagine con una risoluzione strana o comunque non pari,
% come suddivido i blocchi


