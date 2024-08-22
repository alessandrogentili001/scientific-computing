function [x,its,normres] = solveWithGaussSeidel(A,f,x0,maxit,tol)
% implement the iterative Gauss-Seidel method to solve a linear system  Ax = f

r = f-A*x0;
x = x0;
normres(1) = norm(f-A*x);
P = tril(A);
its = 1;
% disp('  num.iter     norm residual')
while normres(its)/normr(1) > tol
    % iteration
    x = x + solveLowerTriang(P,r);
    % residual
    r = f - A*x;
    % update iteration
    its = its+1;
    % convergence history
    normres(its) = norm(r);
    % disp([its,normres(its)])
    % max iterations reached
    if its>=maxit, break,end
end