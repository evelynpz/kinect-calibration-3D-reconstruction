%% -------------------------------------------------------------------
% Universite Jean Monnet
% Computer Vision
% Practical Session 3
% Evelyn Paiz Reyes
% Nadile Nunes

close all; clear all; clc;

%% -------------------------------------------------------------------
%  PART 1 - Loading files of calibrations

depth = load('Kinect_Parameters.mat'); % We read the parameters for depth
rgb = load('Calib_Results_stereo.mat'); % We read the parameters for the rgb images

%% -------------------------------------------------------------------
%  PART 2 - Scene images

% Read in the stereo pair of images
I1 = imread('images/left_scene.png');
I2 = imread('images/right_scene.png');

% Read in the depth pair of images
D1 = imread('images/left_depth_scene.png');
D2 = imread('images/right_depth_scene.png');

% Display the original images
figure
subplot(2,1,1), imshowpair(I1, I2, 'montage'); title('Original Images');
subplot(2,1,2), imshowpair(D1, D2, 'montage'); title('Depth Images');

%% -------------------------------------------------------------------
%  PART 3 - Pixel projection to metric 3D space (left camera)

% the depth camera can be projected to metric 3D space 
for x = 1:size(I1,1)
    for y = 1:size(I1,2)
        P3D(x,y,1) = (x - depth.cx_d) * (D1(x, y) / depth.fx_d);
        P3D(x,y,2) = (y - depth.cy_d) * (D1(x, y) / depth.fy_d);
        P3D(x,y,3) = D1(x, y);
    end
end

% Visualize the 3-D Scene
figure;
showPointCloud(P3D, I1);
xlabel('X');
ylabel('Y');
zlabel('Z');

%% -------------------------------------------------------------------
%  PART 3 - Pixel projection to metric 3D space (right camera)

% the depth camera can be projected to metric 3D space 
for x = 1:size(I2,1)
    for y = 1:size(I2,2)
        P3D(x,y,1) = (x - depth.cx_d) * (D2(x, y) / depth.fx_d);
        P3D(x,y,2) = (y - depth.cy_d) * (D2(x, y) / depth.fy_d);
        P3D(x,y,3) = D1(x, y);
    end
end

% Visualize the 3-D Scene
figure;
showPointCloud(P3D, I2);
xlabel('X');
ylabel('Y');
zlabel('Z');