fprintf('compute nodal polynom for equisapced nodes and Chebyschev nodes\n')

% number of nodes 
n = 10;
n1 = n+1;

% domain
alfa = -1; beta = 1;

% equispaced nodes 
x_e = linspace(alfa,beta,n1)'; 

% Chebyschev nodes 
x_c = cos((2*(0:n)+1)./(2*n+2)*pi)'; 

% valuation points
N = 1000;
t = linspace(alfa,beta,N)';

% nodal polynom
w = @(t,x,N,n1)(prod(t*ones(1,n1)-ones(N,1)*x',2)); 

% plot nodal polynoms
figure(1)
plot(t,w(t,x_e,N,n1),'y') % equispaced
hold on
plot(t,w(t,x_c,N,n1),'g') % Chebyschev 
xlabel('x')
ylabel('y')
title('nodal polynoms')
legend('equispaced','Chebyschev')

% compare the infinite norm 
disp('compare the infinite norm')
disp('  equispaced   Chebyschev')
norm_equi = max(abs(w(t,x_e,N,n1)));
norm_cheby = max(abs(w(t,x_c,N,n1)));
disp([norm_equi,norm_cheby])


