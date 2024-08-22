% compare the Householder factorization and the Cholesky factorization in solving the least square problem 

format short e

% known term
b=ones(3,1);
disp(' delta   ||x_true - x_chol||/||x_true||     ||x_true - x_house||/||x_true|| ')
for i=-3:-1:-9
    % set the parameter delta 
    delta(-i-2)=1*10^i;
    % create the matrix A for the system
    A = [1 1;-2 -2;0 delta(-i-2)];
    % use the built in function as a benchmark
    x_true=A\b;
    % Cholesky
    x_chol = LeastSquareCholesky(A,b);
    % Householder
    x_house = LeastSquareHouseholder(A,b);
    % compute errors
    normh(-i-2) = norm(x_true-x_house)/norm(x_true);
    if isempty(x_chol)
       normc(-i-2) = 999;
       disp([delta(-i-2),normc(-i-2),normh(-i-2)]);
    else
       normc(-i-2) = norm(x_true-x_chol)/norm(x_true);
       disp([delta(-i-2),normc(-i-2),normh(-i-2)]);
    end
end

figure(1)
loglog(delta,normc);
hold on
loglog(delta,normh);
hold off
title('compare methods for least square problem')
xlabel('delta')
ylabel('relative error')
legend('Cholesky','Householder')