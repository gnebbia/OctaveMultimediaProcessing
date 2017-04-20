% Digital Content Retrieval
% EXERCISE IMAGE 3
% Giuseppe Nebbione

% Description: Write the code to add Gaussian noise to an image. 
% You must be able to specify the noise mean and variance. 
% Write the code to add salt-and-pepper (impulse) noise to an image. 
% You must be able to specify the probabilities of each of the two noise components.

clear;

pkg load image;

% Read an image, let the user choose an image
[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);
figure(1);

% Show the selected Image with no additional noise
subplot(1,3,1);
imshow(img);
title('Original image');

% Show the selected Image with AWGN noise
mean=input("Insert the desired mean for AWGN noise: ");
variance=input("Insert the desired variance for AWGN noise: ");
imgAWGN=imnoise(img,"gaussian",mean,variance);
subplot(1,3,2);
imshow(imgAWGN);
title('Image with AWGN');

% Show the selected Image with Salt & Pepper noise
densitySP=input("Insert the desired density for Salt & Pepper noise as percentage (e.g., 0.20): ");
imgSP= imnoise (img,"salt & pepper",densitySP);
subplot(1,3,3);
imshow(imgSP);
title('image with salt & pepper noise');
