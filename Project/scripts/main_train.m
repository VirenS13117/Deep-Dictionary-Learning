clear;
close all;

%% Reading dataset in Patches form
load('../Data/training_CIFAR10_patches');
load('../Data/lena_new_8x8_patches');
train_images = train_image_patches;
test_images = lena_new_patches;

%% Parameters
no_of_layers = 2;
hidden_layers = [32,16];
patches_atom1 = 48;
patches_atom2 = 32;
patches_atom3 = 16;

%% Running dataset in patches form

% 2 layers in Deep Dictionary Learning 
% [MSE,NMSE,PSNR] = call_DDL_linear_2layers(train_images,test_images,patches_atom2,patches_atom3);

% 3 layers in Deep Dictionary Learning
% [MSE,NMSE,PSNR] = call_DDL_linear(train_images,test_images,patches_atom1,patches_atom2,patches_atom3);

% 1 layer in Deep Dictionary Learning
%   [MSE,NMSE,PSNR] = call_DDL_linear_1layer(train_images,test_images,patches_atom3);

%% Stacked Auto Encoder
% autoencoder_layers = my_autoencoder(train_images,no_of_layers,hidden_layers);
% encoded_image = encode(autoencoder_layers(0),test_images);
% encoded_image = encode(autoencoder_layers(1),encoded_image);
% decoded_image = decode(autoencoder_layers(1),encoded_image);
% reconstruction_image = decode(autoencoder_layers(0),decoded_image);
% reconstructed_image = col2im(reconstruction_image,[8,8],[256,256],'distinct');
% imshow(reconstructed_image)

%% Wavelet Compression
% dimension = size(test_images,1)^0.5;
% reconstruction_image = [];
% for i=1:size(test_images,2)
%     test_sample = test_images(:,i);
%     result = wavelet_compression(test_sample,dimension,16);
%     reconstruction_image = [reconstruction_image result(:)];
% end
% PSNR = psnr(reconstruction_image,test_images)
% NMSE = (norm(reconstruction_image-test_images))/norm(test_images)
% MSE = mse(reconstruction_image,test_images)
% reconstructed_image = col2im(reconstruction_image,[8,8],[256,256],'distinct');
% imshow(reconstructed_image)

%% DCT compression
% dimension = size(test_images,1)^0.5;
% reconstruction_image = [];
% for i=1:size(test_images,2)
%     test_sample = test_images(:,i);
%     result = DCT_patches(test_sample,dimension,16);
%     reconstruction_image = [reconstruction_image result(:)];
% end
% PSNR = psnr(reconstruction_image,test_images)
% NMSE = (norm(reconstruction_image-test_images))/norm(test_images)
% MSE = mse(reconstruction_image,test_images)
% reconstructed_image = col2im(reconstruction_image,[8,8],[256,256],'distinct');
% imshow(reconstructed_image)