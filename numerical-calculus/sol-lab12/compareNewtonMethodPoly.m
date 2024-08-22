fprintf('compare newton methods on polynomial function\n')

% polynomial funciton 
p = @(x)(x.^3 - 2.*x - 5); dp = @(x)(3.*x.^2 - 2);

% plot  
figure(1)
fplot(p)
title('polynomial funciton')
legend('f')

% true result 
x_star = 2.094551481542328;

% newton method for polynomial function
x0 = 3; kmax = 100; tollf = 10^-8; tollr = 0; tolla = 0;
a = [-5,-2,0,1]; % coeff of the polynom
risNP = newton1dPoly(a,x0,tollf,tolla,tollr,kmax);

% newton method
x0 = 3; kmax = 100; tollf = 10^-8; tollr = 0; tolla = 0;
risN = newton1d(p,dp,x0,tollf,tolla,tollr,kmax);

% compare convergence for the two methods 
risNP = newton1dPolyPlot(a,x0,tollf,tolla,tollr,kmax);
risN = newton1dPlot(p,dp,x0,tollf,tolla,tollr,kmax);

% plot convergence
figure(2)
semilogy((1:length(risNP)),risNP)
hold on
semilogy((1:length(risN)),risN)
title('compare convergence')
legend('newtonPoly','newton')






