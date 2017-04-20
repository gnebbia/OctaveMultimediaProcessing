% Digital Content Retrieval
% EXERCISE IMAGE 11
% Giuseppe Nebbione

% Description: Write a code for adding Gaussian noise to an image and 
% use the Haar wavelet for denoising it.


clear;



pkg load image;
pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);


% Choose parameters for AWGN noise
mean=input("Insert the desired mean for AWGN noise: ");
variance=input("Insert the desired variance for AWGN noise: ");
imgAWGN=imnoise(img,"gaussian",mean,variance);

imgAWGN=double(imgAWGN);


imgAWGNFwt=fwt2(imgAWGN,'db1',3);


% Keep only the first block

for i=(resolution(1)/8)+1:resolution(1)
  for j=1:resolution(2)
    imgAWGNFwt(i,j)=0;
  endfor
endfor

for i=1:resolution(1)
  for j=(resolution(2)/8)+1:resolution(2)
    imgAWGNFwt(i,j)=0;
  endfor
endfor



imgAWGNInvFwt=ifwt2(imgAWGNFwt,'db1',3);


figure(1);


imgAWGN=mat2gray(imgAWGN);
subplot(1,3,1);
imshow(imgAWGN);


imgAWGNFwt=mat2gray(imgAWGNFwt);
subplot(1,3,2);
imshow(imgAWGNFwt);

imgAWGNInvFwt=mat2gray(imgAWGNInvFwt);
subplot(1,3,3);
imshow(imgAWGNInvFwt);



