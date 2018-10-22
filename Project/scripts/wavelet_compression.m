function result = wavelet_compression(X,size_of_rows,ncoef)

x = reshape(X,size_of_rows,size_of_rows);
qmf=MakeONFilter('Daubechies',8);
coarse_level = 1;
wlenna=(FWT2_PO(x,coarse_level,qmf));
% AutoImage(wlenna);
% title('Wavelet Transform - 1 Level');
% uiwait;
%% Ilustrating the non-zero elements of the WTransform matrix

coef_sort = sort(abs(wlenna(:)));
%threshold = coef_sort(floor((1-ncoef)*size_of_rows*size_of_rows));
threshold = coef_sort(end-ncoef+1,1);
% threshold = coef_sort(0.75*size_of_rows*size_of_rows);

a = (abs(wlenna)>threshold);
new_wlenna=(wlenna.*a);

%% Getting the image back
result = IWT2_PO(new_wlenna,coarse_level,qmf);

