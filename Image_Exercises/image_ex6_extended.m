% Digital Content Retrieval
% EXERCISE IMAGE 6 EXTENDED
% Giuseppe Nebbione

% Description: With reference to the selected figure, write the code 
% which extracts 4 blocks of 32 X 32 pixels of the image and 
% compute and plot the histograms.

clear;

pkg load image;
pkg load signal;

NRO_BLOCKS=4;
BLOCK_SIZE=32;


[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);


% Select a Random Pixel



% Check if the Random Pixel can pick a block (BLOCK_SIZE) inside the boundaries
% and build an array of matrixes, containing the various sub blocks

k=1;
correctSubBlocks=0;
do
  randomXPix=randi(resolution(1));
  randomYPix=randi(resolution(2));
  if( (randomXPix+BLOCK_SIZE <= resolution(1)) && (randomYPix+BLOCK_SIZE <= resolution(2)) )
    i=1;
    j=1;
    for x=randomXPix:(randomXPix+BLOCK_SIZE-1)
      for y=randomYPix:(randomYPix+BLOCK_SIZE-1)
        imgSubBlock(k,i,j)=img(x,y);
        j++;
      endfor
      j=1;
      i++;
    endfor
    i=1;
    correctSubBlocks=correctSubBlocks+1;
    k++;
  endif
until(correctSubBlocks==NRO_BLOCKS)


% Show the images
figure(1);
  
subplot(2,5,1);
imshow(img);

subplot(2,5,6);
imhist(img);



for w=1:NRO_BLOCKS

  subplot(2,NRO_BLOCKS+1,w+1);
  imgSubBlockW=squeeze(imgSubBlock(w,:,:));
  
  imshow(imgSubBlockW);

  subplot(2,NRO_BLOCKS+1,w+6);
  imhist(imgSubBlockW);
  
endfor
