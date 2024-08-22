function [x,lambda] = eigPower(A,x0,maxit,tol)
% implement the power method in order to compute the gratest eigenvalue and
% the correspondent eigenvector

x = x0/norm(x0);
y = A*x;
its = 1;
while its < maxit
    % compute lamdba and check convergence
    lambda = x'*y; normlambda = norm(lambda);
    r = y-lambda*x; normr = norm(r);
    disp([its,normr,normlambda])
    if normr/normlambda < tol ,break,end
    its = its+1;
    % new power iteration 
    x = y/norm(y);
    y = A*x;
end


