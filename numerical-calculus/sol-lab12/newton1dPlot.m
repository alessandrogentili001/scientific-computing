function ris = newton1dPlot(f,df,x0,tollf,tolla,tollr,kmax)

x = x0; y = f(x);
ris(1) = abs(y);
k = 1; 

while k <= kmax
        
    d = y/(df(x)); 
    x = x - d; 
    y = f(x); ris(k+1) = abs(y);
    % criteria on residual
    if abs(y) < tollf, disp(' stop for residual '); return, end 
    % criteria on increment 
    if abs(d) < tollr*abs(x) + tolla, disp(' stop for increment '); return, end 
    % go on
    k = k + 1;
    
end
