function [ind,x1,y1,k] = secant(f,x0,x1,tollf,tolla,tollr,kmax)
% implement secant method for finding zeros fo a function

ind = -1;
y0 = f(x0); y1 = f(x1);
k = 1; 

disp('  k      x_k     x_k+1')

while k <= kmax
    
    disp([k,x0,x1])
    
    % secant method iteration
    q = (y1 - y0)/(x1 - x0); 
    d = y1/q; 
    % criteria on residual
    if abs(y1) < tollf, ind = 2; return, end 
    % criteria on increment
    if abs(d) < tollr*abs(x1) + tolla, ind = 1; return, end 
    % go on 
    x0 = x1; y0 = y1; % update index 
    x1 = x1 - d;  
    y1 = f(x1);
    k = k + 1;
    
end


