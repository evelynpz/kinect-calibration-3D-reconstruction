%% -------------------------------------------------------------------
% Universite Jean Monnet
% Computer Vision
% Practical Session 3
% Evelyn Paiz Reyes
% Nadile Nunes

close all; clear all; clc;

%% -------------------------------------------------------------------
%  PART 1 - Camera calibration

% Specify calibration images
leftImages = imageSet(fullfile('images', 'left_extra'));
rightImages = imageSet(fullfile('images', 'right_extra'));
images1 = leftImages.ImageLocation;
images2 = rightImages.ImageLocation;

% Detect the checkerboards
[imagePoints, boardSize, pairsUsed] = detectCheckerboardPoints(images1,...
    images2);   
 
  % Display points from first 4 camera 1 images
  images1 = images1(pairsUsed);
  figure;
  for i = 1:4
      I = imread(images1{i});
      subplot(2, 2, i);
      imshow(I); hold on; plot(imagePoints(:,1,i,1), imagePoints(:,2,i,1), 'ro');
  end 
  annotation('textbox', [0 0.9 1 0.1], 'String', 'Camera 1', ...
     'EdgeColor', 'none', ...
     'HorizontalAlignment', 'center')
 
  % Display points from first 4 camera 2 images
  images2 = images2(pairsUsed);
  figure;
  for i = 1:4
      I = imread(images2{i});
      subplot(2, 2, i);
      imshow(I); hold on; plot(imagePoints(:,1,i,2), imagePoints(:,2,i,2), 'ro');
  end 
  annotation('textbox', [0 0.9 1 0.1], 'String', 'Camera 2', ...
     'EdgeColor', 'none', ...
     'HorizontalAlignment', 'center')
 
% Specify world coordinates of checkerboard keypoints
squareSize = 30; % in millimeters
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the stereo camera system
stereoParams = estimateCameraParameters(imagePoints, worldPoints);

% Visualize calibration accuracy
figure;
showReprojectionErrors(stereoParams);

% Visualize the extrinsics parameters
figure
showExtrinsics(stereoParams);

%% -------------------------------------------------------------------
%  PART 2 - Scene images

% Read in the stereo pair of images
I1 = imread('images/left_scene.png');
I2 = imread('images/right_scene.png');

% Display the original images
figure
imshowpair(I1, I2, 'montage');
title('Original Images');

%% -------------------------------------------------------------------
%  PART 3 - Removes Lens Distortion

I1 = undistortImage(I1, stereoParams.CameraParameters1);
I2 = undistortImage(I2, stereoParams.CameraParameters2);
figure
imshowpair(I1, I2, 'montage');
title('Undistorted Images');  

%% -------------------------------------------------------------------
%  PART 4 - 3D reconstruction

% Rectify the images
[J1, J2] = rectifyStereoImages(I1, I2, stereoParams, 'OutputView', 'full');

% Display the images after rectification.
figure;
imshow(stereoAnaglyph(J1, J2), 'InitialMagnification', 50);
title('After Rectification');

% Compute Disparity for 3-D Reconstruction 
disparityMap = disparity(rgb2gray(J1), rgb2gray(J2));
figure;
imshow(disparityMap, [0, 64], 'InitialMagnification', 50);
colormap('jet');
colorbar;
title('Disparity Map');

%Reconstruct the 3-D Scene
points3D = reconstructScene(disparityMap, stereoParams);

% Create a pointCloud object
showPointCloud(points3D, J2);