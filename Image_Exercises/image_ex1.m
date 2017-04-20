% Digital Content Retrieval
% EXERCISE IMAGE 1
% Giuseppe Nebbione

% Description: Download from the net a grey level image in the field of 
% visible, discover the resolution (n.
% of pixels) , and compute the space necessary to store it, by assuming 
% to code it in the pure binary number code. Read the image, diplay it 
% with a title, and compute the space requirements by Matlab. Help: Feel
% confident and try the basic following Matlab built in
% functions: input, imread, figure, title, xlabel, imshow, clear, sizeof

clear;

numberGreyLevels=256;
bitPerPixel=log2(numberGreyLevels);

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName)
img=imread(fileName);
resolution=size(img);
figure(1);
title('Grey Scale Example Image');
imshow(img)

printf('The image resolution is: %ix%i \n', resolution(1), resolution(2));

byteImgSize=resolution(1)*resolution(2);
printf('The image size in Byte is: %i \n', byteImgSize);

bitImgSize=bitPerPixel*byteImgSize;
printf('The image size in bit is: %i \n', bitImgSize);
