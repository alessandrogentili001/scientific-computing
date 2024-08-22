function [x,lambda] = eigPowerInv(A,sigma,x0,maxit,tol)
% implement the shifted inverse power method to compute the closest eigenvalue 
% to a defined shift (sigma) and the corrispondent eigenvector

x = x0/norm(x0);
n = length(x);
A = A-sigma*eye(n); % shifted matrix 
[L,U] = lu(A); y = U\(L\x); % decomposition and solution  
its = 1;
while its < maxit
    % compute the lamda parameters and check convergence
    theta = x'*y; normtheta = norm(theta);
    r = y-theta*x; normr = norm(r);
    disp([its,normr,normtheta])
    if normr/normtheta < tol 
        lambda = (1/theta)+sigma; break,end % eigenvalue
    % new inverse power iteration
    its = its+1;
    x = y/norm(y);
    y = U\(L\x);
end

