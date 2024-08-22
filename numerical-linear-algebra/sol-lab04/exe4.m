% for n1 = 10 compute the spectral radius ρ(B), where B is the iteration
% matrix for each method, in this case explicitely computed. 
% Compare the speed of convergence of both method Jacobi and Gauss-Seidel,
% showing in aplot (Figure 3) the values of ρ(B)
% k for k = 1, 2, ....

% generate data
n1 = 10;
[A,f] = poisson2d(n1);
n = size(A,1);
% initial parameters 
x0 = zeros(n,1);
maxit = 5000;
tol = 1*10^-8;
% compute the iteration matrix for Jacobi and its spectral radius 
B_J = diag(diag(A))\(tril(A,-1)+triu(A,1)); 
rhoJ = max(abs(eig(full(B_J)))); 
% compute the iteration matrix for Gauss-Seidel and its spectral radius
B_GS = tril(A)\triu(A,1); 
rhoGS = max(abs(eig(full(B_GS)))); 
% plot 
figure(15)
[xJ,itsJ,normrJ] = solveWithJacobi(A,f,x0,maxit,tol); % Jacobi method
semilogy(1:itsJ,normrJ/normrJ(1),'r')
hold on
semilogy(rhoJ.^(0:itsJ),'r--')
[xGS,itsGS,normrGS] = solveWithGaussSeidel(A,f,x0,maxit,tol); % Gauss-Seidel
semilogy(1:itsGS,normrGS/normrGS(1),'k')
hold on
semilogy(rhoGS.^(0:itsGS),'k--')
hold off
title('spectral radius of iteration matrices analysis')
legend('Jacobi','rho J','Gauss-Seidel','rho GS')
xlabel('iterations')
ylabel('relative residual norm')
fprintf('\n')
fprintf('rho Jacobi: %d rho Gauss-Seidel: %d \n',rhoJ,rhoGS)







