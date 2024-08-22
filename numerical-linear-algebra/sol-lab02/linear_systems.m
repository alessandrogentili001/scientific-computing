% UPPER TRIANGULAR LINEAR SYSTEM
n=6; rng(1); U=triu(randn(n)); y=(-1).^(1:n)';
x = solveUpperTriang(U,y);
disp(['solve upper triangul system'])
disp(['residual :',num2str(norm(y-U*x))])
disp(' ')

% GAUSS ELIMINATION METHOD FOR LINEAR SYSTEM
A = [-2.3 4 -1.5 -1;
    4 -9.2 0.9 5;
    -4 5 -5 5.2;
    -8 8 -13.4 20];
b=[1,-3,3,-2]';
x_gauss=solveWithGauss(A,b);
x_true=A\b;
disp(['Gauss elimination method'])
disp('         rel residual.                rel error. ')
disp([norm(b-A*x_gauss)/norm(b), norm(x_gauss-x_true)/norm(x_true)])