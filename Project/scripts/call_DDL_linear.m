function [MSE,NMSE,PSNR] = call_DDL_linear(train_images,test_images,atom1,atom2,atom3)

% load('YaleB.mat')
X_train = train_images;
X_test = test_images;

[D1,D2,D3,Z1,Z2,Z3] = DDL_linear(X_train,atom1,atom2,atom3);  %Linear DDL
D = D1*D2*D3;
Z_test = mldivide(D,X_test);
Xrec = D*Z_test;

% compute error here
PSNR = psnr(Xrec,X_test)
NMSE = (norm(Xrec-X_test))/norm(X_test)
MSE = mse(Xrec,X_test)

%X = col2im(Xrec,[8,8],[256,256],'distinct');
% imshow(X)