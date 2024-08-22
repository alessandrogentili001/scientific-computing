function a = getPolynCoeff(x,y)

% a contains the coefficients of the interpoling polynom
% x contains the nodes  
% y contains the value of f over the nodes

% disp('    cond(Vn)');
n = length(x)-1;
V(:,n+1) = ones(n+1,1); % start from right 
for j = n:-1:1
    V(:,j)=x.*V(:,j+1); % build the Vandermonde matrix 
end
% disp(cond(V));
% a = Gauss(V,y'); % risolviamo un sistema lineare 
a = V\y;
