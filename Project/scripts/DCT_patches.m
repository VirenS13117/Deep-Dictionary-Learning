function result = DCT_patches(X,size_of_rows,ncoef)
x = reshape(X,size_of_rows,size_of_rows);

T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(x,[8,8],dct);

coef_sort = sort(abs(B(:)));
threshold = coef_sort(end-ncoef+1,1);
a = (abs(B)>threshold);
new_B = (B.*a);

invdct = @(block_struct) T' * block_struct.data * T;
result = blockproc(new_B,[8 8],invdct);
% imshow(result)



