
function [D,Z] = DDL_linear_1layer(X,atom)

maxIter = 50;
[Q,R]=qr(X);
D = Q(:,1:atom);
D = normc(D);
% 
param.L = 3;   % number of elements in each linear combination.
param.K = 8; % number of dictionary elements
param.numIteration = 100; % number of iteration to execute the K-SVD algorithm.

param.errorFlag = 0; % decompose signals until a certain error is reached. do not use fix number of coefficients.
%param.errorGoal = sigma;
param.preserveDCAtom = 1;


%%%%%%%% initial dictionary: Dictionary elements %%%%%%%%
param.InitializationMethod =  'DataElements';
param.displayProgress = 1;

[D,output] = KSVD(D,param);
Z = mldivide(D,X);


