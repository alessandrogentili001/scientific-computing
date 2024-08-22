% verify the accuracy of the Householder method for least sqaure problem

format short e

% generate data
A = [1 2 3 4;
    -1 2 5 -2;
    2 0 4 -3;
    10 -1 -3 0;
    1 1 1 -1];
b = ones(5,1);

% solve 
x = LeastSquareHouseholder(A,b);
disp(['residual norm: ', num2str(norm(b-A*x)/norm(b))]);