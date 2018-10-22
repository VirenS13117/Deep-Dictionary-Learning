function [MSE,NMSE,PSNR] = call_DDL_linear_1layer(train_images,test_images,atom)

X_train = train_images;
X_test = test_images;

% D = KSVD(X_train,param);

[D,Z] = DDL_linear_1layer(X_train,atom);  %Linear DDL

%%
% % toc
Z_test = mldivide(D,X_test);
Xrec = D*Z_test;


%% compute error here
SSIM = ssim(Xrec,X_test)
PSNR = psnr(Xrec,X_test)
NMSE = (norm(Xrec-X_test))/norm(X_test)
MSE = mse(Xrec,X_test)

% X = col2im(Xrec,[8,8],[256,256],'distinct');
% imshow(X)
