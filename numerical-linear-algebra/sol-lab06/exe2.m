% verify the accuracy of the Cholesky method in order to solve the least
% square problem

format short e

% create data
A = [1 2 3 4;
    -1 2 5 -2;
    2 0 4 -3;
    10 -1 -3 0;
    1 1 1 -1];
b = ones(5,1);

% solve
x = LeastSquareCholesky(A,b);
disp(['residual norm: ', num2str(norm(b-A*x))]);
