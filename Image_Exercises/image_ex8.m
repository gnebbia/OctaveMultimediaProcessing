% Digital Content Retrieval
% EXERCISE IMAGE 8
% Giuseppe Nebbione

% Description: Compute the root mean squared error between the original 
% image of exercise 3 and the result of exercise 4.

clear;

pkg load image;


function mse = meanSquareError(imgOne, imgTwo)
  squaredDifference=0.0000000;
  resolution=size(imgOne);
  for i=1:resolution(1)
    for j=1:resolution(2)
      valOne=cast(imgOne(i,j),"uint64");
      valTwo=cast(imgTwo(i,j),"uint64");
      squaredDifference=squaredDifference+(valOne-valTwo)^2;
    endfor
  endfor
  mse=sqrt(squaredDifference);
  mse=mse/(resolution(1)*resolution(2));
endfunction


% Read an image, let the user choose an image
[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);


% Choose parameters for AWGN noise
mean=input("Insert the desired mean for AWGN noise: ");
variance=input("Insert the desired variance for AWGN noise: ");
imgAWGN=imnoise(img,"gaussian",mean,variance);


% Choose parameters for Salt & Pepper noise
densitySP=input("Insert the desired density for Salt & Pepper noise as percentage (e.g., 0.20): ");
imgSP=imnoise (img,"salt & pepper",densitySP);


% Compute the Mean Square Error between the original image and the noisy image
% with AWGN applied

mseAWGN=meanSquareError(img,imgAWGN);
printf('The mean square error between the original image and the noisy image with\nAWGN applied is: %i\n', mseAWGN);

% Compute the Mean Square Error between the original image and the noisy image
% with Salt & Pepper applied

mseSP=meanSquareError(img,imgSP);
printf('The mean square error between the original image and the noisy image with\nSalt & Pepper noise applied is: %i\n', mseSP);

figure(1);

% Show the selected Image with no additional noise
subplot(1,3,1);
imshow(img);
title('Original image');

% Show the selected Image with AWGN noise
subplot(1,3,2);
imshow(imgAWGN);
title('Image with AWGN');

% Show the selected Image with Salt & Pepper noise
subplot(1,3,3);
imshow(imgSP);
title('image with salt & pepper noise');
