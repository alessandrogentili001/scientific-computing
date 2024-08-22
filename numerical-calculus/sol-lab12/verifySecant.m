fprintf('verify secant method\n')

% function
f = @(x)(x.^2 - 4);

% plot function
figure(1)
fplot(f,[0,5])
title('function')
legend('f')

% secant method 
tollf = 10^-8; tollr = 0; tolla = 10^-8; kmax = 100;
x0 = 1; x1 = 3;
ris = secant(f,x0,x1,tollf,tolla,tollr,kmax);

% secant method for the plot 
ris = secantPlot(f,x0,x1,tollf,tolla,tollr,kmax);

% plot the convergence 
figure(2)
plot((1:length(ris)),ris)
title('convergence')
legend('secant method')
xlabel('step')
ylabel('residual')
