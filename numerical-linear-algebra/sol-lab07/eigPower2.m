function [x,lambda,err,coeff] = eigPower2(A,x0,maxit,tol)

x = x0/norm(x0);
y = A*x;
% sym = norm(A-A'); disp(sim);
its = 1;
while its < maxit
    lambda = x'*y; normlambda = norm(lambda);
    r = y-lambda*x; normr = norm(r);
    disp([its,normr,normlambda])
    err(its) = norm(lambda-10); coeff(its) = norm(9/10)^its;
%     if sim<10^(-15)
%         coeff(its)=norm(9/10)^(2*its);
%     else
%         coeff(its)=norm(9/10)^its;
%     end
    if normr/normlambda < tol ,break,end
    its = its+1;
    x = y/norm(y);
    y = A*x;
end
