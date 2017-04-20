% Digital Content Retrieval
% EXERCISE IMAGE 4
% Giuseppe Nebbione

% Description: Write a program to compute the root-mean-square error of 
% a compressed-decompressed image.


clear;

pkg load image;

% Compute the square error

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

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);

figure(1);
subplot(1,2,1);
imshow(img);
title('Original Image');

% Insert the desired quality in order to compress the image
quality=input('Insert the desired quality in order to compress the image as % value: ');
fileNameCompress=cstrcat(filePath, "compressedImage.jpg");
imwrite(img,fileNameCompress, 'quality',quality);
imgCompress=imread(fileNameCompress);

subplot(1,2,2);
imshow(imgCompress);
title('Compressed image');

mse=meanSquareError(img,imgCompress);
printf('The mean square error between the two images is: %i\n', mse);





