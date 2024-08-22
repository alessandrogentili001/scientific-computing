function [ind,x] = newton1dPoly(a,x0,tollf,tolla,tollr,kmax)
% implement newton methon methof for polynomial function

ind = -1;
x = x0; 
[y,dy] = evalPoly(a,x); % evaluate the polynom and its derivative in x
k = 1; 

disp('       k       x_k')

while k <= kmax
    
    disp([k,x])
        
    d = y/dy; 
    x = x - d;
    [y,dy] = evalPoly(a,x);
    % criteria on residual
    if abs(y) < tollf, ind = 2; return, end 
    % criteria on increment
    if abs(d) < tollr*abs(x) + tolla, ind = 1; return, end 
    % go on
    k = k + 1;
    
end