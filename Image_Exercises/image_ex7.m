% Digital Content Retrieval
% EXERCISE IMAGE 7
% Giuseppe Nebbione

% Description: Download a gray-level image (or convert a color image to 
% a grey-level one) compute the discrete cosine transform (block 8x8) 
% and plot it at a proper scale.Threshold the values of the coefficients
% of the cosine transform (the threshold is parametric) and perform the
% inverse discrete cosine transform. Try several values of threshold 
% (i.e., the mean value of the coefficients, the maximum value/2, ...)

clear;


pkg load image;
pkg load signal;


% Select a grey level image

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);


do
  xCosPar=input("Insert the desired x size for the Cosine Transform: ");
  yCosPar=input("Insert the desired y size for the Cosine Transform: ");
  inputOK=mod(resolution(1),xCosPar)==0 && mod(resolution(2),yCosPar)==0;
  if(!inputOK)
    printf('\nOne of the inserted input is not a multiple of the image resolution\n');
    printf('The image resolution is %ix%i\n',resolution(1),resolution(2));
    printf('Please insert as input multiples of the resolution\n\n');
  endif
  
until (inputOK)





imgCosTrans=zeros(resolution(1),resolution(2));
imgSubBlock=zeros(xCosPar,yCosPar);

imgCosInvTrans=zeros(resolution(1),resolution(2));
imgSubBlockInvTrans=zeros(xCosPar,yCosPar);

% Compute the Discrete Cosine Transform on the user selected image

% Loop the block
for x=1:xCosPar:resolution(1)
  for y=1:yCosPar:resolution(2)

% Loop the pixels into a single block
     w=1;
     z=1;
     for i=x:(x+xCosPar-1)
        for j=y:(y+yCosPar-1)
          imgSubBlock(w,z)=img(i,j);
          z=z+1;   
        endfor
        z=1;
        w=w+1;
     endfor
      
      
% Compute the Cosine Transform of the sub-block  
     imgSubBlockTrans=dct2(imgSubBlock);

     
% Threshold the transformed image with the maximum/2, taken as example
% Comment this block of code in order to test if the original image
% and its inverse transformed image are equal

     maxCosTransImg=max(imgSubBlockTrans(:));
     threshold=maxCosTransImg/2.0;
     w=1;
     z=1;
     for i=x:(x+xCosPar-1)
        for j=y:(y+yCosPar-1)
          if (imgSubBlockTrans(w,z)<threshold)
            imgSubBlockTrans(w,z)=0;
          endif
          z=z+1;   
        endfor
        z=1;
        w=w+1;
     endfor

    
% Compute the inverse Cosine Transform of the sub-blocks  
     imgSubBlockInvTrans=idct2(imgSubBlockTrans);
      
% Build the Complete Cosine Transformed Image
     w=1;
     z=1;
     for i=x:(x+xCosPar-1)
       for j=y:(y+yCosPar-1)
         imgCosTrans(i,j)=imgSubBlockTrans(w,z);
         z=z+1;
       endfor
       z=1;
       w=w+1;
     endfor
     
   
% Build the Complete Inverse Cosine Transformed Image
     w=1;
     z=1;
     for i=x:(x+xCosPar-1)
       for j=y:(y+yCosPar-1)
         imgCosInvTrans(i,j)=(imgSubBlockInvTrans(w,z));
         z=z+1;
       endfor
       z=1;
       w=w+1;
     endfor

  endfor
endfor

figure(1);

% Show the original Image
subplot(1,3,1);
imshow(img);
title('Original Image');

% Show the Cosine Transformed Image
subplot(1,3,2);
imshow(imgCosTrans);
title('Cosine Transformed Image');


% Show the Inverse Cosine Transformed image
subplot(1,3,3);
imgCosInvTrans=mat2gray(imgCosInvTrans);
imshow(imgCosInvTrans);
title('Inverse Cosine Transformed Image');



