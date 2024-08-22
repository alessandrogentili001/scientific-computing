function [A,f]=poisson2d(n)
% build data to resolve the Poisson problem -Delta u = f
% on unitary square with omogeneous Dirichlet boud condition f = 1
% n : number of discretization nodes along each dimension
% A : coeff matrix 
% f : known term

h=(1-0)/(n+1);
M=1/h^2*(spdiags(-2*ones(n,1),0,n,n)+ spdiags(ones(n,1),1,n,n)+ spdiags(ones(n,1),-1,n,n));
I=speye(n);
A=-kron(M,I)-kron(I,M);
f=ones(n^2,1);