function ris = newton1dPolyPlot(a,x0,tollf,tolla,tollr,kmax)

x = x0; 
[y,dy] = evalPoly(a,x); % vevaluate the polynom and its derivative in x
ris(1) = y;
k = 2; 

disp('       k       x_k')

while k <= kmax
    
    disp([k,x])
        
    d = y/dy; 
    x = x - d;
    [y,dy] = evalPoly(a,x); ris(k) = y;
    % criteria on residual
    if abs(y) < tollf, disp(' stop for residual'); return, end 
    % criteria on increment 
    if abs(d) < tollr*abs(x) + tolla, disp(' stop for increment'); return, end 
    % go on
    k = k + 1;
    
end