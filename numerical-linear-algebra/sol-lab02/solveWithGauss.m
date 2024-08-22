function [x] = solveWithGauss(A, y)
% use the gaussian method to solve the linear system Ax = y, where A is a
% square matrix. Main steps:
% - step 1: obtain a new upper triangular linear system using gaussian
% elimination
% - step 2: apply the solveUpperTriang function to solve the new linear
% system 

n=length(y);
for k=1:n-1
 m = A(k+1:n,k)/A(k,k);
 A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - m*A(k,k+1:n);
 y(k+1:n) = y(k+1:n) - m*y(k);
end
U=triu(A); % extract the upper triangular part
x = solveUpperTriang(U,y); % solve the new system
end 