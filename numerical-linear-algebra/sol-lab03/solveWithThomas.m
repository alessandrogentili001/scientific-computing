function x = solveWithThomas(A, f)
% solve the tridiagonal linear system with thomas method
% - step 1: factorize the matrix A in LU
% - step 2: solve Ly = f (lower triang)
% - step 3: solve Ux = y (upper triang)

% extract the diagonals from A
a = diag(A);  
b = [0;diag(A,-1)];
c = diag(A,1);

% compute the coefficient for LU factorization of matrix A 
n = length(a);
alpha = zeros(n,1); 
beta = zeros(n,1);  
alpha(n, 1) = a(1);
for i=2:n
    beta(i, 1) = b(i)/alpha(i-1, 1); % L coeff
    alpha(i, 1) = a(i)-beta(i, 1)*c(i-1); % U coeff
end

% solve Ly = f lower triangular system
y = zeros(n, 1);
y(1, 1) = f(1);
for i=2:n
    y(i,1) = f(i) - beta(i)*y(i-1,1);
end

% solve Ux = y upper triangular system  
x = zeros(n, 1);
x(n,1) = y(n, 1)/alpha(n, 1);
for i=n-1:-1:1
    x(i,1) = (y(i, 1)-c(i)*x(i+1, 1))/alpha(i, 1);
end

disp(' ')
fprintf('Alg. Thomas, residual norm: %d\n', norm(f-A*x))
fprintf('Alg. Thomas, relative residual norm: %d\n', norm(f-A*x)/norm(x))
disp(' ')
