function [Q,R] = HouseholderQR(A)
% implement QR factorization with Householder method 
% A is a tall matrix 

[n,m] = size(A);
R = A;
U = eye(n);
for k=1:m
    % iteration
    x = R(k:n,k);
    alpha = -sign(x(1))*norm(x); % build
    v = x-alpha*eye(n-k+1,1);    % Householder
    betha = 2/(v'*v);            % vector
    R(k:n,k:m) = R(k:n,k:m)-betha*(v*(v.'*R(k:n,k:m))); % apply Householder matrix to R, and so to x 
    U(k:n,1:n) = U(k:n,1:n)-betha*(v*(v.'*U(k:n,1:n))); % update the orthonomal matrix 

%   if R(k,k) < 1*10^(-13)
%       disp('la matrice non ha rango massimo')
%       R(k,k)=0;
%       U(k,k)=0;
%   end
end
Q = U';
    