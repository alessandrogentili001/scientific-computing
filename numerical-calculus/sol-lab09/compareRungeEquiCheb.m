fprintf('compare runge function approximation with and without Chebyschev nodes\n')

% runge function
f = @(x)(1./(1+x.^2));
alfa=-5; beta=5;

% number of nodes
n = 10; 

% plot function
figure(1)
fplot(f,[alfa,beta],'r--')
hold on
xlabel('x')
ylabel('y')
title('runge function approximation')
pause

% equispaced nodes 
x_equi = linspace(alfa,beta,n+1)'; y_equi = f(x_equi);

% get polynom coefficients
a_equi = getPolynCoeff(x_equi,y_equi);

% plot polynom
t = linspace(alfa,beta,100);
yp_equi = polyval(a_equi,t);
plot(t,yp_equi,'b')
pause

% Chebyschev nodes 
xcap = cos((2*(0:n)+1)./(2*n+2)*pi)';
x_cheby = (alfa+beta)./2 + ((alfa-beta)./2).*xcap; y_cheby = f(x_cheby); 

% get polynom coefficients 
a_cheby = getPolynCoeff(x_cheby,y_cheby);

% plot polynom
t = linspace(alfa,beta,100);
yp_cheby = polyval(a_cheby,t);
plot(t,yp_cheby,'y')
pause

legend('runge function','equispaced','Chebyschev')

% show errrors
figure(2)
title('compare errors')
plot(t,abs(f(t)-yp_equi),'b')
hold on
plot(t,abs(f(t)-yp_cheby),'y')
xlabel('t')
ylabel('error')
legend('equispaced','Chebyschev')
