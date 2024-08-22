% compare execution time between Jacobi and Gauss-Seidel

% set parameters fro iterations
maxit = 1000;
tol = 1e-8;

disp('   n1     Jacobi     Gauss-Seidel')
disp('           Time         Time')

% iterate over data dimension
for n1=10:10:60
    % create data
    [A,f] = poisson2d(n1);
    n = size(A,1);
    % initial iteration
    x0 = zeros(n,1);
    % Jacobi method 
    tic;
    [xJ,itsJ,normrJ] = solveWithJacobi(A,f,x0,maxit,tol);
    timeJ = toc; 
    % plot jacobi 
    figure(n1)
    semilogy(1:itsJ,normrJ/normrJ(1),'r')
    hold on
    % Gauss-Seidel method 
    tic;
    [xGS,itsGS,normrGS] = solveWithGaussSeidel(A,f,x0,maxit,tol);
    timeGS = toc;
    % plot Gauss-Seidel
    semilogy(1:itsGS,normrGS/normrGS(1),'k')
    hold off
    % describe plot 
    title(['dim:' num2str(n)])
    xlabel('number of iterations')
    ylabel('relative norm of residual')
    legend('Jacobi','Gauss-Seidel')
    disp([ n1, timeJ, timeGS])
end