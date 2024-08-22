% verify the power method to compute eigenvalues and  the correspondent
% eigenvectors 

% define data
Q = randn(10,10);
A = Q * diag(1 : 10)/Q; % non è simmetrica
% Spec(A) = {1,2,3,...,10}

% parameters
maxit = 500; tol = 1e-8; x0 = rand(10,1);

% power method 
[x1,lambda1,err1,coeff1] = eigPower2(A,x0,maxit,tol);

% plot results 
figure(1)
semilogy(err1);
hold on
semilogy(coeff1);
hold off
xlabel('num iterations'); ylabel('error')
legend('||lambda-lambda1||','||lambda2/lambda1||^k')
title('power method with non symmetrical matrix')

% the power method shows linear convergence in lambda 
% and x to the correct solution (x*,lambda*)
%--------------------------------------------------------------

% new data
Qor = orth(Q);
Asim = Qor * diag(1:10) * Qor'; % now its symmetric 
% Spec(A) = {1,2,3,...,10}        

% power method 
[x2,lambda2,err2,coeff2] = eigPower2(Asim,x0,maxit,tol);
figure(2)
semilogy(err2);
hold on
semilogy(coeff2);
hold off
xlabel('num iterations'); ylabel('error')
legend('||lambda-lambda1||','||lambda2/lambda1||^k')
title('power method with symmetrical matrix')

% the power method shows quadratic convergence in lambda 
% and x to the correct solution (x*,lambda*)
%-----------------------------------------------------------

% find the smallest eigenvalues of A
[x3,lambda3,err3,coeff3] = eigPowerInv2(A,0,x0,maxit,tol);
figure(3)
semilogy(err3);
hold on
semilogy(coeff3);
hold off
xlabel('num iterations'); ylabel('error')
legend('||lambda-lambda1||','||lambda2/lambda1||^k')
title('inverse power method')

%-----------------------------------------------------------

% approx the second least eigenvalue of A, in this case 2
for i=5:5:45
    sigma = 1.50+(0.01)*i;
    [x,lambda4,coeff4] = eigPowerInv3(A,sigma,x0,maxit,tol);
    disp([sigma,lambda4]);
    figure(4)
    semilogy(coeff4);
    hold on
end
hold off
xlabel('num iteration'); ylabel('coeff of convergence')
legend('1.55','1.60','1.65','1.70','1.75','1.80','1.85','1.90','1.95')
title('inverse shifted power method')

% for bigger sigma the speed of convergence growth 
% becouse the matrix A-sigma*I is close to be singular  
% and so we need less iterations to reach the goal

