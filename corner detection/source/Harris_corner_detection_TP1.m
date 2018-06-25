%% -------------------------------------------------------------------
% Universite Jean Monnet
% Computer Vision
% Practical Session 1
% Evelyn Paiz Reyes
% Nadile Nunes

close all; clear all; clc;

%% -------------------------------------------------------------------
%  PART 1 - Construct necessary form of images.

% a. Read the image
Io = imread('chessboard06.png');

if size(Io,3)==3 % Is the image RGB?
    Io = rgb2gray(Io);
end
I = imadjust(Io); % now its increased the image contrast
I = im2double(I); % lets convert our data to a range of [0 1]

% b. Compute the image derivative Ix and Iy
dx = [-1 0 1; -1 0 1; -1 0 1]; % we create a gradient mask for x and y
dy = dx';
Ix = conv2(I, dx, 'same'); % Now the derivatives arer calculated 
Iy = conv2(I, dy, 'same');

% c. Generate a Gaussian filter of size 9*9 and standard deviation 2
sigma = 2; % standrd deviation 2
g = fspecial('gaussian', 9, sigma); % Gaussien Filter

% d. Apply the Gaussian filter to smooth the images Ix*Ix, Iy*Iy and Ix*Iy
Ix2 = conv2(Ix.^2, g, 'same');  
Iy2 = conv2(Iy.^2, g, 'same');
Ixy = conv2(Ix.*Iy, g,'same');
    
% e. Display the results
figure;
subplot(2,3,1), imshow(mat2gray(I)), title('Original');
subplot(2,3,2), imshow(mat2gray(Ix)), title('Derivative Ix');
subplot(2,3,3), imshow(mat2gray(Iy)), title('Derivative Iy');

subplot(2,3,4), imshow(mat2gray(Ix2)), title('Smooth image Ix*Ix');
subplot(2,3,5), imshow(mat2gray(Iy2)), title('Smooth image Iy*Iy');
subplot(2,3,6), imshow(mat2gray(Ixy)), title('Smooth image Ix*Iy');

%% -------------------------------------------------------------------
%  PART 2 - Compute Matrix E which contains for every point the value  
%  of the smaller eigenvalue of auto correlation matrix M.

% a. Compute E
	% Initialize E
    [rows, cols] = size(I);
    E = zeros(rows, cols); % initialize by creating a matrix filled with zeros
    
    % Computing the sum on a 3*3 window is equivalent to applying a filter
    % [1 1 1; 1 1 1; 1 1 1]
    sumGIx2 = imfilter(Ix2, ones(3));
    sumGIy2 = imfilter(Iy2, ones(3));
    sumGIxy = imfilter(Ixy, ones(3));
    
    %Then, for each pixel, 
    tic
    for i = 2:rows-1
        for j = 2:cols-1
        % (1) build matrix M considering a window of size 3*3, 
        M = [sumGIx2(i,j), sumGIxy(i,j); sumGIxy(i,j), sumGIy2(i,j)];
        
        % (2) Compute eigenvalues of the matrix,
        e = eig(M);
        
        % (3) save the smaller eigenvalue in E
        E(i,j) = min(e);
        end
    end
    toc
    
% b. Display results
figure, imshow(mat2gray(E)), title('Matrix E result');

%% -------------------------------------------------------------------
%PART 3 - Compute Matrix R which contains for every point the cornerness score

% a. Compute R
	% Initialize R.
    R = zeros(rows, cols);
    k = 0.04;
    
    %Then, for each pixel, 
    tic
    for i = 2:rows-1
        for j = 2:cols-1
        % (1) build matrix M,
        M = [sumGIx2(i,j), sumGIxy(i,j); sumGIxy(i,j), sumGIy2(i,j)];
        
        % (2) Compute the trace and the determinant of M,
        trM = trace(M);
        detM = det(M);
        
        % (3) save the result of equation 3 in R
        R(i,j) = detM - k*(trM.^2);
        end
    end
    toc
        
% b. Display results
%figure, imshow(mat2gray(R)), title('Matrix R result');
subplot(1,2,1), imshow(mat2gray(I)), title('Original');
subplot(1,2,2), imshow(mat2gray(R)), title('Matrix R result');

%% -------------------------------------------------------------------
% PART 4 - Select for E and R the 81 most salient points.

% a. It is used a function to obtain the 81 most salient points of E and R, 
% and their coordinates features(px, py)
featuresE = getP(E, 81);
featuresR = getP(R, 81);

% b. Display the selected points on top of the original image
figure;
subplot(1,2,1), showP(Io, featuresE, 'Max 81 points of E', 'r+');
subplot(1,2,2), showP(Io, featuresR, 'Max 81 points of R', 'b+');

%% -------------------------------------------------------------------
% PART 5 - Build  a  function  to  carry  out  non-maximal  suppression  for  E  and R
% Select the 81 most salient points using a non-maximal suppression of 11x11 pixels.

% a. Apply non maximal suppression with a window of 11*11
sze = 11; % size of mask

mxE = ordfilt2(E, sze^2, ones(sze)); % grey-scale dilate for E
E11 = (E==mxE) & (E>2); % finds maxima for E with a threshold of 3

mxR = ordfilt2(R, sze^2, ones(sze)); % grey-scale dilate for R
R11 = (R==mxR) & (R>10); % finds maxima for R with a threshold of 20

% b. Get the 81 most salient points and their coordinates, in the same way as part 4
featuresR11 = getP(R11, 81);
featuresE11 = getP(E11, 81);

% c. Display the selected points on top of the original image
figure;
subplot(1,2,1), showP(Io, featuresE11, 'Max 81 points of E optimized', 'r+');
subplot(1,2,2), showP(Io, featuresR11, 'Max 81 points of R optimized', 'b+');
