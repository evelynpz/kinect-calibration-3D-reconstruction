% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 657.395132971415819 ; 657.762768818705240 ];

%-- Principal point:
cc = [ 302.981223722436766 ; 242.617051233592946 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.255844671070990 ; 0.127594437217677 ; -0.000207886121406 ; 0.000034620415442 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 0.347042706357849 ; 0.371252024771676 ];

%-- Principal point uncertainty:
cc_error = [ 0.705731397131595 ; 0.645772469006804 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.002707702128076 ; 0.010762220960373 ; 0.000145843667963 ; 0.000144061617931 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.654779e+00 ; 1.651922e+00 ; -6.699972e-01 ];
Tc_1  = [ -1.775742e+02 ; -8.374166e+01 ; 8.529844e+02 ];
omc_error_1 = [ 8.240599e-04 ; 1.064962e-03 ; 1.361220e-03 ];
Tc_error_1  = [ 9.164520e-01 ; 8.450919e-01 ; 4.643148e-01 ];

%-- Image #2:
omc_2 = [ 1.849013e+00 ; 1.900563e+00 ; -3.971217e-01 ];
Tc_2  = [ -1.549618e+02 ; -1.593557e+02 ; 7.576045e+02 ];
omc_error_2 = [ 8.658304e-04 ; 1.058235e-03 ; 1.645987e-03 ];
Tc_error_2  = [ 8.183076e-01 ; 7.491389e-01 ; 4.564178e-01 ];

%-- Image #3:
omc_3 = [ 1.742392e+00 ; 2.077565e+00 ; -5.052470e-01 ];
Tc_3  = [ -1.252398e+02 ; -1.746286e+02 ; 7.754804e+02 ];
omc_error_3 = [ 7.924050e-04 ; 1.121289e-03 ; 1.701576e-03 ];
Tc_error_3  = [ 8.364919e-01 ; 7.666178e-01 ; 4.387485e-01 ];

%-- Image #4:
omc_4 = [ 1.827859e+00 ; 2.116779e+00 ; -1.103194e+00 ];
Tc_4  = [ -6.443083e+01 ; -1.548712e+02 ; 7.791050e+02 ];
omc_error_4 = [ 7.112556e-04 ; 1.161681e-03 ; 1.593331e-03 ];
Tc_error_4  = [ 8.430528e-01 ; 7.651860e-01 ; 3.534478e-01 ];

%-- Image #5:
omc_5 = [ 1.079054e+00 ; 1.922504e+00 ; -2.527482e-01 ];
Tc_5  = [ -9.224368e+01 ; -2.291564e+02 ; 7.366546e+02 ];
omc_error_5 = [ 6.947460e-04 ; 1.083266e-03 ; 1.219744e-03 ];
Tc_error_5  = [ 8.030191e-01 ; 7.301200e-01 ; 4.320658e-01 ];

%-- Image #6:
omc_6 = [ -1.701813e+00 ; -1.929289e+00 ; -7.914684e-01 ];
Tc_6  = [ -1.489008e+02 ; -7.964819e+01 ; 4.449784e+02 ];
omc_error_6 = [ 6.677342e-04 ; 1.081426e-03 ; 1.464917e-03 ];
Tc_error_6  = [ 4.812365e-01 ; 4.514073e-01 ; 3.696266e-01 ];

%-- Image #7:
omc_7 = [ 1.996752e+00 ; 1.931473e+00 ; 1.310634e+00 ];
Tc_7  = [ -8.293068e+01 ; -7.773573e+01 ; 4.401752e+02 ];
omc_error_7 = [ 1.278847e-03 ; 6.566422e-04 ; 1.536494e-03 ];
Tc_error_7  = [ 4.834800e-01 ; 4.411438e-01 ; 3.902561e-01 ];

%-- Image #8:
omc_8 = [ 1.961462e+00 ; 1.824262e+00 ; 1.326198e+00 ];
Tc_8  = [ -1.701101e+02 ; -1.035608e+02 ; 4.620722e+02 ];
omc_error_8 = [ 1.220498e-03 ; 6.697847e-04 ; 1.473584e-03 ];
Tc_error_8  = [ 5.285962e-01 ; 4.792757e-01 ; 4.396396e-01 ];

%-- Image #9:
omc_9 = [ -1.363688e+00 ; -1.980539e+00 ; 3.210334e-01 ];
Tc_9  = [ -1.876049e+00 ; -2.251597e+02 ; 7.286466e+02 ];
omc_error_9 = [ 8.321365e-04 ; 1.068695e-03 ; 1.377036e-03 ];
Tc_error_9  = [ 7.922964e-01 ; 7.190887e-01 ; 4.493539e-01 ];

