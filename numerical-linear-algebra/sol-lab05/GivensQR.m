function [Q,R] = GivensQR(A)
% implement QR factorization using Givens rotations method  
% A is of the type upper Hessemberg

[n,m] = size(A);
U = eye(n,n);
R = A;
for k=1:m
    x = A(k:k+1,k); normx=norm(x);
    c = x(1)/normx; s=x(2)/normx; G=[c,s;-s,c];
    R(k:k+1,k:m) = G*R(k:k+1,k:m); % modify only rows k and k+1 of R
    U(k:k+1,1:n) = G*U(k:k+1,1:n); % modify only rows k and k+1 of U
end
Q = U';
    
    
    
    
    
    


