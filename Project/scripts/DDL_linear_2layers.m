
function [D1,D2,Z1,Z2] = DDL_linear_2layers(X,atom1,atom2)



lam = 0.001;
maxIter = 50;

[Q,R]=qr(X);
D1 = Q(:,1:atom1);

D1 = normc(D1);
Z1 = mldivide(D1,X);


[Q R] = qr(Z1);
D2 = Q(:,1:atom2);
D2 = normc(D2);
Z2 = mldivide(D2,Z1);

%%
for iter = 1:maxIter
    % update dictionary 1
    D1 = X/Z1;
    D1 = normc(D1);
    % update dictionary 2
    D2 = Z1/Z2;
    D2 = normc(D2);
    % update Z1
%     Z1 = inv(D1'*D1+mu1*eye(size(D1'*D1)))*(D1'*X+mu1*D2*Z2);
%         ||X1 - A1z1||
    X1 = [X;(D2*Z2)];
    A1 = [D1; eye(size(D2*Z2,1),size(D1,2))];
    Z1 = mldivide(A1,X1);
    
    %update Z2
    Z2 = mldivide(D2,Z1);
%     Z2 = my_ISTA(Z1,D2,1,50);
end

