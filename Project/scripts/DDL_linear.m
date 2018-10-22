function [D1,D2,D3,Z1,Z2,Z3] = DDL_linear(X,atom1,atom2,atom3)

lam = 0.001;
maxIter = 50;

%for CIFAR
% atom1 = 60;
% atom2 = 30;
% atom3 = 20;

% for MNIST
% atom1 = 40;
% atom2 = 20;
% atom3 = 10;

[Q,R]=qr(X);
D1 = Q(:,1:atom1);
D1 = normc(D1);
Z1 = mldivide(D1,X);

[Q R] = qr(Z1);                                         
D2 = Q(:,1:atom2);
D2 = normc(D2);
Z2 = mldivide(D2,Z1);

[Q R] = qr(Z2);
D3 = Q(:,1:atom3);
D3 = normc(D3);
Z3 = mldivide(D3,Z2);

for iter = 1:maxIter
    % update dictionary 1
    D1 = X/Z1;
    D1 = normc(D1);
    % update dictionary 2
    D2 = Z1/Z2;
    D2 = normc(D2);
    % update dictionary 3
    D3 = Z2/Z3;
    D3 = normc(D3);
%   ||X1 - A1z1||
    X1 = [X;D2*Z2];
    A1 = [D1; eye(size(D2*Z2,1),size(D1,2))];
    Z1 = mldivide(A1,X1);
    
    X2 = [Z1;D3*Z3];
    A2 = [D2;eye(size(D3*Z3,1),size(D2,2))];
    Z2 = mldivide(A2,X2);

    Z3 = mldivide(D3,Z2);

end
    