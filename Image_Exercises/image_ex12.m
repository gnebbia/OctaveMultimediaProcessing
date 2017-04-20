% Digital Content Retrieval
% EXERCISE IMAGE 12
% Giuseppe Nebbione

% Description: Write the code for computing one of the Daubechies Wavelet
% (choose the one you like), discard a certain amount of coefficients 
% and perform the Inverse transform. Compute the root mean squared
% error between the original image and the reconstructed one.


clear;


pkg load image;
pkg load signal;
pkg load ltfat;

% Function used to compute the Mean Square Error between two images
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

% Function used to threshold an image
% this is a simple threshold, since if the intensity level of the pixel is less
% than the user selected threshold, the threshold is set to 0
function imgThresholded = thresholdImage(img, threshold)
  imgThresholded=img;
  resolution=size(imgThresholded);
  for i=1:resolution(1)
    for j=1:resolution(2)
      if (imgThresholded(i,j)<threshold)
        imgThresholded(i,j)=0;
      endif 
    endfor
  endfor
endfunction


[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);

img=double(img);

% Transform the image with a Daubechies Wavelet, i choose db4 as example
imgFwt=fwt2(img,'db4',1);


% Threshold the image (in this example we did it with maximum/2 as example)
maximum=max(imgFwt(:));
imgThresholded=imgFwt;

% We can comment the subsequent line of code, in order to not threshold 
% the image and test if the MSE=0
imgThresholded=thresholdImage(imgFwt,maximum/2);


% Compute the Inverse Wavelet Transform
imgInvFwt=ifwt2(imgThresholded,'db4',1);

% Compute the Mean Square Error Between the original image and
% the inverse transformed image

mse=meanSquareError(img,imgInvFwt);
printf('The mean square error between the two images is: %i\n', mse);

% Print the original image, and the inverse transformed image
figure(1);

imgInvWavelet=mat2gray(imgInvFwt);
img=mat2gray(img);

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(imgInvWavelet);
title('Inverse Transformed Image');

%% DIVIDERE L'MSE PER IL NUMERO DI PIXEL


