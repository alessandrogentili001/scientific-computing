function [x,its,normres] = solveWithJacobi(A,f,x0,maxit,tol)
% implement the iterative Jacobi method to solve a linear system  Ax = f

r = f-A*x0;
x = x0;
normres0 = norm(r);
normres(1) = normres0;
p = diag(A);
its = 1;
% disp('  num.iter   norm residual');
while normres(its)/normres0 > tol
    % iteration
    x = x+r./p;
    % residual
    r = f-A*x;
    % update iteration
    its = its+1;
    % convergence history
    normres(its) = norm(r);
    % disp([its,normres(its)])
    % max iterations reached 
    if its>=maxit, break,end
end
    
    
