function [ind,x,y,k] = newton1d(f,df,x0,tollf,tolla,tollr,kmax)
% implement the newton method to find zeros of a function

ind = -1;
x = x0; y = f(x);
k = 1; 

disp('       k       x_k')

while k <= kmax
    
    disp([k,x])
        
    d = y/(df(x)); 
    x = x - d;
    y = f(x);
    % criteria on residual
    if abs(y) < tollf, ind = 2; return, end 
    % creteria on increment
    if abs(d) < tollr*abs(x) + tolla, ind = 1; return, end 
    % go on
    k = k + 1;
    
end

    
    
    
    
    
    