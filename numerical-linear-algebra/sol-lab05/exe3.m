% verify the accuracy of the QR factorization using the Givens method

format short e

% create data 
A = [1, 2, 3, 4;
    -4, -1, 5, -2;
    0, 3, 4, -3;
    0, 0, -3, 0;
    0, 0, 0, -1];

% build factorization
[Q,R] = GivensQR(A);

% show results
tab = [norm(eye(5)-Q.'*Q), norm(A-Q*R), cond(A), cond(R)];
disp('||I − Q^TQ|| ||A − QR||   cond(A)    cond(R)')
disp(tab)