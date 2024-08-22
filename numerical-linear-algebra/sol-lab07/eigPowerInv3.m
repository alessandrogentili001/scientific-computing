function [x,lambda,coeff] = eigPowerInv3(A,sigma,x0,maxit,tol)

% approx the second least eigenvalue of A, in this case 2
x = x0/norm(x0);
n = length(x);
A = A-sigma*eye(n); % shifted matrix
% sym = norm(A-A'); disp(sim);
[L,U] = lu(A); y = U\(L\x);  
its = 1;
while its < maxit
    % compute lambda and cehck convergence 
    theta = x'*y; normtheta = norm(theta);
    r = y-theta*x; normr = norm(r);
    lambda = (1/theta)+sigma; 
    disp([its,normr,normtheta])
    coeff(its) = norm(lambda-2/1)^its;
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