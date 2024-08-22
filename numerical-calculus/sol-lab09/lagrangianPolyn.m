fprintf('compute lagrangian polynom\n')

% number of nodes 
n = 10; n1 = n + 1;

% domain 
alfa = -5; beta = 5;

% valuation points
N = 1000;
t = linspace(alfa,beta,N)';

figure(10)
x = linspace(alfa,beta,n1)'; % equispaced nodes
for i=1:n1
    % i-th characteristic lagrangian polynom
    xm = x; xm(i)=[];
    L = @(t)( prod( t*ones(1,n)-ones(N,1)*xm',2)/prod(x(i)-xm) );
    plot(t, L(t))
    hold on
end
title('lagrangian polynom - equispaced nodes')
legend('L0','L1','L2', 'L3', 'L4', 'L5', 'L6', 'L7', 'L8', 'L9', 'L10')
hold off

figure(11)
xcap=cos( (2*(0:n)+1)./(2*n+2)*pi)';
x=(alfa+beta)/2+(beta-alfa)/2*xcap; % Chebyschev nodes
for i=1:n1
    % i-th characteristic lagrangian polynom
    xm = x; xm(i) = [];
    L = @(t)( prod(t*ones(1,n)-ones(N,1)*xm',2)/prod(x(i)-xm) );
    plot(t, L(t))
    hold on
end

title('lagrangian polynom - Chebyschev nodes')
legend('L0','L1','L2', 'L3', 'L4', 'L5', 'L6', 'L7', 'L8', 'L9', 'L10')
hold off







