% Digital Content Retrieval
% EXERCISE IMAGE 6
% Giuseppe Nebbione

% Description: With reference to the selected figure, write the code 
% which extracts 4 blocks of 32 X 32 pixels of the image and 
% compute and plot the histograms.

clear;

pkg load image;
pkg load signal;


BLOCK_SIZE=32;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);


i=1;
j=1;
for x=1:BLOCK_SIZE
  for y=1:BLOCK_SIZE
     imgSubBlockOne(i,j)=img(x,y);
     j++;
  endfor
  j=1;
  i++;
endfor


i=1;
j=1;
for x=BLOCK_SIZE:2*BLOCK_SIZE
  for y=BLOCK_SIZE:2*BLOCK_SIZE
    imgSubBlockTwo(i,j)=img(x,y);
    j+=1;
  endfor
  j=1;
  i+=1;
endfor


i=1;
j=1;
for x=2*BLOCK_SIZE:3*BLOCK_SIZE
  for y=2*BLOCK_SIZE:3*BLOCK_SIZE
    imgSubBlockThree(i,j)=img(x,y);
    j+=1;
  endfor
  j=1;
  i+=1;
endfor


i=1;
j=1;
for x=3*BLOCK_SIZE:4*BLOCK_SIZE
  for y=3*BLOCK_SIZE:4*BLOCK_SIZE
    imgSubBlockFour(i,j)=img(x,y);
    j+=1;
  endfor
  j=1;
  i+=1;
endfor



% Show the images
figure(1);

subplot(2,5,1);
imshow(img);

subplot(2,5,6);
imhist(img);


subplot(2,5,2);
imshow(imgSubBlockOne);

subplot(2,5,7);
imhist(imgSubBlockOne);


subplot(2,5,3);
imshow(imgSubBlockTwo);

subplot(2,5,8);
imhist(imgSubBlockTwo);


subplot(2,5,4);
imshow(imgSubBlockThree);

subplot(2,5,9);
imhist(imgSubBlockThree);


subplot(2,5,5);
imshow(imgSubBlockFour);

subplot(2,5,10);
imhist(imgSubBlockFour);
