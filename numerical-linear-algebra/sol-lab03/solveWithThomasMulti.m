function X = solveWithThomasMulti(A,F)
% parallelize solveWithThomas function in order to handle multiple tridiagonal linear systems at the same time  

[n,p] = size(F);

% extract daigonals 
a = diag(A); 
b = [0;diag(A,-1)]; 
c = diag(A,1);

% compute the coefficient for the LU factorization of matrix A 
alpha = zeros(n, 1);
beta = zeros(n, 1);
alpha(1, 1) = a(1);
for i=2:n
    beta(i, 1) = b(i)/alpha(i-1, 1);
    alpha(i, 1) = a(i)-beta(i, 1)*c(i-1);
end

% solve LY = F lower triangular system
Y = zeros(n, p);
Y(1,1:p) = F(1,1:p);
for i=2:n
    Y(i,1:p) = F(i,1:p) - beta(i, 1)*Y(i-1,1:p);
end

% solve UX = Y upper triangular system
X = zeros(n, p);
X(n,1:p) = Y(n,1:p)/alpha(n, 1);
for i=n-1:-1:1
    X(i,1:p) = (Y(i,1:p)-c(i)*X(i+1,1:p))/alpha(i, 1);
end

disp(' ')
fprintf('Alg. ThomasMulti, residual norm: %d\n', norm(F-A*X))
fprintf('Alg. ThomasMulti, relative residual norm: %d\n', norm(F-A*X)/norm(X))
disp(' ')
