function a = getPolynCoeffLeastSquare(m,x,y)

% m is the required grade of the polynom
% a coeffs of the polynom
% x nodes
% y values of f over the nodes

n = length(x)-1;
V(:,m+1) = ones(n+1,1); % start form right 
for j = m:-1:1
    V(:,j)=x.*V(:,j+1); % build the Vndermonde matrix 
end
% disp(cond(V));
a = V\y;