% verify the accuracy of the QR factorization using Gram-Schmidt method  

format short e

% matrix with maximum rank
A = [1,2,3,4; -1,2,5,-2; 2,0,4,-3; 10,-1,-3,0; 1,1,1,-1];
[Q1,R1] = GramQR(A);

tab = [norm(eye(4)-Q1.'*Q1), norm(A-Q1*R1), cond(A), cond(R1)];
disp('matrix with maximum rank')
disp('||I − Q1^TQ1|| ||A − Q1R1||   cond(A)     cond(R1)')
disp(tab)

% matrix with no maximum rank
A = [1,2,-5,4; -1,2,-7,-2; 2,0,2,-3; 10,-1,13,0; 1,1,-2,-1];
[Q1,R1] = GramQR(A);

tab = [norm(eye(4)-Q1.'*Q1), norm(A-Q1*R1), cond(A), cond(R1)];
disp('matrix with no maximum rank')
disp('||I − Q1^TQ1|| ||A − Q1R1||   cond(A)     cond(R1)')
disp(tab)


