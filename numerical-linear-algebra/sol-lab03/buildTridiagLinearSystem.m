function [A,f] = buildTridiagLinearSystem(n)
% we want to study the tridiagonal linear system Ax = f
% build tridiagonal matrix A and vector f 

% generate data points 
x = linspace(0,2*pi,n+2); 
x = x(2:n+1);
% generate vector 
f = sin(x);
% generate tridiagonal matrix 
A = (diag(2*ones(n,1)) + diag(-ones(n-1,1),1) + diag(-ones(n-1,1),-1));
A = ( (n+1)^2/(4*pi^2) )*A;
end
