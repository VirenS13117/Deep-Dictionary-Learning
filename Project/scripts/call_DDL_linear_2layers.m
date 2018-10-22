function [MSE,NMSE,PSNR] = call_DDL_linear_2layers(train_images,test_images,atom1,atom2)

X_train = train_images;
X_test = test_images;

[D1,D2,Z1,Z2] = DDL_linear_2layers(X_train,atom1,atom2);  %Linear DDL

%%
% % toc
D = D1*D2;
Z_test = mldivide(D,X_test);
Xrec = D*Z_test;

%% compute error here
SSIM = ssim(Xrec,X_test)
PSNR = psnr(Xrec,X_test)
NMSE = (norm(Xrec-X_test))/norm(X_test)
MSE = mse(Xrec,X_test)

% X = col2im(Xrec,[8,8],[256,256],'distinct');
% imshow(X)
