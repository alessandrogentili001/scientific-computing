function [x] = solveUpperTriang(U, y)
% solve a linear system Ux = y, where U is an upper triangular square matrix 

[m, n] = size(U);
x = zeros(n, 1);

x(n) = y(n)/U(n, n);
for k = n-1:-1:1
        x(k) = (y(k) - U(k, k+1:n) * x(k+1:n)) / U(k, k);
end

end