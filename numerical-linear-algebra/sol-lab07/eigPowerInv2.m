function [x,lambda,err,coeff] = eigPowerInv2(A,sigma,x0,maxit,tol)

% approx the smallest eigenvalue of A
% sigma = 0
x = x0/norm(x0);
% n = length(x);
% A = A-sigma*eye(n); % shifetd matrix
% sim = norm(A-A'); disp(sim);
[L,U] = lu(A); y=U\(L\x);  
its = 1;
while its < maxit
    % compute lambda parameters and check the convergence
    theta = x'*y; normtheta = norm(theta);
    r = y-theta*x; normr = norm(r);
    lambda = (1/theta)+sigma; 
    disp([its,normr,normtheta])
    err(its) = norm(lambda-1); coeff(its) = norm(lambda/2)^its;
%     if sim<10^(-15)
%         coeff(its)=norm(1/2)^2*its;
%     else
%         coeff(its)=norm(1/2)^its;
%     end
    if normr/normtheta < tol ,break,end
    % new inverse power iteration
    its = its+1;
    x = y/norm(y);
    y = U\(L\x);
end