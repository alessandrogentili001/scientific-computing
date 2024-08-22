function [x, x_true] = compute_exp(t, kmax, tol)
% approx the exponential function using the taylor series 

% compute the exact result 
format long e
x_true = exp(t);

% initialize the iterative approach
x = 1; 
err = zeros(kmax);
fact = 1;
for k=1:kmax
    fact = fact*k;
    x = x + t^k/fact;
    err(k) = abs(x-x_true);
    disp([k,x,x_true, err(k)])
    if (err(k) < tol), break,end 
end
semilogy(err,'ro')
end