% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 657.463024588419557 ; 657.946859878020746 ];

%-- Principal point:
cc = [ 303.136852735043590 ; 242.569643125626442 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.254027235719493 ; 0.121438593252914 ; -0.000208599447009 ; 0.000019489169867 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 0.318188603531101 ; 0.340463118565274 ];

%-- Principal point uncertainty:
cc_error = [ 0.646821364774696 ; 0.592184317478271 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.002482738480556 ; 0.009863685321321 ; 0.000133840820364 ; 0.000132174551768 ; 0.000000000000000 ];

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
omc_1 = [ 1.654928e+00 ; 1.651990e+00 ; -6.694050e-01 ];
Tc_1  = [ -1.777725e+02 ; -8.387755e+01 ; 8.531470e+02 ];
omc_error_1 = [ 7.556279e-04 ; 9.761975e-04 ; 1.248197e-03 ];
Tc_error_1  = [ 8.399651e-01 ; 7.749027e-01 ; 4.258637e-01 ];

%-- Image #2:
omc_2 = [ 1.849122e+00 ; 1.900689e+00 ; -3.966393e-01 ];
Tc_2  = [ -1.551108e+02 ; -1.594758e+02 ; 7.576537e+02 ];
omc_error_2 = [ 7.937134e-04 ; 9.699440e-04 ; 1.509096e-03 ];
Tc_error_2  = [ 7.499161e-01 ; 6.867928e-01 ; 4.185278e-01 ];

%-- Image #3:
omc_3 = [ 1.742596e+00 ; 2.077768e+00 ; -5.049758e-01 ];
Tc_3  = [ -1.253220e+02 ; -1.747123e+02 ; 7.755768e+02 ];
omc_error_3 = [ 7.264971e-04 ; 1.027760e-03 ; 1.560225e-03 ];
Tc_error_3  = [ 7.666148e-01 ; 7.028456e-01 ; 4.023069e-01 ];

%-- Image #4:
omc_4 = [ 1.828128e+00 ; 2.116859e+00 ; -1.103002e+00 ];
Tc_4  = [ -6.453662e+01 ; -1.549587e+02 ; 7.791379e+02 ];
omc_error_4 = [ 6.521042e-04 ; 1.064806e-03 ; 1.460895e-03 ];
Tc_error_4  = [ 7.726224e-01 ; 7.014740e-01 ; 3.240765e-01 ];

%-- Image #5:
omc_5 = [ 1.079364e+00 ; 1.922483e+00 ; -2.531021e-01 ];
Tc_5  = [ -9.239900e+01 ; -2.290580e+02 ; 7.368642e+02 ];
omc_error_5 = [ 6.368614e-04 ; 9.927295e-04 ; 1.118389e-03 ];
Tc_error_5  = [ 7.360472e-01 ; 6.694892e-01 ; 3.960951e-01 ];

%-- Image #6:
omc_6 = [ -1.701347e+00 ; -1.929109e+00 ; -7.917744e-01 ];
Tc_6  = [ -1.489511e+02 ; -7.969994e+01 ; 4.447635e+02 ];
omc_error_6 = [ 6.120461e-04 ; 9.909008e-04 ; 1.342096e-03 ];
Tc_error_6  = [ 4.407952e-01 ; 4.136450e-01 ; 3.386549e-01 ];

%-- Image #7:
omc_7 = [ 1.996584e+00 ; 1.931515e+00 ; 1.311022e+00 ];
Tc_7  = [ -8.303043e+01 ; -7.776461e+01 ; 4.401634e+02 ];
omc_error_7 = [ 1.171880e-03 ; 6.020204e-04 ; 1.408372e-03 ];
Tc_error_7  = [ 4.430628e-01 ; 4.044124e-01 ; 3.577742e-01 ];

%-- Image #8:
omc_8 = [ 1.961143e+00 ; 1.824220e+00 ; 1.326778e+00 ];
Tc_8  = [ -1.701872e+02 ; -1.035784e+02 ; 4.620017e+02 ];
omc_error_8 = [ 1.118755e-03 ; 6.142454e-04 ; 1.350931e-03 ];
Tc_error_8  = [ 4.843093e-01 ; 4.393017e-01 ; 4.030044e-01 ];

%-- Image #9:
omc_9 = [ -1.363619e+00 ; -1.980445e+00 ; 3.210456e-01 ];
Tc_9  = [ -1.953967e+00 ; -2.251607e+02 ; 7.284425e+02 ];
omc_error_9 = [ 7.627067e-04 ; 9.794494e-04 ; 1.262196e-03 ];
Tc_error_9  = [ 7.258485e-01 ; 6.590049e-01 ; 4.118179e-01 ];

