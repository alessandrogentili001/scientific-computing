function [x] = LeastSquareCholesky(A,b)
% use Cholesky decomposition: A^TA = LL^T
% to solve least square probelm trought normal equation: (A^TA)x = A^Tb

M = (A')*A; 
[L,flag] = chol(M,'lower');
if flag > 0 % factorization stopped before full completing  
   q = flag-1; % last column reached by factorization
   % L is lower triangular matrix in the factorization
   disp('Cholesky factorization is not completed, so the obtained matrix is not positive definite')
   % disp('|| M(1:q,1:q) - LL^T ||')
   % disp(norm(M(1:q,1:q)-(L*L))) 
   x = []; % no solution to the system found
else 
   f = (A')*b;
   y = solveLowerTriang(L,f);
   x = solveUpperTriang(L',y);
end

