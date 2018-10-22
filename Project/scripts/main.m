clear;
close all;
%% Making patches of test images
% x = imread('lena_new.tiff');
% x = imresize(rgb2gray(x),0.5);
% train_image_patches = [];
% lena_new_patches = im2double(im2col(x,[8,8],'distinct'));
% save('lena_new_8x8_patches','lena_new_patches');

%% load test images
load('../Data/lena_new_8x8_patches');
X_test = lena_new_patches;

%% 1 layer DDL
%load('../Data/KSVD_single_layer');
%Z_test = mldivide(D,X_test);
% Xrec = D*Z_test;

%% 2 layer DDL
% load('../Data/DDL_32_16'); %4:1
% D = D1*D2;
% Z_test = mldivide(D,X_test);
% Xrec = D*Z_test;
% 
%% 3 layer DDL
% load('../Data/DDL_48_32_16');
% D = D1*D2*D3;
% Z_test = mldivide(D,X_test);
% Xrec = D*Z_test;

%% wavelet compression
% dimension = size(X_test,1)^0.5;
% Xrec = [];
% for i=1:size(X_test,2)
%     test_sample = X_test(:,i);
%     result = wavelet_compression(test_sample,dimension,16);
%     Xrec = [Xrec result(:)];
% end

%% DCT compression
% dimension = size(X_test,1)^0.5;
% Xrec = [];
% for i=1:size(X_test,2)
%     test_sample = X_test(:,i);
%     result = DCT_patches(test_sample,dimension,16);
%     Xrec = [Xrec result(:)];
% end

%% SAE 
load('../Data/SAE_64_32_16');
[MSE,NMSE,PSNR,Xrec] = my_autoencoder_test(autoencoder_layers,X_test);

%% compute error here
SSIM = ssim(Xrec,X_test)
PSNR = psnr(Xrec,X_test)
NMSE = (norm(Xrec-X_test))/norm(X_test)
MSE = mse(Xrec,X_test)

%% reconstruct image
reconstructed_image = col2im(Xrec,[8,8],[256,256],'distinct');
imshow(reconstructed_image)
% imwrite(x,'../Reconstructed_Images/lena_new.tif')