%-- Image #10:
omc_10 = [ -1.513021e+00 ; -2.086648e+00 ; 1.888881e-01 ];
Tc_10  = [ -2.964559e+01 ; -3.004831e+02 ; 8.600792e+02 ];
omc_error_10 = [ 9.303618e-04 ; 1.113506e-03 ; 1.677759e-03 ];
Tc_error_10  = [ 8.724457e-01 ; 7.834916e-01 ; 5.466112e-01 ];

%-- Image #11:
omc_11 = [ -1.793031e+00 ; -2.064966e+00 ; -4.800581e-01 ];
Tc_11  = [ -1.511243e+02 ; -2.354828e+02 ; 7.046448e+02 ];
omc_error_11 = [ 8.348859e-04 ; 1.051076e-03 ; 1.806837e-03 ];
Tc_error_11  = [ 7.152126e-01 ; 6.709860e-01 ; 5.408608e-01 ];

%-- Image #12:
omc_12 = [ -1.838801e+00 ; -2.087239e+00 ; -5.158076e-01 ];
Tc_12  = [ -1.335496e+02 ; -1.773141e+02 ; 6.048336e+02 ];
omc_error_12 = [ 7.113807e-04 ; 1.009613e-03 ; 1.665873e-03 ];
Tc_error_12  = [ 6.091256e-01 ; 5.673268e-01 ; 4.521094e-01 ];

%-- Image #13:
omc_13 = [ -1.918715e+00 ; -2.116505e+00 ; -5.945309e-01 ];
Tc_13  = [ -1.327535e+02 ; -1.436469e+02 ; 5.446942e+02 ];
omc_error_13 = [ 6.635601e-04 ; 9.992848e-04 ; 1.637761e-03 ];
Tc_error_13  = [ 5.469905e-01 ; 5.078464e-01 ; 4.103313e-01 ];

%-- Image #14:
omc_14 = [ -1.954107e+00 ; -2.124529e+00 ; -5.849560e-01 ];
Tc_14  = [ -1.236532e+02 ; -1.372116e+02 ; 4.907438e+02 ];
omc_error_14 = [ 6.245085e-04 ; 9.794656e-04 ; 1.603351e-03 ];
Tc_error_14  = [ 4.935255e-01 ; 4.570918e-01 ; 3.682275e-01 ];

%-- Image #15:
omc_15 = [ -2.110566e+00 ; -2.253735e+00 ; -4.956812e-01 ];
Tc_15  = [ -1.992013e+02 ; -1.345714e+02 ; 4.748872e+02 ];
omc_error_15 = [ 7.212008e-04 ; 9.179449e-04 ; 1.748455e-03 ];
Tc_error_15  = [ 4.839452e-01 ; 4.533435e-01 ; 3.970588e-01 ];

%-- Image #16:
omc_16 = [ 1.887030e+00 ; 2.336243e+00 ; -1.738229e-01 ];
Tc_16  = [ -1.600968e+01 ; -1.704002e+02 ; 6.956756e+02 ];
omc_error_16 = [ 9.919274e-04 ; 1.047979e-03 ; 2.180144e-03 ];
Tc_error_16  = [ 6.888383e-01 ; 6.256238e-01 ; 4.702826e-01 ];

%-- Image #17:
omc_17 = [ -1.612583e+00 ; -1.953293e+00 ; -3.477433e-01 ];
Tc_17  = [ -1.352756e+02 ; -1.389984e+02 ; 4.899671e+02 ];
omc_error_17 = [ 6.169674e-04 ; 9.435885e-04 ; 1.330107e-03 ];
Tc_error_17  = [ 4.870978e-01 ; 4.533526e-01 ; 3.263084e-01 ];

%-- Image #18:
omc_18 = [ -1.341591e+00 ; -1.692585e+00 ; -2.972897e-01 ];
Tc_18  = [ -1.854394e+02 ; -1.578337e+02 ; 4.410358e+02 ];
omc_error_18 = [ 7.083411e-04 ; 9.165541e-04 ; 1.050340e-03 ];
Tc_error_18  = [ 4.428014e-01 ; 4.132089e-01 ; 3.171112e-01 ];

%-- Image #19:
omc_19 = [ -1.925664e+00 ; -1.837985e+00 ; -1.440614e+00 ];
Tc_19  = [ -1.066232e+02 ; -7.960084e+01 ; 3.340899e+02 ];
omc_error_19 = [ 6.093761e-04 ; 1.074328e-03 ; 1.361187e-03 ];
Tc_error_19  = [ 3.437378e-01 ; 3.154384e-01 ; 2.973880e-01 ];

%-- Image #20:
omc_20 = [ 1.895970e+00 ; 1.593180e+00 ; 1.471968e+00 ];
Tc_20  = [ -1.439594e+02 ; -8.800884e+01 ; 3.963770e+02 ];
omc_error_20 = [ 1.134726e-03 ; 6.280016e-04 ; 1.223605e-03 ];
Tc_error_20  = [ 4.197917e-01 ; 3.762219e-01 ; 3.599803e-01 ];