%-- Image #10:
omc_10 = [ -1.513264e+00 ; -2.086814e+00 ; 1.882468e-01 ];
Tc_10  = [ -2.960491e+01 ; -3.004318e+02 ; 8.601620e+02 ];
omc_error_10 = [ 1.014941e-03 ; 1.215092e-03 ; 1.831193e-03 ];
Tc_error_10  = [ 9.521470e-01 ; 8.547988e-01 ; 5.964022e-01 ];

%-- Image #11:
omc_11 = [ -1.793082e+00 ; -2.064809e+00 ; -4.799268e-01 ];
Tc_11  = [ -1.510514e+02 ; -2.353635e+02 ; 7.047451e+02 ];
omc_error_11 = [ 9.104623e-04 ; 1.146572e-03 ; 1.970745e-03 ];
Tc_error_11  = [ 7.805637e-01 ; 7.320160e-01 ; 5.900017e-01 ];

%-- Image #12:
omc_12 = [ -1.839113e+00 ; -2.087342e+00 ; -5.155422e-01 ];
Tc_12  = [ -1.334780e+02 ; -1.772303e+02 ; 6.049744e+02 ];
omc_error_12 = [ 7.761588e-04 ; 1.101802e-03 ; 1.818133e-03 ];
Tc_error_12  = [ 6.648333e-01 ; 6.189649e-01 ; 4.933075e-01 ];

%-- Image #13:
omc_13 = [ -1.919019e+00 ; -2.116535e+00 ; -5.941669e-01 ];
Tc_13  = [ -1.326898e+02 ; -1.435609e+02 ; 5.448020e+02 ];
omc_error_13 = [ 7.240056e-04 ; 1.090552e-03 ; 1.787486e-03 ];
Tc_error_13  = [ 5.969835e-01 ; 5.540480e-01 ; 4.477111e-01 ];

%-- Image #14:
omc_14 = [ -1.954384e+00 ; -2.124574e+00 ; -5.844108e-01 ];
Tc_14  = [ -1.235957e+02 ; -1.371435e+02 ; 4.909040e+02 ];
omc_error_14 = [ 6.814135e-04 ; 1.068798e-03 ; 1.749921e-03 ];
Tc_error_14  = [ 5.387047e-01 ; 4.987510e-01 ; 4.018165e-01 ];

%-- Image #15:
omc_15 = [ -2.110766e+00 ; -2.253836e+00 ; -4.948452e-01 ];
Tc_15  = [ -1.991381e+02 ; -1.345103e+02 ; 4.750400e+02 ];
omc_error_15 = [ 7.864804e-04 ; 1.000982e-03 ; 1.907214e-03 ];
Tc_error_15  = [ 5.283422e-01 ; 4.946469e-01 ; 4.330634e-01 ];

%-- Image #16:
omc_16 = [ 1.886908e+00 ; 2.336194e+00 ; -1.735697e-01 ];
Tc_16  = [ -1.593175e+01 ; -1.703348e+02 ; 6.955653e+02 ];
omc_error_16 = [ 1.081270e-03 ; 1.142198e-03 ; 2.374368e-03 ];
Tc_error_16  = [ 7.515525e-01 ; 6.823464e-01 ; 5.128666e-01 ];

%-- Image #17:
omc_17 = [ -1.612907e+00 ; -1.953392e+00 ; -3.473495e-01 ];
Tc_17  = [ -1.352308e+02 ; -1.389568e+02 ; 4.901899e+02 ];
omc_error_17 = [ 6.732681e-04 ; 1.029823e-03 ; 1.451524e-03 ];
Tc_error_17  = [ 5.317875e-01 ; 4.947473e-01 ; 3.561375e-01 ];

%-- Image #18:
omc_18 = [ -1.341750e+00 ; -1.692556e+00 ; -2.970102e-01 ];
Tc_18  = [ -1.853677e+02 ; -1.578004e+02 ; 4.412935e+02 ];
omc_error_18 = [ 7.726938e-04 ; 1.000462e-03 ; 1.145941e-03 ];
Tc_error_18  = [ 4.834756e-01 ; 4.509789e-01 ; 3.459458e-01 ];

%-- Image #19:
omc_19 = [ -1.925985e+00 ; -1.837924e+00 ; -1.440319e+00 ];
Tc_19  = [ -1.065644e+02 ; -7.957227e+01 ; 3.341592e+02 ];
omc_error_19 = [ 6.646241e-04 ; 1.171991e-03 ; 1.485183e-03 ];
Tc_error_19  = [ 3.751659e-01 ; 3.441710e-01 ; 3.244545e-01 ];

%-- Image #20:
omc_20 = [ 1.896152e+00 ; 1.593139e+00 ; 1.471911e+00 ];
Tc_20  = [ -1.438329e+02 ; -8.803650e+01 ; 3.961770e+02 ];
omc_error_20 = [ 1.237999e-03 ; 6.848916e-04 ; 1.334498e-03 ];
Tc_error_20  = [ 4.579149e-01 ; 4.102067e-01 ; 3.925124e-01 ];

