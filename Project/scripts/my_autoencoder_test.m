function [MSE,NMSE,PSNR,Xrec] = my_autoencoder_test(autoencoder_layers,test_images)
%% encode the test images
encoded_image = test_images;

% decoded_image = predict(autoencoder_layers(1,2),encoded_image);
% decoded_image = predict(autoencoder_layers(1,2),decoded_image);

number_of_layers = size(autoencoder_layers,2);
for i=1:number_of_layers
    encoded_image = encode(autoencoder_layers(1,i),encoded_image);
end
decoded_image = encoded_image;
for i=1:number_of_layers
    decoded_image = decode(autoencoder_layers(1,number_of_layers-i+1),decoded_image);
end

%% Compute error
Xrec = decoded_image;
PSNR = psnr(Xrec,test_images)
NMSE = (norm(Xrec-test_images))/norm(test_images)
MSE = mse(Xrec,test_images)
