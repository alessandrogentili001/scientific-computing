% apply the Shermann-Morrison formula to solve a linear system 

% build the linear system 
n = 100;
[A,f] = buildTridiagLinearSystem(n);
f = f';

% build w and v
v = eye(n,1);
coef = (n-1)^2/(4*pi^2);
w = coef*ones(n,1)-A(:,1);

% solve two tridiagonal linear system efficiently
Z = solveWithThomasMulti(A,[w,f]);
w1 = Z(:,1);
w2 = Z(:,2);
theta1 = 1+v'*w1;
theta2 = v'*w2;

% apply the SM formula
x = w2-w1*(theta2/theta1);

% show accuracy without building the matrix B effectively  
normSM = norm( f - A*x - w*(v'*x));
disp(' ')
fprintf('Sherman-Morrison Formula, residual norm: %d\n', normSM)
disp(' ')