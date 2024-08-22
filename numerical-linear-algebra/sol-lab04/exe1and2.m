% compare convergence history for Jacobi e Gauss-Seidel

% generate data nad initial parameters 
[A,f] = poisson2d(10); x0 = zeros(100,1); maxit = 5000; tol = 1e-8;

% Jacobi
[xJ,itsJ,resnormvecJ] = solveWithJacobi(A,f,x0,maxit,tol);
% Gauss-Seidel
[xGS,itsGS,resnormvecGS] = solveWithGaussSeidel(A,f,x0,maxit,tol);

% plot convergence history
figure(1)
semilogy(resnormvecJ(1:itsJ)/norm(f-A*x0),'-');
hold on
semilogy(resnormvecGS(1:itsGS)/norm(f-A*x0),'-');
title('compare convergence history')
legend('Jacobi','Gauss-Seidel','location','northeast');
xlabel('iterations')
ylabel('residual norm')
