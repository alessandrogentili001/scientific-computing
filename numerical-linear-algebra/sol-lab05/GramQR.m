function [Q1,R1] = GramQR(A)
% implement QR factorization using Gram-Schmidt method, A = Q1R1 
% where Q1 is othonormal and R1 is square upper triangular
% A is a tall matrix 

[n,m] = size(A);
Q1 = zeros(n,m); 
R1 = zeros(m,m);
normvec = zeros(m);
for k=1:m
    % iteration on Q
    Q1(:,k) = A(:,k)-Q1(:,1:k-1)*(Q1(:,1:k-1).'*A(:,k));
    % update normvec
    normvec(k) = norm(Q1(:,k));
    % iteration on R
    if normvec(k) < 1*10^(-13) 
        % normvec is close to zero --> matrix has eigenvalue cloe to zero
        disp('matrix A has no maximum rank')
        Q1(:,k) = zeros(n,1);
        R1(k,k) = 0;
    else
        Q1(:,k) = Q1(:,k)/normvec(k);
        R1(k,k) = normvec(k);
    end
    R1(1:k-1,k) = Q1(:,1:k-1).'*A(:,k);
end

    
    
    