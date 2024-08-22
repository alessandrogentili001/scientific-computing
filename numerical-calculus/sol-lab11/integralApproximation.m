fprintf('numerical approximation of an integral\n')

% In the study of infrared cameras, the calculation of the energy emitted 
% in the (infrared) spectrum by a black body for certain wavelengths 
% requires the approximation of the following integral:

a = 3e-4; b = 14e-4; % extremal domain 
T = 213; % temperature in kelvin of the black body
coeff = 2.39e-11; % coeff 

% function to be integrated, where x is the wave length
f = @(x)(coeff.*(1./(x.^5.*(exp(1.432./T.*x))-1)));  

figure(1)
title('function to be integrated') % almost constant 
fplot(f,[a,b],'k')

% integral approximation 
x0 = (b-a)/2; % node 
I0 = (b-a)*f(x0); % rectangle formula
I1 = (b-a)*(f(a)+f(b))/2; % trapezius formula
I2 = (b-a)*(f(a)+4*f(x0)+f(b))/6; % cavalieri-simpson formula

% comput ethe error 
E = 0.020690855481654; % true result
err0 = abs(E-I0);
err1 = abs(E-I1);
err2 = abs(E-I2);

disp('    err0      err1      err2') 
disp([err0,err1,err2])




