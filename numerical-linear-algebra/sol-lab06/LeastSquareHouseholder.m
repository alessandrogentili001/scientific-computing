function [x] = LeastSquareHouseholder(A,b)
% use the Householder method for QR factorization in order to solve the
% least square problem

[n,m]=size(A);
R = A;
% U=eye(n);
for k=1:m
    % iteration
    x = R(k:n,k); 
    alpha = -sign(x(1))*norm(x); % build
    v = x-alpha*eye(n-k+1,1);    % Householder
    betha = 2/(v.'*v);           % vector
    R(k:n,k:m) = R(k:n,k:m)-betha*(v*(v.'*R(k:n,k:m))); % applay Householder vector to R
    % useless: U(k:n,1:n) = U(k:n,1:n)-betha*(v*(v.'*U(k:n,1:n))); % update orthogonal matrix  
    b(k:n,1) = b(k:n,1)-betha*(v*(v.'*b(k:n,1))); % modify directlty b
end
% Q=U';
b_tilde = b(1:m,1); % extract the first m component
R1 = R(1:m,:); % extract the upper triangular from R
% addpath("scientific-computing\numerical-linear-algebra\sol-lab02");
x = solveUpperTriang(R1,b_tilde); 



