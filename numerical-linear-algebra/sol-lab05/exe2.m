% verify the accuracy of the QR factorization using the Householder method

format short e

% create data 
A = randn(10,6);

% build factorization
[Q,R] = HouseholderQR(A);

% plot results 
tab = [norm(eye(10)-Q.'*Q), norm(A-Q*R), cond(A), cond(R)];
disp('  ||I − Q^TQ|| ||A − QR||   cond(A)    cond(R)')
disp(tab)