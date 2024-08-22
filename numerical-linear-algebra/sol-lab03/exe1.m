% solve tridiagonal linear system with thomas algorithm 

% build the linear system 
n = 10;
[A,f] = buildTridiagLinearSystem(n);
f = f';

% solve
u = solveWithThomas(A,f);

% Calculate the condition number of matrix A
cond_A = cond(A);
% Display the condition number
fprintf('Condition number of matrix A: %e\n', cond_A);


