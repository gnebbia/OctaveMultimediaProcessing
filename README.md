<h1>OctaveMultimediaProcessing</h1>

This repository is used to store some Octave sources developed at university mainly for audio/image processing with Octave. 

<h3>Working Environment</h3>

In order to install Octave, on a Debian-based Distro (e.g., Ubuntu, Mint, and so on...) we do:

```$>sudo apt-get update```

```$>sudo apt-get install octave```

After the execution of these commands we will have the Octave core package, but not the toolboxes.
Octave has many toolboxes, in order to install a toolbox we can use directly the Octave command line prompt (either from CLI or GUI):

```>>pkg install -forge <name_of_the_toolbox>```

Once the package is installed, we still have to include the package in our sources in order to use
the package provided functions or procedures, so in order to load a package we do:

```>>pkg load <name_of_the_toolbox>```

In the specific case of audio/image processing we'll need three packages:
* **signal** - _The Octave toolbox used to do general signal processing._
* **image** - _The Octave toolbox used to do image processing._
* **ltfat** - _The Octave toolbox used to work with wavelets, and more generally used to make Large Time/Frequency Analysis._

To install for example the "image" toolbox we will do:

```>>pkg install -forge image```

then in our sources in which we will need the image package, we will use:
```octave
pkg load image;
```

The same applies for other modules, mind that modules could even be automatically loaded at startup, but this choice is not recommended, since it is better choice to manually load them in the source code, this is done in order to not make the environment heavier, with tools we don't need.


<h3>Octave Examples</h3>
This section is a collection of layman code snippet that can be used in Octave multimedia processing


<h5>Preamble (i.e., hints)</h5>

The programmer is strongly adviced to use the "help" as much as possible, for example if we don't know how the
"sound()" function works or which prototypes are available, we can simply type into the Octave command-line:

```>>help sound```

another hint is to start every program with the subsequent snippet of code:

```octave
clear;

pkg load <nameOfThePackageToLoad>;
pkg load <anotherPackageToLoad>;
...

```

where the sequences "nameOfThePackageToLoad" and "anotherPackageToLoad" are merely used as examples and should be substituted with the packages we need in our program.

In the following subsections, useful snippets of code are shown, these are the instructions needed to build all the exercises,
anyway if the reader needs help on a specific exercise, the source code is there for that.

<h5>Open an Image</h5>

```octave
clear;

pkg load image;

img=imread(filename);
```


<h5>Let the user choose a file, show it and print the resolution</h5>

```octave
clear;

pkg load image;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);

printf('The image resolution is: %ix%i \n', resolution(1), resolution(2));

figure(1);
title('User selected image');

subplot(1,1,1);
imshow(img);
```


<h5>Histogram of an Image</h5>

```octave
clear;

pkg load image;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);

figure(1);

subplot(1,2,1);
imshow(img);

subplot(1,2,2);
imhist(img);
```


<h5>Normalize an Image</h5>

```octave
clear;

pkg load image;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);

% This equalizes the image
imgEqualized=histeq(img); 

figure(1);

subplot(1,2,1);
imshow(img);

subplot(1,2,2);
imshow(imgEqualized);
```


<h5>Read an image and apply various kinds of noise</h5>

```octave
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
```


<h5>Read an image and compute the Wavelet Transform and its Inverse Transform</h5>

```octave
clear;


pkg load image;
pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
img=imread(fileName);
resolution=size(img);

img=double(img);

% Here we compute a daubechies 1 transform, but even other are available
imgFwt=fwt2(img,'db1',1);

% Here we rescale the image values to be in a gray scale, since
% after the transformations we could have unsuitable values
imgWavelet=mat2gray(imgFwt); 
figure(1);
subplot(1,2,1);
imshow(imgWavelet);


% Here we apply an inverse wavelet transform
imgInvFwt=ifwt2(imgFwt,'db1',1);

imgInvFwt=mat2gray(imgInvFwt);

% Here we plot the inverse transformed which should be equal to the original image
subplot(1,2,2);
imshow(imgInvFwt);
```


<h5>Read an audio file and play the music</h5>

```octave
clear;

pkg load signal;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);

% Notice that when we read an audio file, we take as input even the 
% sampling frequency, so that we can play it properly when we use
% the "sound()" function
[audio,fs]=audioread(fileName);

sound(audio,fs);
```


<h5>Read an audio file and compute the Discrete Cosine Transform</h5>

```octave
clear;

pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
[audio,fs]=audioread(fileName);

% We apply the discrete cosine transform
audioTransformed=dct(audio);
```


<h5>Read an audio file and plot the spectrogram</h5>

```octave
clear;

pkg load signal;
pkg load ltfat;

[baseName,filePath]=uigetfile();
fileName=cstrcat(filePath,baseName);
audio=audioread(fileName);
numElem=size(audio);


% Plot the spectrogram of the signal
specgram(audio);
```
